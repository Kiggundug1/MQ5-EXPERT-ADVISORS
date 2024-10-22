//+------------------------------------------------------------------+
//|                                               Valable ZigZag.mq4 |
//|                        Copyright 2022, Sergei Ermolov (mql5.com) |
//|                        https://www.mql5.com/ru/users/dj_ermoloff |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, Sergei Ermolov (mql5.com)"
#property link      "https://www.mql5.com/ru/users/dj_ermoloff"
#property version   "2.1"
#property indicator_chart_window
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots 1
//--- plot ZigZag
#property indicator_label1  "ZigZag"
#property indicator_type1   DRAW_SECTION
#property indicator_color1  clrBlue
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2


input int FrBarsLeft = 5; //LBar
input int FrBarsRight = 2; //RBar

double gzz[];
double frUp[];
double frDown[];

int direction;
datetime it;
double l_level_up, l_level_down, l_zz_high, l_zz_low;
int rt;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
void OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,gzz,INDICATOR_DATA);
   ArraySetAsSeries(gzz,true);

//--- set short name and digits
   string short_name=StringFormat("Valable ZigZag(%d,%d)",FrBarsLeft,FrBarsRight);
   IndicatorSetString(INDICATOR_SHORTNAME,short_name);
   PlotIndexSetString(0,PLOT_LABEL,short_name);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   SetIndexBuffer(1,frUp,INDICATOR_CALCULATIONS);
   ArraySetAsSeries(frUp,true);
   SetIndexBuffer(2,frDown,INDICATOR_CALCULATIONS);
   ArraySetAsSeries(frDown,true);
//--- set an empty value
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0.0);
  }
//+------------------------------------------------------------------+
//| ZigZag calculation                                               |
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
   rt = rates_total;
   if(rates_total<FrBarsLeft+FrBarsRight+1) return(0);
      
   int start;
   
   if(prev_calculated<FrBarsLeft+FrBarsRight+1) {
      start=rates_total-FrBarsLeft-1;
      ArrayInitialize(gzz,0);
   } else start=rates_total-prev_calculated+FrBarsRight;
   
   for(int i=start;i>FrBarsRight;i--) Logic(i);
     
   return(rates_total);
  }

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

void Logic(int i) { 
   if (IsFractal(i,false)) {
      frUp[i] = iHigh(_Symbol,PERIOD_CURRENT,i);
   }
   if (IsFractal(i,true)) {
      frDown[i] = iLow(_Symbol,PERIOD_CURRENT,i);
   }  
   
   if (direction == 0) {
      if (l_level_down > 0 && iClose(_Symbol,PERIOD_CURRENT,i) < l_level_down) {
         gzz[i] = iLow(_Symbol,PERIOD_CURRENT,i);
         l_zz_low = gzz[i];
         direction = 1;
      }
      if (frUp[i] == iHigh(_Symbol,PERIOD_CURRENT,i) && l_zz_high < frUp[i]) {
         gzz[i] = iHigh(_Symbol,PERIOD_CURRENT,i);
         l_zz_high = gzz[i];
         ClearTheExtraValue(i,direction);
      }
   } else {
      if (l_level_up > 0 && iClose(_Symbol,PERIOD_CURRENT,i) > l_level_up) {
         gzz[i] = iHigh(_Symbol,PERIOD_CURRENT,i);
         l_zz_high = gzz[i];
         direction = 0;
      }
      if (frDown[i] == iLow(_Symbol,PERIOD_CURRENT,i) && l_zz_low > frDown[i]) {
         gzz[i] = iLow(_Symbol,PERIOD_CURRENT,i);
         l_zz_low = gzz[i];
         ClearTheExtraValue(i,direction);
      }
   }
   
   if (frUp[i] == iHigh(_Symbol,PERIOD_CURRENT,i)) {
      l_level_up = frUp[i];  
   }
   if (frDown[i] == iLow(_Symbol,PERIOD_CURRENT,i)) {
      l_level_down = frDown[i];
   }
}

void ClearTheExtraValue(int _start, int _type) {
   for (int i=_start+1;i<rt;i++) {
      if (_type == 0) {
         if (iLow(_Symbol,PERIOD_CURRENT,i) == gzz[i]) return;
         gzz[i] = 0;
      } else {
         if (iHigh(_Symbol,PERIOD_CURRENT,i) == gzz[i]) return;
         gzz[i] = 0;
      }
   }
}