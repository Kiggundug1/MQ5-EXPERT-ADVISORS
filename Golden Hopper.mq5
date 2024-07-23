mql4
//+------------------------------------------------------------------+
//|                                                   MA Cloud MT4   |
//|                        Forex Robot EASY Team                     |
//|                    https://forexroboteasy.com/                   |
//|                              2024                                |
//+------------------------------------------------------------------+
#property indicator_separate_window
#property indicator_buffers 4
#property indicator_color1 Green
#property indicator_color2 Red
#property indicator_color3 Yellow
#property indicator_color4 Blue

// Input parameters
input int SlowSMA_Period = 200;
input int SlowEMA_Period = 200;
input int FastSMA_Period = 50;
input int FastEMA_Period = 50;
input color BullishColor = Lime;
input color BearishColor = Red;
input bool EnableAlerts = true;

// Indicator buffers
double SlowSMA_Buffer[];
double SlowEMA_Buffer[];
double FastSMA_Buffer[];
double FastEMA_Buffer[];
double HistogramUp[];
double HistogramDown[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
  // Indicator buffers
  SetIndexBuffer(0, HistogramUp);
  SetIndexBuffer(1, HistogramDown);
  SetIndexBuffer(2, SlowSMA_Buffer);
  SetIndexBuffer(3, SlowEMA_Buffer);
  
  // Set indicator colors
  SetIndexStyle(0, DRAW_HISTOGRAM);
  SetIndexStyle(1, DRAW_HISTOGRAM);
  
  // Indicator labels
  IndicatorShortName('MA Cloud MT4');
  SetIndexLabel(0, 'Histogram Up');
  SetIndexLabel(1, 'Histogram Down');
  
  return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
  // Code for cleanup (if necessary)
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total, 
                const int prev_calculated, 
                const datetime &time[], 
                const double &open[], 
                const double &high[], 
                const double &low[], 
                const double &close[], 
                const long &tick_volume[], 
                const long &volume[], 
                const int &spread[])
{
  // Calculate the moving averages
  for (int i = 0; i < rates_total; i++)
  {
    SlowSMA_Buffer[i] = iMA(NULL,0,SlowSMA_Period,0,MODE_SMA,PRICE_CLOSE,i);
    SlowEMA_Buffer[i] = iMA(NULL,0,SlowEMA_Period,0,MODE_EMA,PRICE_CLOSE,i);
    FastSMA_Buffer[i] = iMA(NULL,0,FastSMA_Period,0,MODE_SMA,PRICE_CLOSE,i);
    FastEMA_Buffer[i] = iMA(NULL,0,FastEMA_Period,0,MODE_EMA,PRICE_CLOSE,i);
  }
  
  // Generate the histogram based on MA differences
  for (int i = 0; i < rates_total; i++)
  {
    double slowDifference = SlowEMA_Buffer[i] - SlowSMA_Buffer[i];
    double fastDifference = FastEMA_Buffer[i] - FastSMA_Buffer[i];
    
    if (fastDifference > slowDifference)
    {
      HistogramUp[i] = fastDifference - slowDifference;
      HistogramDown[i] = 0;
      SetIndexBuffer(0, HistogramUp);
      SetIndexBuffer(1, 0);
      SetIndexColor(0, BullishColor);
    }
    else if (fastDifference < slowDifference)
    {
      HistogramDown[i] = slowDifference - fastDifference;
      HistogramUp[i] = 0;
      SetIndexBuffer(1, HistogramDown);
      SetIndexBuffer(0, 0);
      SetIndexColor(1, BearishColor);
    }
  }
  
  // Generate alerts
  if (EnableAlerts)
  {
    AlertSignals(rates_total);
  }
  
  return(rates_total);
}

//+------------------------------------------------------------------+
//| Function to generate alerts                                      |
//+------------------------------------------------------------------+
void AlertSignals(const int rates_total)
{
  static bool alertFlag = false;

  if (!alertFlag)
  {
    for (int i = rates_total - 2; i > 0; i--)
    {
      if (HistogramUp[i] > 0 && HistogramDown[i+1] > 0)
      {
        Alert('Bullish Momentum Detected');
        alertFlag = true;
        break;
      }
      else if (HistogramDown[i] > 0 && HistogramUp[i+1] > 0)
      {
        Alert('Bearish Momentum Detected');
        alertFlag = true;
        break;
      }
    }
  }
}