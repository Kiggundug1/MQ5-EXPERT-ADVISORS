//+------------------------------------------------------------------+
//|                                                      EasyEA.mq5  |
//|                        Copyright 2024, MetaTrader 5              |
//|                        https://www.mql5.com                      |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

// Create an instance of CTrade
CTrade trade;

// Indicator handle
int handle;
datetime lastsignal

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  string name = "Market\\Easy Buy Sell Signal.ex5"
   // Initialize the indicator
   handle = iCustom(_Symbol, PERIOD_CURRENT, name);

   // Check if the handle is valid
   if(handle == INVALID_HANDLE)
     {
      Print("Failed to initialize indicator");
      return(INIT_FAILED);
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Release the indicator handle
   IndicatorRelease(handle);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Retrieve the latest signals
   double buySignal = iCustom(NULL, 0, "Easy Buy Sell Signal", 0, 0);
   double sellSignal = iCustom(NULL, 0, "Easy Buy Sell Signal", 1, 0);

   // Check for buy signal
   if(buySignal > 0)
     {
      // Open a buy trade
      if(trade.Buy(0.1, NULL, 0, 0, 0, "Buy Signal"))
        {
         Print("Buy order opened successfully");
        }
      else
        {
         Print("Error opening buy order: ", GetLastError());
        }
     }

   // Check for sell signal
   if(sellSignal > 0)
     {
      // Open a sell trade
      if(trade.Sell(0.1, NULL, 0, 0, 0, "Sell Signal"))
        {
         Print("Sell order opened successfully");
        }
      else
        {
         Print("Error opening sell order: ", GetLastError());
        }
     }
  }
//+------------------------------------------------------------------+
