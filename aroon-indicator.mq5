#property description ""
#property description ""
//------------------------------------------------------------------
#property indicator_separate_window
#property indicator_buffers 9
#property indicator_plots   3
#property indicator_label1  "Aroon filling"
#property indicator_type1   DRAW_FILLING
#property indicator_color1  C'209,243,209',C'255,230,183'
#property indicator_label2  "Aroon up"
#property indicator_type2   DRAW_COLOR_LINE
#property indicator_color2  clrSilver,clrLimeGreen,clrOrange
#property indicator_width2  2
#property indicator_label3  "Aroon down"
#property indicator_type3   DRAW_COLOR_LINE
#property indicator_color3  clrSilver,clrLimeGreen,clrOrange
#property indicator_width3  2
#property indicator_minimum -5
#property indicator_maximum 105
#property indicator_level1  0
#property indicator_level2  100

//
//
//
//
//

enum enPrices
{
   pr_close,      // Close
   pr_open,       // Open
   pr_high,       // High
   pr_low,        // Low
   pr_median,     // Median
   pr_typical,    // Typical
   pr_weighted,   // Weighted
   pr_average,    // Average (high+low+open+close)/4
   pr_medianb,    // Average median body (open+close)/2
   pr_tbiased,    // Trend biased price
   pr_tbiased2,   // Trend biased (extreme) price
   pr_haclose,    // Heiken ashi close
   pr_haopen ,    // Heiken ashi open
   pr_hahigh,     // Heiken ashi high
   pr_halow,      // Heiken ashi low
   pr_hamedian,   // Heiken ashi median
   pr_hatypical,  // Heiken ashi typical
   pr_haweighted, // Heiken ashi weighted
   pr_haaverage,  // Heiken ashi average
   pr_hamedianb,  // Heiken ashi median body
   pr_hatbiased,  // Heiken ashi trend biased price
   pr_hatbiased2  // Heiken ashi trend biased (extreme) price
};

input ENUM_TIMEFRAMES TimeFrame       = PERIOD_CURRENT; // Time frame
input int             AroonPeriod     = 25;             // calculation period
input enPrices        PriceHigh       = pr_high;        // Price to use for high
input enPrices        PriceLow        = pr_low;         // Price to use for low
input bool            alertsOn        = false;          // Turn alerts on?
input bool            alertsOnCurrent = true;           // Alert on current bar?
input bool            alertsMessage   = true;           // Display messageas on alerts?
input bool            alertsSound     = false;          // Play sound on alerts?
input bool            alertsEmail     = false;          // Send email on alerts?
input bool            alertsNotify    = false;          // Send push notification on alerts?
input bool            Interpolate     = true;           // Interpolate mtf data ?

//
//
//
//
//
//

double valueup[],valueupc[],valuedn[],valuednc[],fill1[],fill2[],count[];
double prh[],prl[];
ENUM_TIMEFRAMES timeFrame;

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

