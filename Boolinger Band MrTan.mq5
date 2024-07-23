//+------------------------------------------------------------------+
//|                                         Boolinger Band MrTan.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//---
#include <Trade\PositionInfo.mqh>
#include <Trade\Trade.mqh>
#include <Trade\SymbolInfo.mqh>  
#include <Trade\AccountInfo.mqh>
#include <Expert\Money\MoneyFixedMargin.mqh>
CPositionInfo  m_position;                   // trade position object
CTrade         trade;                      // trading object
CSymbolInfo    m_symbol;                     // symbol info object
CAccountInfo   m_account;                    // account info wrapper
CMoneyFixedMargin *m_money;

//--- input parameters
input double           Lot_size          =0.1  ;
input double           distance          =50 ;        // Distance from highestigh or loweslow to start trade
input double           TP=4000;                      // Take profit
input double           SL=2000;                      // Stop loss
input ushort           InpTrailingStop   = 60;       // Trailing Stop (in pips)
input ushort           InpTrailingStep   = 5;        // Trailing Step (in pips)
input int              InpMaxPositions   = 5;        // Maximum positions
input ulong            m_magic=47978073;             // magic number
int input    EXPERT_MAGIC = 1234567;
input        ENUM_TIMEFRAMES              Trading_timframe=PERIOD_H1;     

// Input Indicator declaration

input int        period_Band         =20;       // bollingerBand period
input int        Shift_band           =1;         // Shift bar of band
input double     Deviation_band      =1;         // Deviation band
input int        period_MA_volume    =26  ;      // Period of moving average volume tick
input int        Shift_volume        =1;         // Shift bar of Volume tick

// Global Variable

//SL-TP management
double         m_adjusted_point;             // point value adjusted for 3 or 5 points
ulong          m_slippage=10;                // slippage
double         ExtDistance=0.0;
double         ExtStopLoss=0.0;
double         ExtTakeProfit=0.0;
double         ExtTrailingStop=0.0;
double         ExtTrailingStep=0.0;
double         ExtSpreadLimit=0.0;

// Indicator Declaration
int handel_Bollingerband;

  //+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   if(!m_symbol.Name(Symbol())) // sets symbol name
      return(INIT_FAILED);
   RefreshRates();
    //---
   trade.SetExpertMagicNumber(m_magic);
   trade.SetMarginMode();
   trade.SetTypeFillingBySymbol(m_symbol.Name());
   trade.SetDeviationInPoints(m_slippage);
//--- tuning for 3 or 5 digits
   int digits_adjust=1;
   if(m_symbol.Digits()==3 || m_symbol.Digits()==5)
      digits_adjust=10;
   m_adjusted_point=m_symbol.Point()*digits_adjust;

   ExtStopLoss    = SL     * m_adjusted_point;
   ExtTakeProfit  = TP   * m_adjusted_point;
   ExtTrailingStop= InpTrailingStop * m_adjusted_point;
   ExtTrailingStep= InpTrailingStep * m_adjusted_point;
   ExtDistance    = distance*m_adjusted_point; double profit=0;
//--- create handle of the indicator Bollinger band
   handel_Bollingerband=iBands(Symbol(),Trading_timframe,period_Band,Shift_band,Deviation_band,PRICE_CLOSE);
//--- if the handle is not created 
   if(handel_Bollingerband==INVALID_HANDLE)
     {
      //--- tell about the failure and output the error code 
      PrintFormat("Failed to create handle of the Bollinger band indicator for the symbol %s/%s, error code %d",
                  m_symbol.Name(),
                  EnumToString(Period()),
                  GetLastError());
      //--- the indicator is stopped early 
      return(INIT_FAILED);
     }



