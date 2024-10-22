//+------------------------------------------------------------------+
//|                                                     gpt_test.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define GPT_InputBars         5
#define HistoryBars           40
//+------------------------------------------------------------------+
//| External parameters for script operation                         |
//+------------------------------------------------------------------+
input string   StudyFileName  = "study_data.csv";  // Name of file with the training dataset
input string   OutputFileName = "loss_study_gpt.csv";  // File name to write error dynamics
input int      BarsToLine     = 40;                // Number of historical bars in one pattern
input int      NeuronsToBar   = 4;                 // Number of input layer neurons per 1 bar
input bool     UseOpenCL      = false;             // Use of OpenCL
input int      BatchSize      = 10000;             // Batch size to update the weight matrix
input double   LearningRate   = 0.00003;           // Learning rate
input int      HiddenLayers   = 3;                 // Number of hidden layer
input int      HiddenLayer    = 40;                // Number of neurons in one hidden layer
input int      Epochs         = 1000;              // Number of learning epochs
//+------------------------------------------------------------------+
//| Connect the neural network library                               |
//+------------------------------------------------------------------+
#include <NeuroNetworksBook\realization\neuronnet.mqh>
//+------------------------------------------------------------------+
//| Script program start                                             |
//+------------------------------------------------------------------+
void OnStart(void)
  {
//--- prepare vector for storing the history of network errors
   VECTOR loss_history = VECTOR::Zeros(Epochs);
//--- 1. Network initialization
   CNet net;
   if(!NetworkInitialize(net))
      return;
//--- 2. Loading training set data
   CArrayObj data;
   CArrayObj result;
   if(!LoadTrainingData(StudyFileName, data, result))
      return;
//--- 3. Training the network
   if(!NetworkFit(net, data, result, loss_history))
      return;
//--- 4. Save the history of network errors
   SaveLossHistory(OutputFileName, loss_history);
//--- 5. Save the resulting network
   net.Save("Study.net");
   Print("Done");
  }
//+------------------------------------------------------------------+
//| Load training data                                               |
//+------------------------------------------------------------------+
bool LoadTrainingData(string path, CArrayObj &data, CArrayObj &result)
  {
   CBufferType *pattern;
   CBufferType *target;
//--- open the file with the training dataset
   int handle = FileOpen(path, FILE_READ | FILE_CSV | FILE_ANSI | FILE_SHARE_READ, ",", CP_UTF8);
   if(handle == INVALID_HANDLE)
     {
      PrintFormat("Error of open study data file: %d", GetLastError());
      return false;
     }
//--- display the progress of loading training data in the chart comment
   uint next_comment_time = 0;
   enum
     {
      OutputTimeout = 250 // no more than 1 time every 250 milliseconds
     };
//--- organize loop to load training dataset
   while(!FileIsEnding(handle) && !IsStopped())
     {
      if(!(pattern = new CBufferType()))
        {
         PrintFormat("Error creating Pattern data array: %d", GetLastError());
         return false;
        }
      if(!pattern.BufferInit(1, NeuronsToBar * GPT_InputBars))
         return false;
      if(!(target = new CBufferType()))
        {
         PrintFormat("Error creating Pattern Target array: %d", GetLastError());
         return false;
        }
      if(!target.BufferInit(1, 2))
         return false;
      int skip = (HistoryBars - GPT_InputBars) * NeuronsToBar;
      for(int i = 0; i < NeuronsToBar * HistoryBars; i++)
        {
         TYPE temp = (TYPE)FileReadNumber(handle);
         if(i < skip)
            continue;
         pattern.m_mMatrix[0, i - skip] = temp;
        }
      for(int i = 0; i < 2; i++)
         target.m_mMatrix[0, i] = (TYPE)FileReadNumber(handle);
      if(!data.Add(pattern))
        {
         PrintFormat("Error adding training data to array: %d", GetLastError());
         return false;
        }
      if(!result.Add(target))
        {
         PrintFormat("Error adding training data to array: %d", GetLastError());
         return false;
        }
      //--- show loading progress in the chart comment (no more than 1 time every 250 milliseconds)
      if(next_comment_time < GetTickCount())
        {
         Comment(StringFormat("Patterns loaded: %d", data.Total()));
         next_comment_time = GetTickCount() + OutputTimeout;
        }
     }
   FileClose(handle);
   return(true);
  }
