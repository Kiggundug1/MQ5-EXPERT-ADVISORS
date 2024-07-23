//+------------------------------------------------------------------+
//|                                                       All_MA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//|                                          Author: Yashar Seyyedin |
//|       Web Address: https://www.mql5.com/en/users/yashar.seyyedin |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.10"
#property indicator_chart_window
#property indicator_buffers 9
#property indicator_plots   1
//--- plot MA
#property indicator_label1  "MA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#define BARS MathMax(rates_total-_length-prev_calculated,1)
enum MA_TYPE
  {
   SMA, EMA, WMA, VWMA,
   RMA, DEMA, TEMA, ZLEMA,
   HMA, ALMA, LSMA,
   SWMA, SMMA, DONCHIAN
  };

//--- input parameters
input MA_TYPE _type = SMMA;  //MA Type:
input int _length = 8;       //MA Period
input double _offset = 0.85; //Offset for ALMA
input int _sigma = 6;        //Offset for LSMA / Sigma for ALMA

//--- indicator buffers
double         EMABuffer[];
double         EMA2Buffer[];
double         EMA3Buffer[];
double         RMABuffer[];
double         DEMABuffer[];
double         TEMABuffer[];
double         zlematmpBuffer[];
double         ZLEMABuffer[];
double         MABuffer[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,MABuffer,INDICATOR_DATA);
   SetIndexBuffer(1,EMABuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,EMA2Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,EMA3Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,RMABuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,DEMABuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,TEMABuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,zlematmpBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,ZLEMABuffer,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(EMABuffer,true);
   ArraySetAsSeries(EMA2Buffer,true);
   ArraySetAsSeries(EMA3Buffer,true);
   ArraySetAsSeries(RMABuffer,true);
   ArraySetAsSeries(DEMABuffer,true);
   ArraySetAsSeries(TEMABuffer,true);
   ArraySetAsSeries(zlematmpBuffer,true);
   ArraySetAsSeries(ZLEMABuffer,true);
   ArraySetAsSeries(MABuffer,true);
//---
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
//---
   ArraySetAsSeries(close, true);
   for(int i=BARS; i>=0; i--)
      MABuffer[i]=anyma(close, _length, _type, _offset, _sigma, i);

   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double anyma(const double &src[],
             int length,
             MA_TYPE type = EMA,
             double offset = 0.85,
             int sigma = 6,
             int index = 0)
  {
   switch(type)
     {
      case SMA:
         return pine_sma(src, length, index);
      case EMA:
         return pine_ema(src, length, index);
      case WMA:
         return pine_wma(src, length, index);
      case VWMA:
         return pine_vwma(src, length, index);
      case RMA:
         return pine_rma(src, length, index);
      case DEMA:
         return pine_dema(src, length, index);
      case TEMA:
         return pine_tema(src, length, index);
      case ZLEMA:
         return pine_zlema(src, length, index);
      case HMA:
         return pine_hma(src, length, index);
      case ALMA:
         return pine_alma(src, length, offset, sigma, index);
      case LSMA:
         return pine_linreg(src, length, sigma, index);
      case SWMA:
         return pine_swma(src, index);
      case SMMA:
         return pine_rma(src, length, index);
      case DONCHIAN:
         return pine_donchian(src, length, index);
      default:
         return EMPTY_VALUE;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_sma(const double &src[], int length, int index)
  {
   double sum = 0.0;
   for(int i = index; i<index+length; i++)
      sum = sum + src[i] / length;
   return sum;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_ema(const double &src[], int length, int index)
  {
   double alpha=2.0/(1+length);
   EMABuffer[index] = EMABuffer[index+1]*(1-alpha)+src[index]*alpha;
   return EMABuffer[index];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_rma(const double &src[], int length, int index)
  {
   double alpha=1.0/(length);
   RMABuffer[index] = RMABuffer[index+1]*(1-alpha)+src[index]*alpha;
   return RMABuffer[index];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_wma(const double &src[], int length, int index)
  {
   double norm = 0.0;
   double sum = 0.0;
   for(int i = index; i<index+length; i++)
     {
      double weight = (length - i+index) * length;
      norm = norm + weight;
      sum = sum + src[i] * weight;
     }
   return sum / norm;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_vwma(const double &src[], int length, int index)
  {
   double s1=0;
   for(int i=index; i<index+length; i++)
      s1+=(src[i]*(double)iVolume(_Symbol, PERIOD_CURRENT,i)/(double)length);
   double s2=0;
   for(int i=index; i<index+length; i++)
      s2+=(double)iVolume(_Symbol, PERIOD_CURRENT,i)/length;
   return s1/ s2;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_dema(const double &src[], int length, int index)
  {
   double alpha=2.0/(1+length);
   EMABuffer[index] = EMABuffer[index+1]*(1-alpha)+src[index]*alpha;
   EMA2Buffer[index] = EMA2Buffer[index+1]*(1-alpha)+EMABuffer[index]*alpha;
   DEMABuffer[index] = 2* EMABuffer[index]-EMA2Buffer[index];
   return DEMABuffer[index];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_tema(const double &src[], int length, int index)
  {
   double alpha=2.0/(1+length);
   EMABuffer[index] = EMABuffer[index+1]*(1-alpha)+src[index]*alpha;
   EMA2Buffer[index] = EMA2Buffer[index+1]*(1-alpha)+EMABuffer[index]*alpha;
   EMA3Buffer[index] = EMA3Buffer[index+1]*(1-alpha)+EMA2Buffer[index]*alpha;
   TEMABuffer[index] = 3*(EMABuffer[index]-EMA2Buffer[index])+EMA3Buffer[index];
   return TEMABuffer[index];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_zlema(const double &src[], int length, int index)
  {
   zlematmpBuffer[index]=src[index] + (src[index] - src[index+(int)(length / 2)]);
   double alpha=2.0/(1+length);
   ZLEMABuffer[index] = ZLEMABuffer[index+1]*(1-alpha)+zlematmpBuffer[index]*alpha;
   return ZLEMABuffer[index];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_hma(const double &src[], int length, int index)
  {
   double norm = 0.0;
   double sum = 0.0;
   for(int i = index ; i<index+MathRound(MathSqrt(length)); i++)
     {
      double weight = (MathRound(MathSqrt(length)) - (i-index)) * MathRound(MathSqrt(length));
      norm = norm + weight;
      sum = sum + (2*pine_wma(src, length/2, index)-pine_wma(src, length, index)) * weight;
     }
   return sum/norm;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_alma(const double &src[], int length, double offset, double sigma, int index)
  {
   double m = MathFloor(offset * (double)(length- 1));
   double s = (double)length/ sigma;
   double norm = 0.0;
   double sum = 0.0;
   for(int i = index; i<index+length; i++)
     {
      double weight = MathExp(-1 * MathPow(i-index - m, 2) / (2 * MathPow(s, 2)));
      norm = norm + weight;
      sum = sum + src[2*index+length - i-1] * weight;
     }
   return sum / norm ;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_linreg(const double &input_src[], int _len, int offset, int index)
  {
   double sum_y=0;
   double sum_x=0;
   double sum_y2=0;
   double sum_x2=0;
   double sum_xy=0;
   for(int i=index; i<index+_len; i++)
     {
      sum_y += input_src[i];
      sum_x += i;
      sum_y2 += input_src[i]*input_src[i];
      sum_x2 += i*i;
      sum_xy += i*input_src[i];
     }
   double a = (sum_y*sum_x2-sum_x*sum_xy)/(_len*sum_x2-sum_x*sum_x);
   double b = (_len*sum_xy-sum_x*sum_y)/(_len*sum_x2-sum_x*sum_x);
   return a+b*(index+offset);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_swma(const double &src[], int index)
  {
   return src[index+3] * 1 / 6 + src[index+2] * 2 / 6 + src[index+1] * 2 / 6 + src[index+0] * 1 / 6;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double pine_donchian(const double &src[], int length, int index)
  {
   double lowest=DBL_MAX;
   for(int i=index; i<index+length; i++)
      lowest=MathMin(src[i], lowest);
   double highest=-DBL_MAX;
   for(int i=index; i<index+length; i++)
      highest=MathMax(src[i], highest);
   return (highest+lowest)/2;
  }
//+------------------------------------------------------------------+