int OnInit()
{
   SetIndexBuffer(0,fill1   ,INDICATOR_DATA);
   SetIndexBuffer(1,fill2   ,INDICATOR_DATA);
   SetIndexBuffer(2,valueup ,INDICATOR_DATA);
   SetIndexBuffer(3,valueupc,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,valuedn ,INDICATOR_DATA);
   SetIndexBuffer(5,valuednc,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(6,prh     ,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,prl     ,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,count   ,INDICATOR_CALCULATIONS);
      PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
      timeFrame = MathMax(TimeFrame,_Period);
      IndicatorSetString(INDICATOR_SHORTNAME,timeFrameToString(timeFrame)+" Aroon ("+DoubleToString(AroonPeriod,0)+")");
   return(0);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//
//

int OnCalculate(const int rates_total,const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &TickVolume[],
                const long &Volume[],
                const int &Spread[])
{
   if (Bars(_Symbol,_Period)<rates_total) return(-1);
   
      //
      //
      //
      //
      //
      
      if (timeFrame!=_Period)
      {
         double result[]; datetime currTime[],nextTime[]; 
         static int indHandle =-1;
                if (indHandle==-1) indHandle = iCustom(_Symbol,timeFrame,getIndicatorName(),PERIOD_CURRENT,AroonPeriod,PriceHigh,PriceLow,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsEmail,alertsNotify);
                if (indHandle==-1)                          return(0);
                if (CopyBuffer(indHandle,8,0,1,result)==-1) return(0); 
             
                //
                //
                //
                //
                //
              
                #define _processed EMPTY_VALUE-1
                int i,limit = rates_total-(int)MathMin(result[0]*PeriodSeconds(timeFrame)/PeriodSeconds(_Period),rates_total); 
                for (limit=MathMax(limit,0); limit>0 && !IsStopped(); limit--) if (count[limit]==_processed) break;
                for (i=MathMin(limit,MathMax(prev_calculated-1,0)); i<rates_total && !IsStopped(); i++    )
                {
                   if (CopyBuffer(indHandle,0,time[i],1,result)==-1) break; fill1[i]    = result[0];
                   if (CopyBuffer(indHandle,1,time[i],1,result)==-1) break; fill2[i]    = result[0];
                   if (CopyBuffer(indHandle,2,time[i],1,result)==-1) break; valueup[i]  = result[0];
                   if (CopyBuffer(indHandle,3,time[i],1,result)==-1) break; valueupc[i] = result[0];
                   if (CopyBuffer(indHandle,4,time[i],1,result)==-1) break; valuedn[i]  = result[0];
                   if (CopyBuffer(indHandle,5,time[i],1,result)==-1) break; valuednc[i] = result[0];
                                                                            count[i]    = _processed;
                   
                   //
                   //
                   //
                   //
                   //
                   
                   #define _interpolate(buff,i,k,n) buff[i-k] = buff[i]+(buff[i-n]-buff[i])*k/n
                   if (!Interpolate) continue; CopyTime(_Symbol,TimeFrame,time[i  ],1,currTime); 
                      if (i<(rates_total-1)) { CopyTime(_Symbol,TimeFrame,time[i+1],1,nextTime); if (currTime[0]==nextTime[0]) continue; }
                      int n,k;
                         for(n=1; (i-n)> 0 && time[i-n] >= currTime[0]; n++) continue;	
                         for(k=1; (i-k)>=0 && k<n; k++)
                         {
                            _interpolate(fill1  ,i,k,n);
                            _interpolate(fill2  ,i,k,n);
                            _interpolate(valuedn,i,k,n);
                            _interpolate(valueup,i,k,n);
                         }                            
                }     
                if (i!=rates_total) return(0); return(rates_total);
      }

   //
   //
   //
   //
   //
  
      for (int i=(int)MathMax(prev_calculated-1,0); i<rates_total; i++)
      {
         prh[i] = getPrice(PriceHigh,open,close,high,low,i,rates_total,0);
         prl[i] = getPrice(PriceLow ,open,close,high,low,i,rates_total,1);
         double max=0; double maxv=prh[i];
         double min=0; double minv=prl[i];
         for (int k=1; k<=AroonPeriod && (i-k)>=0; k++)
         {
            if (prh[i-k]>maxv) { max=k; maxv = prh[i-k]; }
            if (prl[i-k]<minv) { min=k; minv = prl[i-k]; }
         }
         valueup[i]  = 100*(AroonPeriod-max)/AroonPeriod;
         valuedn[i]  = 100*(AroonPeriod-min)/AroonPeriod;
         fill1[i]    = valueup[i];
         fill2[i]    = valuedn[i];
         valueupc[i] = (valueup[i]>valuedn[i]) ? 1 : (valueup[i]<valuedn[i]) ? 2 : 0;
         valuednc[i] = valueupc[i];
      }
      manageAlerts(time,valueupc,rates_total);
      count[rates_total-1] = MathMax(rates_total-prev_calculated+1,1);
   
   //
   //
   //
   //
   //
   
   return(rates_total);
}


//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

void manageAlerts(const datetime& time[], double& ttrend[], int bars)
{
   if (!alertsOn) return;
      int whichBar = bars-1; if (!alertsOnCurrent) whichBar = bars-2; datetime time1 = time[whichBar];
      if (ttrend[whichBar] != ttrend[whichBar-1])
      {
         if (ttrend[whichBar] == 1) doAlert(time1,"up");
         if (ttrend[whichBar] == 2) doAlert(time1,"down");
      }         
}   

//
//
//
//
//

void doAlert(datetime forTime, string doWhat)
{
   static string   previousAlert="nothing";
   static datetime previousTime;
   
   if (previousAlert != doWhat || previousTime != forTime) 
   {
      previousAlert  = doWhat;
      previousTime   = forTime;

      string message = timeFrameToString(_Period)+" "+_Symbol+" at "+TimeToString(TimeLocal(),TIME_SECONDS)+" Aroon state changed to "+doWhat;
         if (alertsMessage) Alert(message);
         if (alertsEmail)   SendMail(_Symbol+" Aroon",message);
         if (alertsNotify)  SendNotification(message);
         if (alertsSound)   PlaySound("alert2.wav");
   }
}

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//
//

#define priceInstances 2
double workHa[][priceInstances*4];
double getPrice(int tprice, const double& open[], const double& close[], const double& high[], const double& low[], int i,int _bars, int instanceNo=0)
{
  if (tprice>=pr_haclose)
   {
      if (ArrayRange(workHa,0)!= _bars) ArrayResize(workHa,_bars); instanceNo*=4;
         
         //
         //
         //
         //
         //
         
         double haOpen;
         if (i>0)
                haOpen  = (workHa[i-1][instanceNo+2] + workHa[i-1][instanceNo+3])/2.0;
         else   haOpen  = (open[i]+close[i])/2;
         double haClose = (open[i] + high[i] + low[i] + close[i]) / 4.0;
         double haHigh  = MathMax(high[i], MathMax(haOpen,haClose));
         double haLow   = MathMin(low[i] , MathMin(haOpen,haClose));

         if(haOpen  <haClose) { workHa[i][instanceNo+0] = haLow;  workHa[i][instanceNo+1] = haHigh; } 
         else                 { workHa[i][instanceNo+0] = haHigh; workHa[i][instanceNo+1] = haLow;  } 
                                workHa[i][instanceNo+2] = haOpen;
                                workHa[i][instanceNo+3] = haClose;
         //
         //
         //
         //
         //
         
         switch (tprice)
         {
            case pr_haclose:     return(haClose);
            case pr_haopen:      return(haOpen);
            case pr_hahigh:      return(haHigh);
            case pr_halow:       return(haLow);
            case pr_hamedian:    return((haHigh+haLow)/2.0);
            case pr_hamedianb:   return((haOpen+haClose)/2.0);
            case pr_hatypical:   return((haHigh+haLow+haClose)/3.0);
            case pr_haweighted:  return((haHigh+haLow+haClose+haClose)/4.0);
            case pr_haaverage:   return((haHigh+haLow+haClose+haOpen)/4.0);
            case pr_hatbiased:
               if (haClose>haOpen)
                     return((haHigh+haClose)/2.0);
               else  return((haLow+haClose)/2.0);        
            case pr_hatbiased2:
               if (haClose>haOpen)  return(haHigh);
               if (haClose<haOpen)  return(haLow);
                                    return(haClose);        
         }
   }
   
   //
   //
   //
   //
   //
   
   switch (tprice)
   {
      case pr_close:     return(close[i]);
      case pr_open:      return(open[i]);
      case pr_high:      return(high[i]);
      case pr_low:       return(low[i]);
      case pr_median:    return((high[i]+low[i])/2.0);
      case pr_medianb:   return((open[i]+close[i])/2.0);
      case pr_typical:   return((high[i]+low[i]+close[i])/3.0);
      case pr_weighted:  return((high[i]+low[i]+close[i]+close[i])/4.0);
      case pr_average:   return((high[i]+low[i]+close[i]+open[i])/4.0);
      case pr_tbiased:   
               if (close[i]>open[i])
                     return((high[i]+close[i])/2.0);
               else  return((low[i]+close[i])/2.0);        
      case pr_tbiased2:   
               if (close[i]>open[i]) return(high[i]);
               if (close[i]<open[i]) return(low[i]);
                                     return(close[i]);        
   }
   return(0);
}

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

string getIndicatorName()
{
   string progPath = MQL5InfoString(MQL5_PROGRAM_PATH); int start=-1;
   while (true)
   {
      int foundAt = StringFind(progPath,"\\",start+1);
      if (foundAt>=0) 
               start = foundAt;
      else  break;     
   }
   string indicatorName = StringSubstr(progPath,start+1);
          indicatorName = StringSubstr(indicatorName,0,StringLen(indicatorName)-4);
   return(indicatorName);
}

//
//
//
//
//

int    _tfsPer[]={PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
string _tfsStr[]={"1 minute","2 minutes","3 minutes","4 minutes","5 minutes","6 minutes","10 minutes","12 minutes","15 minutes","20 minutes","30 minutes","1 hour","2 hours","3 hours","4 hours","6 hours","8 hours","12 hours","daily","weekly","monthly"};
string timeFrameToString(int period)
{
   if (period==PERIOD_CURRENT) 
       period = _Period;   
         int i; for(i=ArraySize(_tfsPer)-1;i>=0;i--) if(period==_tfsPer[i]) break;
   return(_tfsStr[i]);   
}