//+------------------------------------------------------------------+
//| Initializing the network architecture                            |
//+------------------------------------------------------------------+
bool CreateLayersDesc(CArrayObj &layers)
  {
   CLayerDescription *descr;
//--- create input data layer
   if(!(descr = new CLayerDescription()))
     {
      PrintFormat("Error creating CLayerDescription: %d", GetLastError());
      return false;
     }
   descr.type         = defNeuronBase;
   int prev_count = descr.count = NeuronsToBar * GPT_InputBars;
   descr.window       = 0;
   descr.activation   = AF_NONE;
   descr.optimization = None;
   if(!layers.Add(descr))
     {
      PrintFormat("Error adding layer: %d", GetLastError());
      delete descr;
      return false;
     }
//--- GPT block
   if(!(descr = new CLayerDescription()))
     {
      PrintFormat("Error creating CLayerDescription: %d", GetLastError());
      delete descr;
      return false;
     }
   descr.type = defNeuronGPT;
   descr.count = BarsToLine;
   descr.window = prev_count;
   descr.window_out = 8;
   descr.step = 8;
   descr.layers = 4;
   descr.activation = AF_NONE;
   descr.optimization = Adam;
   descr.activation_params[0] = 1;
   if(!layers.Add(descr))
     {
      PrintFormat("Error adding layer: %d", GetLastError());
      delete descr;
      return false;
     }
//--- Hidden layer
   if(!(descr = new CLayerDescription()))
     {
      PrintFormat("Error creating CLayerDescription: %d", GetLastError());
      return false;
     }
   descr.type         = defNeuronBase;
   descr.count        = HiddenLayer;
   descr.activation   = AF_SWISH;
   descr.optimization = Adam;
   descr.activation_params[0] = 1;
   for(int i = 0; i < HiddenLayers; i++)
      if(!layers.Add(descr))
        {
         PrintFormat("Error adding layer: %d", GetLastError());
         delete descr;
         return false;
        }
//---  Results layer
   if(!(descr = new CLayerDescription()))
     {
      PrintFormat("Error creating CLayerDescription: %d", GetLastError());
      return false;
     }
   descr.type         = defNeuronBase;
   descr.count        = 2;
   descr.activation   = AF_LINEAR;
   descr.optimization = Adam;
   descr.activation_params[0] = 1;
   if(!layers.Add(descr))
     {
      PrintFormat("Error adding layer: %d", GetLastError());
      delete descr;
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//| Network initialization                                           |
//+------------------------------------------------------------------+
bool NetworkInitialize(CNet &net)
  {
   CArrayObj layers;
//--- create a description of the network layers
   if(!CreateLayersDesc(layers))
      return false;
//--- initialize the network
   if(!net.Create(&layers, (TYPE)LearningRate, (TYPE)0.9, (TYPE)0.999, LOSS_MSE, 0, 0))
     {
      PrintFormat("Error of init Net: %d", GetLastError());
      return false;
     }
   net.UseOpenCL(UseOpenCL);
   net.LossSmoothFactor(BatchSize);
   return true;
  }
//+------------------------------------------------------------------+
//| Network training                                                 |
//+------------------------------------------------------------------+
bool NetworkFit(CNet &net, const CArrayObj &data, const CArrayObj &target, VECTOR &loss_history)
  {
//--- training
   int patterns = data.Total();
//--- loop through epochs
   for(int epoch = 0; epoch < Epochs; epoch++)
     {
      ulong ticks = GetTickCount64();
      //--- train in batches
      //--- select a random pattern
      int k = (int)((double)(MathRand() * MathRand()) / MathPow(32767.0, 2) * (patterns - BarsToLine-1));
      k = fmax(k, 0);
      for(int i = 0; (i < (BatchSize + BarsToLine) && (k + i) < patterns); i++)
        {
         //--- check if training stopped
         if(IsStopped())
           {
            Print("Network fitting stopped by user");
            return true;
           }
         if(!net.FeedForward(data.At(k + i)))
           {
            PrintFormat("Error in FeedForward: %d", GetLastError());
            return false;
           }
         if(i < BarsToLine)
            continue;
         if(!net.Backpropagation(target.At(k + i)))
           {
            PrintFormat("Error in Backpropagation: %d", GetLastError());
            return false;
           }
        }
      //--- reconfigure network weights
      net.UpdateWeights(BatchSize);
      printf("Use OpenCL %s, epoch %d, time %.5f sec", (string)UseOpenCL, epoch, (GetTickCount64() - ticks) / 1000.0);
      //--- report about a completed epoch
      TYPE loss = net.GetRecentAverageLoss();
      Comment(StringFormat("Epoch %d, error %.5f", epoch, loss));
      //--- remember the epoch error for saving to a file
      loss_history[epoch] = loss;
     }
   return true;
  }
//+------------------------------------------------------------------+
//| Save the history of network errors                               |
//+------------------------------------------------------------------+
void SaveLossHistory(string path, const VECTOR &loss_history)
  {
   int handle = FileOpen(OutputFileName, FILE_WRITE | FILE_CSV | FILE_ANSI, ",", CP_UTF8);
   if(handle == INVALID_HANDLE)
      PrintFormat("Error creating loss file: %d", GetLastError());
   else
     {
      for(ulong i = 0; i < loss_history.Size(); i++)
         FileWrite(handle, loss_history[i]);
      FileClose(handle);
      PrintFormat("The dynamics of the error change is saved to a file %s\\%s", TerminalInfoString(TERMINAL_DATA_PATH), OutputFileName);
     }
  }
//+------------------------------------------------------------------+