//---
   return(INIT_SUCCEEDED);
  }
  
  

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   if(m_money!=NULL)
      delete m_money;
    

   ChartRedraw();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {


  // Declaration the Candle
  double high[]; ArraySetAsSeries(high,true);CopyHigh(Symbol(),Trading_timframe,0,1000,high);
  double low[]; ArraySetAsSeries(low,true);CopyLow(Symbol(),Trading_timframe,0,1000,low);
  double open[]; ArraySetAsSeries(open,true);CopyOpen(Symbol(),Trading_timframe,0,1000,open);
  double close[]; ArraySetAsSeries(close,true);CopyClose(Symbol(),Trading_timframe,0,1000,close);
  
  // Declaration Array for Bollinger band
  double Uperband[]; ArraySetAsSeries(Uperband,true);CopyBuffer(handel_Bollingerband,UPPER_BAND,0,1000,Uperband);// Array for Uperband
  double Lowerband[]; ArraySetAsSeries(Lowerband,true);CopyBuffer(handel_Bollingerband,LOWER_BAND,0,1000,Lowerband);// Array for lowerband
  double Midleband[]; ArraySetAsSeries(Midleband,true);CopyBuffer(handel_Bollingerband,BASE_LINE,0,1000,Midleband);// Array for midel band
  
  // Declaration the volume tick
  double MA_volume[]; ArraySetAsSeries(MA_volume,true); Get_MA_volume(0,0,MA_volume,1000);
  double volume[];ArraySetAsSeries(volume,true); Get_ivolume(0,0,volume,1000);
  

  // declaration count positions
  int count_buy=0; int count_sell=0;double profit=0;
  CalculatePositions(count_buy,count_sell,profit);
  
  // Display discription volume check
  string discription=" ";
  
  // Declaration parameter befor send to the broker
  double Ask= SymbolInfoDouble(Symbol(),SYMBOL_ASK);
  double Bid= SymbolInfoDouble(Symbol(),SYMBOL_BID);
  double Stop_level=(int)SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
  
  // condition check volume
  
  // Execution main Trade
  
  // Only trade at new bar
   if(BarOpen(Symbol(),Trading_timframe))
   {
   CalculatePositions(count_buy,count_sell,profit);
   // Trailing stop
   Trailing();
    {
     // Looking for to go long if there is no long position
     if(count_buy==0  )
     {
      if(  low[2]<Midleband[2] && close[1]>Midleband[1]  && close[1]>open[1] && volume[1]>MA_volume[1] )
       {
       double entryprice= Ask;
       double sl=entryprice-ExtStopLoss;
       double tp =entryprice + ExtTakeProfit;
       //if(CheckVolumeValue(Symbol(),Lot_size,discription,entryprice,ORDER_TYPE_BUY))
       //trade.Buy(Lot_size,Symbol(),entryprice,sl,tp);
       // you enter code buy or sell
        }
      }
      else if(count_sell==0 )
      {
      if( high[2]>Midleband[2]&&close[1]<Midleband[1] && close[1]<open[1] && volume[1]>MA_volume[1] )
       {
       double entryprice= Bid;
       double sl=entryprice+ExtStopLoss;
       double tp =entryprice - ExtTakeProfit;
       //if(CheckVolumeValue(Symbol(),Lot_size,discription,entryprice,ORDER_TYPE_SELL))
       //trade.Sell(Lot_size,Symbol(),entryprice,sl,tp);
       // you enter code buy or sell
       }
      }
      
      
     }
  
   }
}

//+------------------------------------------------------------------+
//| Refreshes the symbol quotes data                                 |
//+------------------------------------------------------------------+
bool RefreshRates(void)
  {
//--- refresh rates
   if(!m_symbol.RefreshRates())
     {
      Print("RefreshRates error");
      return(false);
     }
//--- protection against the return value of "zero"
   if(m_symbol.Ask()==0 || m_symbol.Bid()==0)
      return(false);
//---
   return(true);
  }


//+------------------------------------------------------------------+
//| Calculate positions Buy and Sell                                 |
//+------------------------------------------------------------------+
void CalculatePositions(int &count_buys,int &count_sells,double &profit)
  {
   count_buys=0;
   count_sells=0;
   profit=0.0;

   for(int i=PositionsTotal()-1;i>=0;i--)
      if(m_position.SelectByIndex(i)) // selects the position by index for further access to its properties
         if(m_position.Symbol()==m_symbol.Name() //&& m_position.Magic()==m_magic
         )
           {
            profit+=m_position.Commission()+m_position.Swap()+m_position.Profit();
            if(m_position.PositionType()==POSITION_TYPE_BUY)
               count_buys++;

            if(m_position.PositionType()==POSITION_TYPE_SELL)
               count_sells++;
           }
    }
//+------------------------------------------------------------------+
//| close all positions                                              |
//+------------------------------------------------------------------+
void ClosePositions(const ENUM_POSITION_TYPE pos_type)
  {
   for(int i=PositionsTotal()-1;i>=0;i--) // returns the number of current positions
      if(m_position.SelectByIndex(i))     // selects the position by index for further access to its properties
         if(m_position.Symbol()==m_symbol.Name() && m_position.Magic()==m_magic)
            if(m_position.PositionType()==pos_type) // gets the position type
               trade.PositionClose(m_position.Ticket()); // close a position by the specified symbol
  }
 
    //+------------------------------------------------------------------+
//| get highest value for range                                      |
//+------------------------------------------------------------------+
double Highest(const double&array[],int range,int fromIndex)
{
   double res=0;
//---
   res=array[fromIndex];
   for(int i=fromIndex;i<fromIndex+range;i++)
   {
      if(res<array[i]) res=array[i];
   }
//---
   return(res);
}
//+------------------------------------------------------------------+
//| get lowest value for range                                       |
//+------------------------------------------------------------------+
double Lowest(const double&array[],int range,int fromIndex)
{
   double res=0;
//---
   res=array[fromIndex];
   for(int i=fromIndex;i<fromIndex+range;i++)
   {
      if(res>array[i]) res=array[i];
   }
//---
   return(res);
}
   

    //+------------------------------------------------------------------+
// Get value of buffers for the volume                         

double Get_ivolume( int buffer, int index, double &value[],int count)
  {
 int  handel_Volume=iVolumes(Symbol(),Trading_timframe,VOLUME_TICK);
//--- reset error code 
   ResetLastError();
//--- fill a part of the iIchimoku array with values from the indicator buffer that has 0 index 
   if(CopyBuffer(handel_Volume,buffer,index,count,value)<0)
     {
      //--- if the copying fails, tell the error code 
      PrintFormat("Failed to copy data from the volume indicator, error code %d",GetLastError());
      //--- quit with zero result - it means that the indicator is considered as not calculated 
      //return(0.0);
     }
   return(value[0]);
  }
  
    //+------------------------------------------------------------------+
