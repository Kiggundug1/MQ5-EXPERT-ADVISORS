//+------------------------------------------------------------------+
//|                                       Lesson 6 Trailling ATR.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include      <Trade\Trade.mqh>
#include      <Trade\SYmbolInfo.mqh>
#include      <Trade\PositionInfo.mqh>
// Declaration variable for librari trade function.
CTrade                            trade;
CSymbolInfo                       m_symbol;
CPositionInfo                     m_position;

// Input parameter setup
input    double                   initial_risk=0.01;
input    double                   TP_factor=4; //Take profit factor
input    double                   Trailling= 2;// Trailling Atr
input    double                   Trailling_Step=0.1;// Trigger trailling
input    int                      atr_period=14;// Period of ATR

input    ulong                  m_magicnumber=123456789;
input    ENUM_TIMEFRAMES        timeframe= PERIOD_H1;
input    int                    HL_period =20; // Highest high and low period
input     int                   HL_shift  =2;  // Highest high and low shift
int      input                   MA_period=50;    // Moving average period
int      input                   MA_shift=1;// Moving average Shift

 // Global variable declaration
double                            m_adjustpoint;
ulong                             Slippage;// Slippage 
// Global indicator MA
int                               Handle_MA;
double                              MA_Filter[];

int                                 hand_atr;
double                              atr[];

  //+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
if(!m_symbol.Name(_Symbol))
return  INIT_FAILED;

// Set Trade parameter
trade.SetTypeFillingBySymbol(m_symbol.Name());
trade.SetExpertMagicNumber(m_magicnumber);
trade.SetDeviationInPoints(Slippage);

// Turning 3 or 5 Digit
int    adjustdigit=1;
if(m_symbol.Digits()==3 || m_symbol.Digits()==5)
adjustdigit=10;

m_adjustpoint=adjustdigit*m_symbol.Point();

// Indicator RSI declaration

Handle_MA= iMA(_Symbol,timeframe,MA_period,MA_shift,MODE_EMA,PRICE_CLOSE);
if(Handle_MA==INVALID_HANDLE)
return  INIT_FAILED;

// Indicator RSI declaration

hand_atr= iATR(_Symbol,timeframe,atr_period);
if(hand_atr==INVALID_HANDLE)
return  INIT_FAILED;
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
if(OpenBar(Symbol()))
   {
 // Candle declaration
 double High[],Low[],open[],close[];
 ArraySetAsSeries(High,true);ArraySetAsSeries(Low,true);ArraySetAsSeries(close,true);ArraySetAsSeries(open,true);
 CopyHigh(Symbol(),timeframe,0,1000,High);
 CopyLow(Symbol(),timeframe,0,1000,Low);
 CopyOpen(_Symbol,timeframe,0,100,open);
 CopyClose(_Symbol,timeframe,0,100,close);
// Highest high and lowest low declaration
int highest= ArrayMaximum(High,HL_shift,HL_period);
int lowest= ArrayMinimum(Low,HL_shift,HL_period); 

double  HH= High[highest];
//Drawline(" Kháng Cự ", clrRed,HH);
double  LL= Low[lowest];
//Drawline(" hỗ trợ ", clrBlue,LL);

// Moving average declaration
CopyBuffer(Handle_MA,0,0,100,MA_Filter);
ArraySetAsSeries(MA_Filter,true);
 // Atr declaration
 ArraySetAsSeries(atr,true); CopyBuffer(hand_atr,0,0,50,atr);

//   Broker parameter                                               
    
double point = SymbolInfoDouble(_Symbol,SYMBOL_POINT);
double ask= SymbolInfoDouble(_Symbol,SYMBOL_ASK);
double bid= SymbolInfoDouble(_Symbol,SYMBOL_BID);
double spread=ask-bid;
double stoplevel= (int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_STOPS_LEVEL);
int freezerlevel= (int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_FREEZE_LEVEL); 

 
 // Count bjuy and count sell
 int count_buy=0; int count_sell=0;
 count_position(count_buy,count_sell,atr);

 // Main condition for buy and sell
 
    if(count_buy==0)
     {
       if(ask>(HH) && High[highest] > MA_Filter[highest]  )
        {
         double  entryprice= ask;
         double  sl        = LL;
         double  tp        = entryprice   +TP_factor*atr[1];
         double lotsize    = calculate_lotsize(sl,entryprice);
        if(  bid-sl>stoplevel && tp-bid>stoplevel&& CheckVolumeValue(lotsize) )
         {
         trade.Buy(lotsize,_Symbol,entryprice,sl,tp, " Buy Mr Tan ");
        
         }
       }
     }
    if(count_sell==0)
     {
    if(bid<(LL) && Low[lowest] < MA_Filter[lowest])
        {
         double  entryprice= bid;
         double  sl        = HH;
         double  tp        = entryprice   -TP_factor*atr[1];
         double lotsize    = calculate_lotsize(sl,entryprice);
         if(  sl-ask>stoplevel && ask-tp>stoplevel&& CheckVolumeValue(lotsize) )
         {
          trade.Sell(lotsize,_Symbol,entryprice,sl,tp, " Sell Mr Tan ");
         }
        }
     }
   
  }
 
  }
//+------------------------------------------------------------------+
//|Count position and Trailling Functiom                              |
//+------------------------------------------------------------------+

