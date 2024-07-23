//+------------------------------------------------------------------+
//|                     Lession 1_ Bullish and Bearllish Candle.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, ThanhTan_ProVlog"
#property link      "https://www.mql5.com"
#property version   "1.00"
#include  <Trade\Trade.mqh>;
#include  <Trade\SymbolInfo.mqh>;
#include  <Trade\PositionInfo.mqh>;

CTrade                   trade;
CSymbolInfo              m_symbol;
CPositionInfo            m_position;
string input aa = "-----------------------SETTINGS---------------------------";
string input BOT_NAME = "Bullish and Bearllish Candle";
// Input parameter declaration
input  ENUM_TIMEFRAMES  Trading_timframe= PERIOD_M5;
input  double           lot_size=0.002;// Lot sise
input  double           SL_Factor= 600; // Stop loss factor
input  double           TP_Factor=6000; // Take profit factor
input  double           Trailling= 300;// Trailling Pipi
input  double           Trailling_Step=5;// Trailling step
input  ulong             m_magic=123456789;// magic number

//+------------------------------------------------------------------+
//| Global variable declaration.                                     |
//+------------------------------------------------------------------+
double  Extstoploss=0;
double  Exttakeprofit=0;
double  ExtTraill_Stop=0.0;
double   ExtTraill_Step=0.0;
double  m_adjustpoint=0;
ulong     slippage=10;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
if(!m_symbol.Name(Symbol()))
 return INIT_FAILED;
 
 trade.SetExpertMagicNumber(m_magic);
 trade.SetTypeFillingBySymbol(m_symbol.Name());
 trade.SetDeviationInPoints(slippage);
 
 // Retur 3 || 5 digit
 int digit_adjust=1;
 if(m_symbol.Digits()==3 || m_symbol.Digits()==5)
   digit_adjust=10;
   
   m_adjustpoint=digit_adjust*m_symbol.Point();
   
   Extstoploss=m_adjustpoint*SL_Factor;
   Exttakeprofit= m_adjustpoint*TP_Factor;
   ExtTraill_Stop=m_adjustpoint*Trailling;
   ExtTraill_Step=m_adjustpoint*Trailling_Step;
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
//+------------------------------------------------------------------+
//|Candle  declaration                                               |
//+------------------------------------------------------------------+

double  Open[],Close[],High[],Low[]; 
ArraySetAsSeries(Open,true) ; ArraySetAsSeries(Close,true)  ; 
ArraySetAsSeries(High,true) ; ArraySetAsSeries(Low,true);
CopyOpen(Symbol(),Trading_timframe,0,1000,Open);
CopyClose(Symbol(),Trading_timframe,0,1000,Close);
CopyHigh(Symbol(),Trading_timframe,0,1000,High);
CopyLow(Symbol(),Trading_timframe,0,1000,Low);

//+------------------------------------------------------------------+
//|Count buy & count sell & trailling declaration                    |
//+------------------------------------------------------------------+

int count_buy=0; int count_sell=0;
count_position(count_buy,count_sell);

//+------------------------------------------------------------------+
//|Main Trading function                                             |
//+------------------------------------------------------------------+
 if(Open_bar(Symbol(),Trading_timframe))// Only buy or sell at new candle
   {
    if(count_buy==0 && count_sell==0) // Only buy at no longer position
     {
     if(bullish(Open,Close,High,Low,1))
      {
       double  entryprice =  SymbolInfoDouble(Symbol(),SYMBOL_ASK);
       double  sl         = entryprice-Extstoploss;
       double  tp         =entryprice+Exttakeprofit;
       double max_lot= SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
      
       if(CheckVolumeValue(lot_size))
       {
        trade.Buy(lot_size,Symbol(),entryprice,sl,tp," Buy Mr.Tan 0964299486 ");
       }
       
      
      }
     
     }
 if(count_sell==0 && count_buy==0)// Only sell at no longer position
     {
     if(bearlish(Open,Close,High,Low,1))
      {
       double  entryprice =  SymbolInfoDouble(Symbol(),SYMBOL_BID);
       double  sl         = entryprice+Extstoploss;
       double  tp         =entryprice-Exttakeprofit;
       double max_lot= SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
       
       if(CheckVolumeValue(lot_size))
       {
        trade.Sell(lot_size,Symbol(),entryprice,sl,tp," Sell Mr.Tan 0964299486 ");
       }
             
      }
     
     }
   }
   
  }

//+------------------------------------------------------------------+
//|Count position and Trailling Functiom                              |
//+------------------------------------------------------------------+

void  count_position(int &count_buy, int &count_sell)

  {
   count_buy=0; count_sell=0;
   int total_postion=PositionsTotal();
   double cp=0.0, op=0.0, sl=0.0,tp=0.0; ulong ticket=0.0;
   for ( int i=total_postion-1; i>=0; i--)
     {
     if(m_position.SelectByIndex(i))
      {
      if(m_position.Symbol()==m_symbol.Name() && m_position.Magic()== m_magic)
       cp=m_position.PriceCurrent();op=m_position.PriceOpen();sl=m_position.StopLoss();tp=m_position.TakeProfit();ticket=m_position.Ticket();
       {       
       if(m_position.PositionType()== POSITION_TYPE_BUY)
        {
        count_buy++;
        double Traill= cp- ExtTraill_Stop;
        if(cp>sl+ExtTraill_Step && Traill>sl&& PositionModifyCheck(ticket,Traill,tp,_Symbol))
         {
          trade.PositionModify(ticket,Traill,tp);
         }
        }
      else
       if(m_position.PositionType()== POSITION_TYPE_SELL)
        {
         count_sell++;
        double Traill= cp+ ExtTraill_Stop;
        if(cp<sl-ExtTraill_Step && Traill<sl && PositionModifyCheck(ticket,Traill,tp,_Symbol))
         {
          trade.PositionModify(ticket,Traill,tp);
         }
        }
         
       }
      }
     
     }
  }
  
//+------------------------------------------------------------------+
//|New candle detetcted                                              |
//+------------------------------------------------------------------+
  datetime  m_prevbar;
  bool Open_bar(string symbol, ENUM_TIMEFRAMES timeframe)
   {
   datetime Curbar=iTime(symbol,timeframe,0);
   if(Curbar==m_prevbar)
     {
     return false;
     }
    m_prevbar=Curbar;
    return true;
   }
  
  
//+------------------------------------------------------------------+
//|Bullish detected                                                  |
//+------------------------------------------------------------------+
  
  bool bullish(double &open[], double  &close[], double  &high[], double  &low[], int index)
  
   {
    double midle_candle= MathAbs((close[index+1]-open[index+1])/2);
    bool   downtrend   =(close[index+1]<open[index+1] && close[index+2]<open[index+2] && close[index+3]<open[index+3]);
    
    if(downtrend)
     {
      if(close[index]>open[index] && close[index]>(close[index+1]+midle_candle))
      return true;
     }
   return  false;
   
   }
      
//+------------------------------------------------------------------+
//|Bearllish detected                                                  |
//+------------------------------------------------------------------+
  
  bool bearlish(double &open[], double  &close[], double  &high[], double  &low[], int index)
  
   {
    double midle_candle= MathAbs((close[index+1]-open[index+1])/2);
    bool   uptrend   =(close[index+1]>open[index+1] && close[index+2]>open[index+2] && close[index+3]>open[index+3]);
    
    if(uptrend)
     {
      if(close[index]<open[index] && close[index]<(close[index+1]-midle_candle))
      return true;
     }
   return  false;
   
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
  
