mql5
//+------------------------------------------------------------------+
//|                                                          EaStatistic.mq5                                                  |
//|                                        Copyright 2024, Forex Robot EASY Team                                  |
//|                                       Website: https://forexroboteasy.com/                                     |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

// Define the list of currency pairs
input string CurrencyPairs = 'EURUSD,GBPUSD,USDJPY';

// Define Moving Average Periods
input int MA_Periods[6] = {5, 10, 20, 50, 100, 200};

// Define Risk Management parameters
input double LotSize = 0.1;
input double StopLoss = 100;
input double TakeProfit = 200;

// Indicator handles
int handleRSI;
int handleMACD;
int handleBB;
int handleStoch;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Initialize indicators
   handleRSI = iRSI(_Symbol, PERIOD_H1, 14, PRICE_CLOSE);
   handleMACD = iMACD(_Symbol, PERIOD_H1, 12, 26, 9, PRICE_CLOSE);
   handleBB = iBands(_Symbol, PERIOD_H1, 20, 2, 0, PRICE_CLOSE);
   handleStoch = iStochastic(_Symbol, PERIOD_H1, 5, 3, 3, MODE_SMA);

   // Check the validity of the indicator handles
   if(handleRSI <0 || handleMACD<0 || handleBB<0 || handleStoch<0)
     {
      Print('Error initializing indicators');
      return(INIT_FAILED);
     }

   // Successful Initialization
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Release indicator handles
   IndicatorRelease(handleRSI);
   IndicatorRelease(handleMACD);
   IndicatorRelease(handleBB);
   IndicatorRelease(handleStoch);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Split CurrencyPairs into an array
   string pairs[];
   int numPairs = StringSplit(CurrencyPairs, ',', pairs);

   for(int i=0; i<numPairs; i++)
     {
      string pair = pairs[i];

      // Fetch and check the analysis data for each pair
      if(CheckTradeOpportunity(pair))
         ExecuteTrade(pair);
     }
  }

//+------------------------------------------------------------------+
//| Check for a trade opportunity                                    |
//+------------------------------------------------------------------+
bool CheckTradeOpportunity(string pair)
  {
   // Get the latest market data
   double rsiValue = iCustom(pair, PERIOD_H1, handleRSI);
   double macdMain, macdSignal;
   double bbUpper, bbMiddle, bbLower;
   double stochK, stochD;
  
   if(!GetMacdValues(pair, macdMain, macdSignal) ||
      !GetBBValues(pair, bbUpper, bbMiddle, bbLower) ||
      !GetStochasticValues(pair, stochK, stochD))
      {
       return false;
      }
  
   // Apply your trading logic here using the indicator values
   // For simplicity, we assume a basic strategy
   if(rsiValue < 30 && macdMain > macdSignal && stochK < 20)
      return true;
  
   return false;
  }

//+------------------------------------------------------------------+
//| Get MACD values                                                  |
//+------------------------------------------------------------------+
bool GetMacdValues(string pair, double &macdMain, double &macdSignal)
  {
   if(CopyBuffer(handleMACD, 0, 0, 1, macdMain) < 1 ||
      CopyBuffer(handleMACD, 1, 0, 1, macdSignal) < 1)
      {
       Print('Failed to get MACD values for ', pair);
       return false;
      }
   return true;
  }

//+------------------------------------------------------------------+
//| Get Bollinger Bands values                                       |
//+------------------------------------------------------------------+
bool GetBBValues(string pair, double &bbUpper, double &bbMiddle, double &bbLower)
  {
   if(CopyBuffer(handleBB, 0, 0, 1, bbUpper) < 1 ||
      CopyBuffer(handleBB, 1, 0, 1, bbMiddle) < 1 ||
      CopyBuffer(handleBB, 2, 0, 1, bbLower) < 1)
      {
       Print('Failed to get BB values for ', pair);
       return false;
      }
   return true;
  }

//+------------------------------------------------------------------+
//| Get Stochastic values                                            |
//+------------------------------------------------------------------+
bool GetStochasticValues(string pair, double &stochK, double &stochD)
  {
   if(CopyBuffer(handleStoch, 0, 0, 1, stochK) < 1 ||
      CopyBuffer(handleStoch, 1, 0, 1, stochD) < 1)
      {
       Print('Failed to get Stochastic values for ', pair);
       return false;
      }
   return true;
  }

//+------------------------------------------------------------------+
//| Execute a trade based on analysis                                |
//+------------------------------------------------------------------+
void ExecuteTrade(string pair)
  {
   MqlTradeRequest request;
   MqlTradeResult result;
   double price = SymbolInfoDouble(pair, SYMBOL_BID);
   double sl = price - StopLoss * _Point;
   double tp = price + TakeProfit * _Point;

   ZeroMemory(request);
   request.action = TRADE_ACTION_DEAL;
   request.magic = 123456;
   request.symbol = pair;
   request.volume = LotSize;
   request.type = ORDER_TYPE_BUY;
   request.price = price;
   request.sl = sl;
   request.tp = tp;

   if(!OrderSend(request, result))
      Print('Trade failed: ', result.retcode);
   else
      Print('Trade succeeded on ', pair);
  }

//+------------------------------------------------------------------+