void  count_position(int &count_buy, int &count_sell, double &_atr[])

  {
   
   count_buy=0; count_sell=0;
   int total_postion=PositionsTotal();
   double cp=0.0, op=0.0, sl=0.0,tp=0.0; ulong ticket=0.0;
   for ( int i=total_postion-1; i>=0; i--)
     {
     if(m_position.SelectByIndex(i))
      {
      if(m_position.Symbol()==_Symbol && m_position.Magic()== m_magicnumber)
       cp=m_position.PriceCurrent();op=m_position.PriceOpen();sl=m_position.StopLoss();tp=m_position.TakeProfit();ticket=m_position.Ticket();
       {       
       if(m_position.PositionType()== POSITION_TYPE_BUY)
        {
        count_buy++;
        double Traill= cp-Trailling*_atr[1];
        if(cp>sl+Trailling_Step*_atr[1] && Traill>sl&& PositionModifyCheck(ticket,Traill,tp,_Symbol))
         {
          trade.PositionModify(ticket,Traill,tp);
         }
        }
      
       if(m_position.PositionType()== POSITION_TYPE_SELL)
        {
         count_sell++;
         double Traill= cp+Trailling*_atr[1];
         if(cp<sl-Trailling_Step*_atr[1] && Traill<sl&& PositionModifyCheck(ticket,Traill,tp,_Symbol))
         
         {
          trade.PositionModify(ticket,Traill,tp);
         }
        }
         
       }
      }
     
     }
  }
    
 // Only buy or sell at new candle
 datetime    mprevBar; 
 bool    OpenBar(string  symbol)
 
 {
  datetime     CurBar=iTime(symbol,timeframe,0);
  if(  CurBar==mprevBar)
    {
     return   false;
    }
    mprevBar=CurBar;
    return  true;
 }
 
 void Drawline(string name, color  Color, double  price)
   {
     if(ObjectFind(0,name)<0)
      {
       ResetLastError();;
      }
     if(!ObjectCreate(0,name,OBJ_HLINE,0,0,price))
     {
      return;
     }
    // Setup color for object
     ObjectSetInteger(0,name,OBJPROP_COLOR,Color);
    // Setup color for object
     ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_DASHDOT);
     // Setup color for object
     ObjectSetInteger(0,name,OBJPROP_WIDTH,2);
     
     if(!ObjectMove(0,name,0,0,price))
     {
      return;
     }
   ChartRedraw();
   }
//+------------------------------------------------------------------+
//| Checking the new values of levels before order modification      |
//+------------------------------------------------------------------+
bool PositionModifyCheck(ulong ticket,double sl,double tp,string symbol)
  {
   CPositionInfo pos;
   COrderInfo    order;
   if (PositionGetString(POSITION_SYMBOL) == symbol)
   {
//--- select order by ticket
   if(pos.SelectByTicket(ticket))
     {
      //--- point size and name of the symbol, for which a pending order was placed
      double point=SymbolInfoDouble(symbol,SYMBOL_POINT);
      //--- check if there are changes in the StopLoss level
      bool StopLossChanged=(MathAbs(pos.StopLoss()-sl)>point);
      //--- if there are any changes in levels
      if(StopLossChanged)// || TakeProfitChanged)
         return(true);  // position can be modified      
      //--- there are no changes in the StopLoss and Takeprofit levels
      else
      //--- notify about the error
         PrintFormat("Order #%d already has levels of Open=%.5f SL=.5f TP=%.5f",
                     ticket,order.StopLoss(),order.TakeProfit());
     }
    }
//--- came to the end, no changes for the order
   return(false);       // no point in modifying 
  }

double calculate_lotsize(double sl, double price)   
 
 {
  double lots=0.,margin ;
  double lotstep= SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);
 double ticksize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   double tickvalue = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE);
  double balance= AccountInfoDouble(ACCOUNT_BALANCE);
  double point= SymbolInfoDouble(_Symbol,SYMBOL_POINT);
  //double  loss=MathRound((MathAbs(price-sl)/ ticksize) * ticksize );
  double  loss=MathAbs(price-sl)/point;  m_symbol.NormalizePrice(loss);
  double Risk= initial_risk*balance;
  if(loss!=0)
   {
    lots=MathAbs(Risk/loss);
    lots=MathFloor(lots/lotstep)*lotstep;
   }  
   if(OrderCalcMargin(ORDER_TYPE_BUY,_Symbol,lots,price,margin))
       {
         double free_margin=AccountInfoDouble(ACCOUNT_MARGIN_FREE);
         if(free_margin<0)
           {
            lots=0;
           }
         else if(free_margin<margin)
           {
            lots=lots*free_margin/margin;
            lots=MathFloor(lots/lotstep-1)*lotstep;
           }
        }
   lots=MathMax(lots,SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN));
   lots=MathMin(lots,SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX));
   return lots;
 }

//+------------------------------------------------------------------+
//| Check the correctness of the order volume                        |
//+------------------------------------------------------------------+
bool CheckVolumeValue(double volume) {

//--- minimal allowed volume for trade operations
  double min_volume=SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   if(volume < min_volume)
     {
      //description = StringFormat("Volume is less than the minimal allowed SYMBOL_VOLUME_MIN=%.2f",min_volume);
      return(false);
     }

//--- maximal allowed volume of trade operations
   double max_volume=SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   if(volume>max_volume)
     {
      //description = StringFormat("Volume is greater than the maximal allowed SYMBOL_VOLUME_MAX=%.2f",max_volume);
      return(false);
     }

//--- get minimal step of volume changing
   double volume_step=SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);

   int ratio = (int)MathRound(volume/volume_step);
   if(MathAbs(ratio*volume_step-volume)>0.0000001)
     {
      //description = StringFormat("Volume is not a multiple of the minimal step SYMBOL_VOLUME_STEP=%.2f, the closest correct volume is %.2f", volume_step,ratio*volume_step);
      return(false);
     }
      
   return(true);
}


    