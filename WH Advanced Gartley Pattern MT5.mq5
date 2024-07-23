mql5
//+------------------------------------------------------------------+
//|                                                      WH Advanced Gartley Pattern MT5                   |
//|                                 Copyright 2024, Forex Robot EASY Team, https://forexroboteasy.com/     |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>  // Include trade library for order execution

// Input parameters
input int    FastMAPeriod = 12;
input int    SlowMAPeriod = 26;
input int    SignalMAPeriod = 9;
input int    RSI_Period = 14;
input int    LotSize = 1;
input double RiskPercentage = 2.0;
input int    StopLoss = 50;
input int    TakeProfit = 100;
input bool   EnableTrailingStop = true;
input int    TrailingStop = 30;
input int    MagicNumber = 123456;

// Global variables
double fastMA, slowMA, signalMA;
double rsiValue;
MqlTradeRequest request;
MqlTradeResult result;
MqlTradeCheckResult check_result;
MqlTick last_tick;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Initialization tasks
   Comment("WH Advanced Gartley Pattern MT5 EA initialized");
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Cleanup tasks
   Comment("");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Get the last tick data
   if(!SymbolInfoTick(_Symbol, last_tick))
     {
      Print("Error getting last tick data: ", GetLastError());
      return;
     }

   // Calculate technical indicators
   fastMA = iMA(_Symbol, PERIOD_CURRENT, FastMAPeriod, 0, MODE_EMA, PRICE_CLOSE, 0);
   slowMA = iMA(_Symbol, PERIOD_CURRENT, SlowMAPeriod, 0, MODE_EMA, PRICE_CLOSE, 0);
   signalMA = iMACD(_Symbol, PERIOD_CURRENT, FastMAPeriod, SlowMAPeriod, SignalMAPeriod, PRICE_CLOSE, MODE_SIGNAL, 0);
   rsiValue = iRSI(_Symbol, PERIOD_CURRENT, RSI_Period, PRICE_CLOSE, 0);

   // Generate trading signals
   if(fastMA > slowMA && rsiValue < 30) // Buy Signal
     {
      OpenOrder(ORDER_TYPE_BUY);
     }
   if(fastMA < slowMA && rsiValue > 70) // Sell Signal
     {
      OpenOrder(ORDER_TYPE_SELL);
     }

   // Trail stops if enabled
   if(EnableTrailingStop)
     {
      TrailStop();
     }
  }
//+------------------------------------------------------------------+
//| Open Order function                                              |
//+------------------------------------------------------------------+
void OpenOrder(int order_type)
  {
   double sl, tp, volume;
   if(order_type == ORDER_TYPE_BUY)
     {
      sl = last_tick.bid - StopLoss * _Point;
      tp = last_tick.bid + TakeProfit * _Point;
     }
   else
     {
      sl = last_tick.ask + StopLoss * _Point;
      tp = last_tick.ask - TakeProfit * _Point;
     }

   volume = CalculateLotSize();

   request.action = TRADE_ACTION_DEAL;
   request.magic = MagicNumber;
   request.symbol = _Symbol;
   request.volume = volume;
   request.type = order_type;
   request.price = (order_type == ORDER_TYPE_BUY) ? last_tick.ask : last_tick.bid;
   request.sl = sl;
   request.tp = tp;
   request.deviation = 10;
   request.type_filling = ORDER_FILLING_IOC;
   
   if(!OrderSend(request, result))
     {
      Print("Error opening order: ", result.retcode);
     }
   else
     {
      Print("Order opened successfully: ", result.retcode);
      // Log the order opening
     }
  }
//+------------------------------------------------------------------+
//| Calculate lot size based on risk percentage                      |
//+------------------------------------------------------------------+
double CalculateLotSize()
  {
   double risk_amount = AccountFreeMargin() * (RiskPercentage / 100.0);
   double lot_size = risk_amount / (StopLoss * _Point);
   return(NormalizeDouble(lot_size, 2));
  }
//+------------------------------------------------------------------+
//| Trail stop loss for open positions                               |
//+------------------------------------------------------------------+
void TrailStop()
  {
   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong ticket = PositionGetTicket(i);
      if(PositionSelectByTicket(ticket))
        {
         double current_price = (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? last_tick.bid : last_tick.ask;
         double new_sl = (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? current_price - TrailingStop * _Point : current_price + TrailingStop * _Point;

         if((PositionGetDouble(POSITION_TYPE) == POSITION_TYPE_BUY && new_sl > PositionGetDouble(POSITION_SL)) ||
            (PositionGetDouble(POSITION_TYPE) == POSITION_TYPE_SELL && new_sl < PositionGetDouble(POSITION_SL)))
           {
            request.action = TRADE_ACTION_SLTP;
            request.symbol = _Symbol;
            request.sl = new_sl;
            request.tp = PositionGetDouble(POSITION_TP);
            request.position = ticket;
            if(!OrderSend(request, result))
              {
               Print("Error modifying order: ", result.retcode);
              }
            else
              {
               Print("Order modified successfully: ", result.retcode);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
