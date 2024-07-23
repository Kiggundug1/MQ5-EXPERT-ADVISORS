mql5
//+------------------------------------------------------------------+
//|                                          Circle Rising Point.mq5 |
//|                        Copyright 2024, Forex Robot EASY Team     |
//|                        https://forexroboteasy.com/               |
//+------------------------------------------------------------------+
#property strict

// Define input parameters
input int ShortCycleLength = 14;
input int LongCycleLength = 28;
input double AlertThreshold = 0.05;

// Indicator settings
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Blue
#property indicator_color2 Red

double ExtRiseBuffer[];
double ExtFallBuffer[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Buffer setup
   SetIndexBuffer(0, ExtRiseBuffer);
   SetIndexBuffer(1, ExtFallBuffer);
   
   // Set buffer names
   IndicatorSetString(INDICATOR_SHORTNAME, 'Circle Rising Point');
   IndicatorSetString(0, 'Rise Points');
   IndicatorSetString(1, 'Fall Points');

   // Initialization success
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
   // Check the number of available bars
   if (rates_total < LongCycleLength)
      return(0);

   // Calculation of rise and fall points
   for (int i = prev_calculated; i < rates_total; i++)
     {
      double shortCycleAverage = iMA(NULL, 0, ShortCycleLength, 0, MODE_SMA, PRICE_CLOSE, i);
      double longCycleAverage = iMA(NULL, 0, LongCycleLength, 0, MODE_SMA, PRICE_CLOSE, i);

      // Identify rise points
      if ((shortCycleAverage - longCycleAverage) / longCycleAverage >= AlertThreshold)
        {
         ExtRiseBuffer[i] = high[i];
         ExtFallBuffer[i] = EMPTY_VALUE;
        }
      // Identify fall points
      else if ((longCycleAverage - shortCycleAverage) / longCycleAverage >= AlertThreshold)
        {
         ExtRiseBuffer[i] = EMPTY_VALUE;
         ExtFallBuffer[i] = low[i];
        }
      else
        {
         ExtRiseBuffer[i] = EMPTY_VALUE;
         ExtFallBuffer[i] = EMPTY_VALUE;
        }
     }

   // Return the number of calculated bars
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Helper function to send alerts                                   |
//+------------------------------------------------------------------+
void SendAlert(const string message)
  {
   // Display an alert message
   Alert(message);
   
   // Send the message via other methods if implemented, e.g., email or SMS
  }
//+------------------------------------------------------------------+