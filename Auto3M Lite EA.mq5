mql5
//+------------------------------------------------------------------+
//|                                             Auto3M Lite MT5      |
//|                        Copyright 2024, Forex Robot EASY Team     |
//|                            https://forexroboteasy.com/           |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

// Create a trade object
CTrade trade;

// Input parameters
input double SL = 50; // Stop Loss in pips
input double TP = 100; // Take Profit in pips
input double TrailingStop = 30; // Trailing Stop in pips
input ENUM_TIMEFRAMES Timeframe = PERIOD_M5; // Timeframe for indicators

// Bollinger Bands Parameters
input int BB_Period = 20;
input double BB_Deviation = 2.0;

// Stochastic Oscillator Parameters
input int KPeriod = 5;
input int DPeriod = 3;
input int Slowing = 3;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Initialization of global variables, indicators, etc.
   Print('Auto3M Lite MT5 initialized');
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Cleanup any resources if necessary
   Print('Auto3M Lite MT5 deinitialized');
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   ManagePositions();
   ManagePendingOrders();
  }

//+------------------------------------------------------------------+
//| Manage Open Positions                                            |
//+------------------------------------------------------------------+
void ManagePositions()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket = PositionGetTicket(i);
      double positionPrice = PositionGetDouble(POSITION_PRICE_OPEN);
      double currentPrice = PositionGetDouble(POSITION_TYPE)==POSITION_TYPE_BUY ? SymbolInfoDouble(_Symbol, SYMBOL_BID) : SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double stopLevel = positionPrice + PositionGetDouble(POSITION_TYPE)==POSITION_TYPE_BUY ? -TrailingStop*Point : TrailingStop*Point;

      // Trailing Stop Logic
      if((PositionGetDouble(POSITION_TYPE) == POSITION_TYPE_BUY && currentPrice >= stopLevel) || 
         (PositionGetDouble(POSITION_TYPE) == POSITION_TYPE_SELL && currentPrice <= stopLevel))
        {
         trade.PositionModify(ticket, stopLevel, PositionGetDouble(POSITION_TP));
         Print('Trailing stop adjusted for position: ', ticket);
        }
     }
  }

//+------------------------------------------------------------------+
//| Manage Pending Orders                                            |
//+------------------------------------------------------------------+
void ManagePendingOrders()
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_PENDING))
        {
         datetime expiration = OrderGetInteger(ORDER_EXPIRATION);
         if(expiration != 0 && TimeCurrent() >= expiration)
           {
            trade.OrderDelete(OrderGetTicket());
            Print('Pending order deleted: ', OrderGetTicket());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//| Indicator Calculation and Trading Logic                          |
//+------------------------------------------------------------------+
void ExecuteTrades()
  {
   double upperBand[], lowerBand[], middleBand[];
   double stochMain[], stochSignal[];
   
   if(CalculateBBAndStoch(upperBand, middleBand, lowerBand, stochMain, stochSignal))
     {
      double currentAsk = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double currentBid = SymbolInfoDouble(_Symbol, SYMBOL_BID);

      // Buy Signal
      if(currentBid < lowerBand[0] && stochMain[1] < 20 && stochSignal[1] < 20)
        {
         double sl = currentBid - SL * _Point;
         double tp = currentBid + TP * _Point;
         trade.Buy(0.1, _Symbol, currentBid, sl, tp, 'Auto3M Lite Buy');
        }

      // Sell Signal
      if(currentAsk > upperBand[0] && stochMain[1] > 80 && stochSignal[1] > 80)
        {
         double sl = currentAsk + SL * _Point;
         double tp = currentAsk - TP * _Point;
         trade.Sell(0.1, _Symbol, currentAsk, sl, tp, 'Auto3M Lite Sell');
        }
     }
  }

//+------------------------------------------------------------------+
//| Calculate Bollinger Bands and Stochastic Oscillator              |
//+------------------------------------------------------------------+
bool CalculateBBAndStoch(double &upperBand[], double &middleBand[], double &lowerBand[], double &stochMain[], double &stochSignal[])
  {
   ArraySetAsSeries(upperBand, true);
   ArraySetAsSeries(middleBand, true);
   ArraySetAsSeries(lowerBand, true);
   ArraySetAsSeries(stochMain, true);
   ArraySetAsSeries(stochSignal, true);

   int bars = iBars(_Symbol, Timeframe);
   if(bars >= BB_Period && bars >= KPeriod + DPeriod + Slowing)
     {
      if(iBands(_Symbol, Timeframe, BB_Period, 0, BB_Deviation, PRICE_CLOSE, upperBand, middleBand, lowerBand) != INVALID_HANDLE &&
         iStochastic(_Symbol, Timeframe, KPeriod, DPeriod, Slowing, MODE_SMA, PRICE_CLOSE, stochMain, stochSignal) != INVALID_HANDLE)
        {
         return true;
        }
     }
   return false;
  }
  
//+------------------------------------------------------------------+
//| Expert advisor configuration input parameters                    |
//+------------------------------------------------------------------+
input datetime TimeToDeletePendingOrders = D'2024.01.01 00:00';
//+------------------------------------------------------------------+
//| Check for pending order deletion                                 |
//+------------------------------------------------------------------+
void CheckDeletePendingOrders()
  {
   if(TimeToDeletePendingOrders != 0 && TimeCurrent() >= TimeToDeletePendingOrders)
     {
      for(int i = OrdersTotal() - 1; i >= 0; i--)
        {
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
           {
            if(OrderType() == ORDER_TYPE_BUY_STOP || OrderType() == ORDER_TYPE_SELL_STOP)
              {
               trade.OrderDelete(OrderGetTicket());
               Print('Pending order deleted at specified time: ', OrderGetTicket());
              }
           }
        }
     }
  }