
//+------------------------------------------------------------------+
//|                                                RSI_SMA_Cross_EA.mq5 |
//|                        Copyright 2024, Your Name                  |
//|                                       www.yourwebsite.com          |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
CTrade trade;

input int RSI_Period = 5;
input int SMA_Period = 21;
input double Lot_Size = 0.01;

// Indicator handles
int handleRSI;
int handleSMA;

// Buffers for indicator values
double rsiBuffer[];
double smaBuffer[];

int OnInit()
  {
   // Load the custom indicator
   handleRSI = iCustom(_Symbol, _Period, "RSI Vs SMA Oscillator", RSI_Period, 0);
   handleSMA = iCustom(_Symbol, _Period, "RSI Vs SMA Oscillator", SMA_Period, 1);

   if(handleRSI == INVALID_HANDLE || handleSMA == INVALID_HANDLE)
     {
      Print("Failed to load custom indicator");
      return(INIT_FAILED);
     }

   return(INIT_SUCCEEDED);
  }

void OnTick()
  {
   // Get the latest values of the indicators
   if(CopyBuffer(handleRSI, 0, 0, 2, rsiBuffer) <= 0 || CopyBuffer(handleSMA, 0, 0, 2, smaBuffer) <= 0)
     {
      Print("Failed to get indicator data");
      return;
     }

   double rsiPrev = rsiBuffer[1];
   double rsiCurr = rsiBuffer[0];
   double smaPrev = smaBuffer[1];
   double smaCurr = smaBuffer[0];

   static bool isBuy = false;

   // Check for crosses and open/close trades
   if(rsiPrev < smaPrev && rsiCurr > smaCurr)
     {
      if(!isBuy)
        {
         trade.Buy(Lot_Size);
         isBuy = true;
         Print("Opened Buy position");
        }
     }
   else if(rsiPrev > smaPrev && rsiCurr < smaCurr)
     {
      if(isBuy)
        {
         CloseAllPositions();
         trade.Sell(Lot_Size);
         isBuy = false;
         Print("Opened Sell position");
        }
     }
  }

void CloseAllPositions()
  {
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      if(PositionSelect(_Symbol))
        {
         ulong ticket = PositionGetTicket(i);
         trade.PositionClose(ticket);
         Print("Closed position with ticket: ", ticket);
        }
     }
  }

void OnDeinit(const int reason)
  {
   IndicatorRelease(handleRSI);
   IndicatorRelease(handleSMA);
  }
//+------------------------------------------------------------------+
