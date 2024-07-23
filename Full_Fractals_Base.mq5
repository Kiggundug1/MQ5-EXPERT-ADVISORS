//+------------------------------------------------------------------+
//|                                                Full Fractals.mq5 |
//|                        Copyright 2023, Sergei Ermolov (mql5.com) |
//|                        https://www.mql5.com/ru/users/dj_ermoloff |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com/ru/users/dj_ermoloff"
#property version   "1.1"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2
#property indicator_type1   DRAW_ARROW
#property indicator_type2   DRAW_ARROW
#property indicator_color1  clrGray
#property indicator_color2  clrGray
#property indicator_label1  "Fractal Up"
#property indicator_label2  "Fractal Down"

input int FrBarsLeft = 5; //Candles on the left
input int FrBarsRight = 2; //Candles on the right

int ExtArrowShift = -10;
double frUp[];
double frDown[];

double cb=0,
       cs=0,
       hb=0,
       ls=0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,frUp,INDICATOR_DATA);
   ArraySetAsSeries(frUp,true);
   SetIndexBuffer(1,frDown,INDICATOR_DATA);
   ArraySetAsSeries(frDown,true);
   
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   
   PlotIndexSetInteger(0,PLOT_ARROW_SHIFT,ExtArrowShift);
   PlotIndexSetInteger(1,PLOT_ARROW_SHIFT,-ExtArrowShift);
   
   PlotIndexSetInteger(0,PLOT_ARROW,217);
   PlotIndexSetInteger(1,PLOT_ARROW,218);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"Full Fractals("+string(FrBarsLeft)+","+string(FrBarsRight)+")");
   
   return(INIT_SUCCEEDED);
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
  
   if(rates_total<FrBarsLeft+FrBarsRight+1) return(0);
      
   int start;
   
   if(prev_calculated<FrBarsLeft+FrBarsRight+1) {
      start=rates_total-FrBarsLeft-1;
      ArrayInitialize(frDown,EMPTY_VALUE);
      ArrayInitialize(frUp,EMPTY_VALUE);
   } else start=rates_total-prev_calculated+FrBarsRight;

   for(int i=start; i>FrBarsRight && !IsStopped(); i--) {
      if (IsFractal(i,false)) frUp[i] = iHigh(_Symbol,PERIOD_CURRENT,i);         
      if (IsFractal(i,true)) frDown[i] = iLow(_Symbol,PERIOD_CURRENT,i);
   }
   
   return(rates_total);
  }
//+------------------------------------------------------------------+

bool IsFractal(int _i, bool _type) {
   if (_type) {
      double low = iLow(_Symbol,PERIOD_CURRENT,_i);
      for(int j=1;j<=FrBarsLeft;j++) if (iLow(_Symbol,PERIOD_CURRENT,_i+j) < low) return false;
      for(int j=1;j<=FrBarsRight;j++) if (iLow(_Symbol,PERIOD_CURRENT,_i-j) < low) return false;
      return true;
   } else {
      double high = iHigh(_Symbol,PERIOD_CURRENT,_i);
      for(int j=1;j<=FrBarsLeft;j++) if (iHigh(_Symbol,PERIOD_CURRENT,_i+j) > high) return false;
      for(int j=1;j<=FrBarsRight;j++) if (iHigh(_Symbol,PERIOD_CURRENT,_i-j) > high) return false;
      return true;
   }
   return false;
}