// Get value of buffers for the Bollinger band                          

double Get_MA_volume( int buffer, int index, double &value[],int count)
  {
//--- reset error code 
   ResetLastError();
   //--- create handle of the indicator volume
int  handel_Volume=iVolumes(Symbol(),Trading_timframe,VOLUME_TICK);
int hande_MA_volume= iMA(Symbol(),Trading_timframe,period_MA_volume,Shift_volume,MODE_EMA,handel_Volume);
//--- fill a part of the iIchimoku array with values from the indicator buffer that has 0 index 
   if(CopyBuffer(hande_MA_volume,buffer,index,count,value)<0)
     {
      //--- if the copying fails, tell the error code 
      PrintFormat("Failed to copy data from the Moving Arverage indicator, error code %d",GetLastError());
      //--- quit with zero result - it means that the indicator is considered as not calculated 
      //return(0.0);
     }
   return(value[0]);
  }
  //+------------------------------------------------------------------+
//| Get current server time function                                 |
//+------------------------------------------------------------------+

datetime m_prev_bar;
bool BarOpen(string symbol,ENUM_TIMEFRAMES timeframe)
{
   datetime bar_time = iTime(symbol, timeframe, 0);
   if (bar_time == m_prev_bar)
   {
      return false;
   }
   m_prev_bar = bar_time;
   return true;
}


//+------------------------------------------------------------------+
//| Trailing                                                         |
//+------------------------------------------------------------------+
void Trailing()
  {
   if(InpTrailingStop==0)
      return;
   for(int i=PositionsTotal()-1;i>=0;i--) // returns the number of open positions
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol()==m_symbol.Name() //&& m_position.Magic()==m_magic
         )
           {
            if(m_position.PositionType()==POSITION_TYPE_BUY)
              {
               if(m_position.PriceCurrent()-m_position.PriceOpen()>ExtTrailingStop+ExtTrailingStep)
                  if(m_position.StopLoss()<m_position.PriceCurrent()-(ExtTrailingStop+ExtTrailingStep))
                    {
                     if(!trade.PositionModify(m_position.Ticket(),
                        m_symbol.NormalizePrice(m_position.PriceCurrent()-ExtTrailingStop),
                        m_position.TakeProfit()))
                        Print("Modify ",m_position.Ticket(),
                              " Position -> false. Result Retcode: ",trade.ResultRetcode(),
                              ", description of result: ",trade.ResultRetcodeDescription());
                     RefreshRates();
                     m_position.SelectByIndex(i);
                     continue;
                    }
              }
            else
              {
               if(m_position.PriceOpen()-m_position.PriceCurrent()>ExtTrailingStop+ExtTrailingStep)
                  if((m_position.StopLoss()>(m_position.PriceCurrent()+(ExtTrailingStop+ExtTrailingStep))) || 
                     (m_position.StopLoss()==0))
                    {
                     if(!trade.PositionModify(m_position.Ticket(),
                        m_symbol.NormalizePrice(m_position.PriceCurrent()+ExtTrailingStop),
                        m_position.TakeProfit()))
                        Print("Modify ",m_position.Ticket(),
                              " Position -> false. Result Retcode: ",trade.ResultRetcode(),
                              ", description of result: ",trade.ResultRetcodeDescription());
                     RefreshRates();
                     m_position.SelectByIndex(i);
                    }
              }

           }
  }
  
  
  //+------------------------------------------------------------------+
//| Check the correctness of the order volume                        |
//+------------------------------------------------------------------+
bool CheckVolumeValue(string symbol,double volume,string &description,double price ,ENUM_ORDER_TYPE type)
  {
//--- minimal allowed volume for trade operations
   double margin = 0;
   double min_volume=SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);
   if(volume<min_volume)
     {
      description=StringFormat("Volume is less than the minimal allowed SYMBOL_VOLUME_MIN=%.2f",min_volume);
      return(false);
     }

//--- maximal allowed volume of trade operations
   double max_volume=SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);
   if(volume>max_volume)
     {
      description=StringFormat("Volume is greater than the maximal allowed SYMBOL_VOLUME_MAX=%.2f",max_volume);
      return(false);
     }

//--- get minimal step of volume changing
   double volume_step=SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);

   int ratio=(int)MathRound(volume/volume_step);
   if(MathAbs(ratio*volume_step-volume)>0.0000001)
     {
      description=StringFormat("Volume is not a multiple of the minimal step SYMBOL_VOLUME_STEP=%.2f, the closest correct volume is %.2f",
                               volume_step,ratio*volume_step);
      return(false);
     }
     
     if(OrderCalcMargin(type,Symbol(),volume,price,margin))
      {
         double free_margin=AccountInfoDouble(ACCOUNT_MARGIN_FREE);
         if(free_margin<0 )
           {
           return false;
           }
        }
   description="Correct volume value";
   return(true);
  } 