mql5
//+------------------------------------------------------------------+
//|                                                   PZ Custom Trader EA |
//|                         Forex Robot EASY Team                        |
//|                           https://forexroboteasy.com/                |
//|                                Year: 2024                            |
//+------------------------------------------------------------------+

//--- input parameters
input string      IndicatorFileName   = '';       // Custom Indicator File Name
input int         BuyBufferNumber     = -1;       // Buffer number for buy signals
input int         SellBufferNumber    = -1;       // Buffer number for sell signals
input string      StartTime           = '00:00';  // Trading session start time
input string      EndTime             = '23:59';  // Trading session end time
input bool        TradeMonday         = true;     // Enable trading on Monday
input bool        TradeTuesday        = true;     // Enable trading on Tuesday
input bool        TradeWednesday      = true;     // Enable trading on Wednesday
input bool        TradeThursday       = true;     // Enable trading on Thursday
input bool        TradeFriday         = true;     // Enable trading on Friday
input bool        InverseMode         = false;    // Inverse trading signals
input bool        MartingaleMode      = false;    // Enable Martingale strategy
input double      BreakEvenTrigger    = 10.0;     // Break-even trigger level (in pips)
input double      BreakEvenSecure     = 2.0;      // Pips to secure once break-even is activated

//--- global variables
double CurrentLotSize = 0.1;                     // Initial lot size
double LastTradeLotSize = 0.1;                   // Lot size of the last trade

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Check the custom indicator file name
   if(StringLen(IndicatorFileName) == 0)
     {
      Print('Error: No indicator file name specified.');
      return(INIT_FAILED);
     }

   // Ensure buffers are valid
   if(BuyBufferNumber < 0 || SellBufferNumber < 0)
     {
      Print('Error: Invalid buffer numbers specified.');
      return(INIT_FAILED);
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Nothing to clean up
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Check trading session and weekdays
   if(!IsTradingAllowed()) return;
   
   // Get indicator signal values
   double buySignal = iCustom(Symbol(), Period(), IndicatorFileName, BuyBufferNumber, 0);
   double sellSignal = iCustom(Symbol(), Period(), IndicatorFileName, SellBufferNumber, 0);
   
   // Handle inverse mode if enabled
   if(InverseMode)
     {
      double temp = buySignal;
      buySignal = sellSignal;
      sellSignal = temp;
     }
   
   // Handle buy signal
   if(buySignal != EMPTY_VALUE) PlaceTrade(ORDER_TYPE_BUY);

   // Handle sell signal
   if(sellSignal != EMPTY_VALUE) PlaceTrade(ORDER_TYPE_SELL);
   
   // Manage open positions
   ManageOpenPositions();
  }
//+------------------------------------------------------------------+
//| Check if trading is allowed based on session and weekday         |
//+------------------------------------------------------------------+
bool IsTradingAllowed()
  {
   datetime currentTime = TimeCurrent();
   int currentWeekday = TimeDayOfWeek(currentTime);

   // Check weekday
   switch(currentWeekday)
     {
      case 1: if(!TradeMonday) return false; break;
      case 2: if(!TradeTuesday) return false; break;
      case 3: if(!TradeWednesday) return false; break;
      case 4: if(!TradeThursday) return false; break;
      case 5: if(!TradeFriday) return false; break;
      default: return false; // Do not trade on weekends
     }

   // Check trading session times
   static int startHour, startMinute, endHour, endMinute;
   TimeToStruct(StartTime, startHour, startMinute);
   TimeToStruct(EndTime, endHour, endMinute);
   static datetime sessionStartTime, sessionEndTime;
   sessionStartTime = StructToTime(currentTime, startHour, startMinute);
   sessionEndTime = StructToTime(currentTime, endHour, endMinute);
   
   return (currentTime >= sessionStartTime && currentTime <= sessionEndTime);
  }
//+------------------------------------------------------------------+
//| Convert time string to time struct                               |
//+------------------------------------------------------------------+
bool TimeToStruct(const string str, int &hour, int &minute)
  {
   int parsedHour = StringToInteger(StringSubstr(str, 0, 2));
   int parsedMinute = StringToInteger(StringSubstr(str, 3, 2));
   if(parsedHour >= 0 && parsedHour < 24 && parsedMinute >= 0 && parsedMinute < 60)
     {
      hour = parsedHour;
      minute = parsedMinute;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//| Get datetime object from date and time parts                     |
//+------------------------------------------------------------------+
datetime StructToTime(const datetime base, const int hour, const int minute)
  {
   MqlDateTime timeStruct;
   TimeToStruct(base, timeStruct);
   timeStruct.hour = hour;
   timeStruct.min  = minute;
   return StructToTime(timeStruct);
  }
//+------------------------------------------------------------------+
//| Place trade based on signal                                      |
//+------------------------------------------------------------------+
void PlaceTrade(const ENUM_ORDER_TYPE orderType)
  {
   double lotSize = CurrentLotSize;
   
   // Handle Martingale logic if enabled
   if(MartingaleMode && OrdersTotal() > 0)
     {
      lotSize = LastTradeLotSize * 2;
     }

   // Place order
   int ticket = OrderSend(Symbol(), orderType, lotSize, Ask, 3, 0, 0, '', 0, 0, clrBlue);
   
   // Check if order placed successfully
   if(ticket > 0)
     {
      Print('Order placed successfully. Ticket: ', ticket);
      
      // Store current lot size as the last trade lot size
      LastTradeLotSize = lotSize;
     }
   else
     {
      Print('Error: Order could not be placed. Error code: ', GetLastError());
     }
  }
//+------------------------------------------------------------------+
//| Manage open positions                                            |
//+------------------------------------------------------------------+
void ManageOpenPositions()
  {
   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS))
        {
         // Check for break-even condition
         double profitPips = OrderProfit() / OrderLots();
         if(profitPips >= BreakEvenTrigger * _Point)
           {
            // Move stop loss to break even + secured pips
            double newStopLoss = OrderOpenPrice() + (BreakEvenSecure * _Point * (OrderType() == ORDER_TYPE_BUY ? 1 : -1));
            if(OrderStopLoss() < newStopLoss)
              {
               // Modify order to update stop loss
               if(OrderModify(OrderTicket(), OrderOpenPrice(), newStopLoss, OrderTakeProfit(), 0))
                 {
                  Print('Order stop loss moved to break-even + secure pips. Ticket: ', OrderTicket());
                 }
               else
                 {
                  Print('Error: Unable to move stop loss to break-even. Error code: ', GetLastError());
                 }
              }
           }
        }
     }
  }