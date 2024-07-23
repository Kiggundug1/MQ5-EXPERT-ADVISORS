//
// EA Studio Expert Advisor
//
// Created with: Expert Advisor Studio
// Website: https://studio.eatradingacademy.com/
//
// Copyright 2023, Forex Software Ltd.
//
// Risk Disclosure
//
// Futures and forex trading contains substantial risk and is not for every investor.
// An investor could potentially lose all or more than the initial investment.
// Risk capital is money that can be lost without jeopardizing ones’ financial security or life style.
// Only risk capital should be used for trading and only those with sufficient risk capital should consider trading.

#property copyright "Forex Software Ltd."
#property version   "3.5"
#property strict

static input string _Properties_ = "------"; // --- Expert Properties ---
static input double Entry_Amount =     0.10; // Entry lots
       input int    Stop_Loss    =       50; // Stop Loss   (pips)
       input int    Take_Profit  =       65; // Take Profit (pips)

static input string ___0______   = "------"; // --- Entry Time ---
       input int    Ind0Param0   =        1; // From hour
       input int    Ind0Param1   =        0; // From minute
       input int    Ind0Param2   =       23; // Until hour
       input int    Ind0Param3   =        0; // Until minute

static input string ___1______   = "------"; // --- Envelopes ---
       input int    Ind1Param0   =       16; // Period
       input double Ind1Param1   =     0.07; // Deviation %

static input string ___2______   = "------"; // --- DeMarker ---
       input int    Ind2Param0   =       30; // Period
       input double Ind2Param1   =     0.46; // Level

static input string ___3______   = "------"; // --- MACD ---
       input int    Ind3Param0   =       10; // Fast EMA
       input int    Ind3Param1   =       29; // Slow EMA
       input int    Ind3Param2   =        9; // MACD SMA

static input string ___4______   = "------"; // --- RSI ---
       input int    Ind4Param0   =       18; // Period
       input int    Ind4Param1   =       47; // Level

static input string ___5______   = "------"; // --- RSI ---
       input int    Ind5Param0   =       19; // Period
       input int    Ind5Param1   =       30; // Level

static input string ___6______   = "------"; // --- Average True Range ---
       input int    Ind6Param0   =       12; // Period
       input double Ind6Param1   =   0.0015; // Level
static input string __Options___ = "------"; // --- Options ---
static input int    Magic_Number = 61987266; // Magic Number
static input int    Max_Spread   =        0; // Max spread protection (points)
static input int    Min_Equity   =        0; // Min equity protection (currency)

#define TRADE_RETRY_COUNT   4
#define TRADE_RETRY_WAIT  100
#define OP_FLAT            -1
#define OP_BUY            ORDER_TYPE_BUY
#define OP_SELL           ORDER_TYPE_SELL

// Session time is set in seconds from 00:00
int  sessionSundayOpen          =     0; // 00:00
int  sessionSundayClose         = 86400; // 24:00
int  sessionMondayThursdayOpen  =     0; // 00:00
int  sessionMondayThursdayClose = 86400; // 24:00
int  sessionFridayOpen          =     0; // 00:00
int  sessionFridayClose         = 86400; // 24:00
bool sessionIgnoreSunday        = true;
bool sessionCloseAtSessionClose = false;
bool sessionCloseAtFridayClose  = false;

const double sigma = 0.000001;

double posType       = OP_FLAT;
ulong  posTicket     = 0;
double posLots       = 0;
double posStopLoss   = 0;
double posTakeProfit = 0;

datetime barTime;
double   pip;
double   stopLevel;
bool     isTrailingStop=false;
ENUM_ORDER_TYPE_FILLING orderFillingType = ORDER_FILLING_FOK;
int indHandlers[1][12][2];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit(void)
  {
   barTime        = Time(0);
   stopLevel      = (int) SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
   pip            = GetPipValue();
   isTrailingStop = isTrailingStop && Stop_Loss > 0;

   InitIndicators();

   return ValidateInit();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   long windowsCount = -1;
   ChartGetInteger(0, CHART_WINDOWS_TOTAL, 0, windowsCount);

   for(int window = (int) windowsCount-1; window >= 0; --window)
     {
      const int indicatorsCount = ChartIndicatorsTotal(0, window);
      for(int index = indicatorsCount-1; index >= 0; --index)
        {
         const string name = ChartIndicatorName(0, window, index);
         ChartIndicatorDelete(0, window, name);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick(void)
  {
   if(Min_Equity>0 && AccountInfoDouble(ACCOUNT_EQUITY)<Min_Equity)
      ActivateMinEquityProtection();

   const datetime time = Time(0);
   if(time > barTime)
     {
      barTime = time;
      OnBar();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnBar(void)
  {
   UpdatePosition();

   if(posType != OP_FLAT && IsForceSessionClose())
     {
      ClosePosition();
      return;
     }

   if(IsOutOfSession())
      return;

   if(posType != OP_FLAT)
     {
      ManageClose();
      UpdatePosition();
     }

   if(posType != OP_FLAT && isTrailingStop)
     {
      double trailingStop=GetTrailingStopPrice();
      ManageTrailingStop(trailingStop);
      UpdatePosition();
     }

   int entrySignal = GetEntrySignal();

   if ((posType == OP_BUY  && entrySignal == OP_SELL) ||
       (posType == OP_SELL && entrySignal == OP_BUY ))
     {
      ClosePosition();

      // Hack to prevent MT bug https://forexsb.com/forum/post/73434/#p73434
      int repeatCount = 80;
      int delay       = 50;
      for (int i = 0; i < repeatCount; i++)
      {
         UpdatePosition();
         if (posType == OP_FLAT) break;
         Sleep(delay);
      }
     }

   if(posType == OP_FLAT && entrySignal != OP_FLAT)
     {
      OpenPosition(entrySignal);
      UpdatePosition();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void UpdatePosition(void)
  {
   posType   = OP_FLAT;
   posTicket = 0;
   posLots   = 0;
   int posTotal = PositionsTotal();
   for(int posIndex = 0; posIndex < posTotal; posIndex++)
     {
      ulong ticket = PositionGetTicket(posIndex);
      if(PositionSelectByTicket(ticket) &&
          PositionGetString(POSITION_SYMBOL) == _Symbol &&
          PositionGetInteger(POSITION_MAGIC) == Magic_Number)
        {
         posType       = (int) PositionGetInteger(POSITION_TYPE);
         posTicket     = ticket;
         posLots       = NormalizeDouble(PositionGetDouble(POSITION_VOLUME),  2);
         posStopLoss   = NormalizeDouble(PositionGetDouble(POSITION_SL), _Digits);
         posTakeProfit = NormalizeDouble(PositionGetDouble(POSITION_TP), _Digits);
         break;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void InitIndicators(void)
  {
   // Entry Time (1, 0, 23, 0)
   indHandlers[0][0][0] = -1;
   ChartIndicatorAdd(0, 0, indHandlers[0][0][0]);
   // Envelopes (Close, Simple, 16, 0.07)
   indHandlers[0][1][0] = iEnvelopes(NULL, 0, Ind1Param0, 0, MODE_SMA, PRICE_CLOSE, Ind1Param1);
   ChartIndicatorAdd(0, 0, indHandlers[0][1][0]);
   // DeMarker (30), Level: 0.46
   indHandlers[0][2][0] = iDeMarker(NULL, 0, Ind2Param0);
   ChartIndicatorAdd(0, 1, indHandlers[0][2][0]);
   // MACD (Close, 10, 29, 9)
   indHandlers[0][3][0] = iMACD(NULL, 0, Ind3Param0, Ind3Param1, Ind3Param2, PRICE_CLOSE);
   ChartIndicatorAdd(0, 2, indHandlers[0][3][0]);
   // RSI (Close, 18), Level: 47
   indHandlers[0][4][0] = iRSI(NULL, 0, Ind4Param0, PRICE_CLOSE);
   ChartIndicatorAdd(0, 3, indHandlers[0][4][0]);
   // RSI (Close, 19)
   indHandlers[0][5][0] = iRSI(NULL, 0, Ind5Param0, PRICE_CLOSE);
   ChartIndicatorAdd(0, 4, indHandlers[0][5][0]);
   // Average True Range (12), Level: 0.0015
   indHandlers[0][6][0] = iATR(NULL, 0, Ind6Param0);
   ChartIndicatorAdd(0, 5, indHandlers[0][6][0]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetEntrySignal(void)
  {
   // Entry Time (1, 0, 23, 0)

   int fromTime0  = Ind0Param0 * 3600 + Ind0Param1 * 60;
   int untilTime0 = Ind0Param2 * 3600 + Ind0Param3 * 60;

   MqlDateTime mqlTime0;
   TimeToStruct(Time(0), mqlTime0);
   int barMinutes0 = mqlTime0.hour * 3600 + mqlTime0.min * 60;

   bool isOnTime0 = fromTime0 < untilTime0
      ? barMinutes0 >= fromTime0 && barMinutes0 <= untilTime0
      : barMinutes0 >= fromTime0 || barMinutes0 <= untilTime0;

   bool ind0long  = isOnTime0;
   bool ind0short = isOnTime0;


   // Envelopes (Close, Simple, 16, 0.07)
   double ind1buffer0[]; CopyBuffer(indHandlers[0][1][0], 0, 1, 2, ind1buffer0);
   double ind1buffer1[]; CopyBuffer(indHandlers[0][1][0], 1, 1, 2, ind1buffer1);
   double ind1upBand1 = ind1buffer0[1];
   double ind1dnBand1 = ind1buffer1[1];
   double ind1upBand2 = ind1buffer0[0];
   double ind1dnBand2 = ind1buffer1[0];
   bool   ind1long    = Open(0) > ind1dnBand1 + sigma && Open(1) < ind1dnBand2 - sigma;
   bool   ind1short   = Open(0) < ind1upBand1 - sigma && Open(1) > ind1upBand2 + sigma;

   // DeMarker (30), Level: 0.46
   double ind2buffer[]; CopyBuffer(indHandlers[0][2][0], 0, 1, 3, ind2buffer);
   double ind2val1  = ind2buffer[2];
   bool   ind2long  = ind2val1 > Ind2Param1 + sigma;
   bool   ind2short = ind2val1 < 1 - Ind2Param1 - sigma;

   // MACD (Close, 10, 29, 9)
   double ind3buffer[]; CopyBuffer(indHandlers[0][3][0], 0, 1, 3, ind3buffer);
   double ind3val1  = ind3buffer[2];
   double ind3val2  = ind3buffer[1];
   bool   ind3long  = ind3val1 > ind3val2 + sigma;
   bool   ind3short = ind3val1 < ind3val2 - sigma;

   // RSI (Close, 18), Level: 47
   double ind4buffer[]; CopyBuffer(indHandlers[0][4][0], 0, 1, 3, ind4buffer);
   double ind4val1  = ind4buffer[2];
   bool   ind4long  = ind4val1 > Ind4Param1 + sigma;
   bool   ind4short = ind4val1 < 100 - Ind4Param1 - sigma;

   // RSI (Close, 19)
   double ind5buffer[]; CopyBuffer(indHandlers[0][5][0], 0, 1, 3, ind5buffer);
   double ind5val1  = ind5buffer[2];
   double ind5val2  = ind5buffer[1];
   double ind5val3  = ind5buffer[0];
   bool   ind5long  = ind5val1 > ind5val2 + sigma && ind5val2 < ind5val3 - sigma;
   bool   ind5short = ind5val1 < ind5val2 - sigma && ind5val2 > ind5val3 + sigma;

   bool canOpenLong  = ind0long && ind1long && ind2long && ind3long && ind4long && ind5long;
   bool canOpenShort = ind0short && ind1short && ind2short && ind3short && ind4short && ind5short;

   return canOpenLong  && !canOpenShort ? OP_BUY
        : canOpenShort && !canOpenLong  ? OP_SELL
        : OP_FLAT;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ManageClose(void)
  {
   // Average True Range (12), Level: 0.0015
   double ind6buffer[]; CopyBuffer(indHandlers[0][6][0], 0, 1, 3, ind6buffer);
   double ind6val1  = ind6buffer[2];
   double ind6val2  = ind6buffer[1];
   bool   ind6long  = ind6val1 > Ind6Param1 + sigma && ind6val2 < Ind6Param1 - sigma;
   bool   ind6short = ind6long;

   if( (posType == OP_BUY  && ind6long) ||
        (posType == OP_SELL && ind6short) )
      ClosePosition();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OpenPosition(const int command)
  {
   if(!IsWithinMaxSpread()) return;

   const double stopLoss   = GetStopLossPrice(command);
   const double takeProfit = GetTakeProfitPrice(command);
   ManageOrderSend(command, Entry_Amount, stopLoss, takeProfit, 0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ClosePosition(void)
  {
   const int command = posType == OP_BUY ? OP_SELL : OP_BUY;
   ManageOrderSend(command, posLots, 0, 0, posTicket);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ManageOrderSend(int command, double lots, double stopLoss, double takeProfit, ulong ticket)
  {
   for(int attempt = 0; attempt < TRADE_RETRY_COUNT; attempt++)
     {
      if(IsTradeContextFree())
        {
         MqlTradeRequest request;
         MqlTradeResult  result;
         ZeroMemory(request);
         ZeroMemory(result);

         request.action       = TRADE_ACTION_DEAL;
         request.symbol       = _Symbol;
         request.volume       = lots;
         request.type         = command == OP_BUY ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
         request.price        = command == OP_BUY ? Ask() : Bid();
         request.type_filling = orderFillingType;
         request.deviation    = 10;
         request.sl           = stopLoss;
         request.tp           = takeProfit;
         request.magic        = Magic_Number;
         request.position     = ticket;
         request.comment      = IntegerToString(Magic_Number);

         bool isOrderCheck = CheckOrder(request);
         bool isOrderSend  = false;

         if(isOrderCheck)
           {
            ResetLastError();
            isOrderSend = OrderSend(request, result);
           }

         if(isOrderCheck && isOrderSend && result.retcode == TRADE_RETCODE_DONE)
            return;
        }

      Sleep(TRADE_RETRY_WAIT);
      Print("Order Send retry no: " + IntegerToString(attempt + 2));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModifyPosition(double stopLoss, double takeProfit, ulong ticket)
  {
   for(int attempt = 0; attempt < TRADE_RETRY_COUNT; attempt++)
     {
      if(IsTradeContextFree())
        {
         MqlTradeRequest request;
         MqlTradeResult  result;
         ZeroMemory(request);
         ZeroMemory(result);

         request.action   = TRADE_ACTION_SLTP;
         request.symbol   = _Symbol;
         request.sl       = stopLoss;
         request.tp       = takeProfit;
         request.magic    = Magic_Number;
         request.position = ticket;
         request.comment  = IntegerToString(Magic_Number);

         bool isOrderCheck = CheckOrder(request);
         bool isOrderSend  = false;

         if(isOrderCheck)
           {
            ResetLastError();
            isOrderSend = OrderSend(request, result);
           }

         if(isOrderCheck && isOrderSend && result.retcode == TRADE_RETCODE_DONE)
            return;
        }

      Sleep(TRADE_RETRY_WAIT);
      Print("Order Send retry no: " + IntegerToString(attempt + 2));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckOrder(MqlTradeRequest &request)
  {
   MqlTradeCheckResult check;
   ZeroMemory(check);
   ResetLastError();

   if(OrderCheck(request, check))
      return true;

   Print("Error with OrderCheck: " + check.comment);

   if(check.retcode == TRADE_RETCODE_INVALID_FILL)
     {
      switch (orderFillingType)
        {
         case ORDER_FILLING_FOK:
            Print("Filling mode changed to: ORDER_FILLING_IOC");
            orderFillingType = ORDER_FILLING_IOC;
            break;
         case ORDER_FILLING_IOC:
            Print("Filling mode changed to: ORDER_FILLING_RETURN");
            orderFillingType = ORDER_FILLING_RETURN;
            break;
         case ORDER_FILLING_RETURN:
            Print("Filling mode changed to: ORDER_FILLING_FOK");
            orderFillingType = ORDER_FILLING_FOK;
            break;
        }

      request.type_filling = orderFillingType;

      return CheckOrder(request);
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetStopLossPrice(const int command)
  {
   if(Stop_Loss == 0)
      return 0;

   const double delta    = MathMax(pip * Stop_Loss, _Point * stopLevel);
   const double stopLoss = command == OP_BUY ? Bid() - delta : Ask() + delta;

   return NormalizeDouble(stopLoss, _Digits);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetTakeProfitPrice(const int command)
  {
   if(Take_Profit == 0)
      return 0;

   const double delta      = MathMax(pip * Take_Profit, _Point * stopLevel);
   const double takeProfit = command == OP_BUY ? Bid() + delta : Ask() - delta;

   return NormalizeDouble(takeProfit, _Digits);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetTrailingStopPrice(void)
  {
   const double bid = Bid();
   const double ask = Ask();
   const double spread = ask - bid;
   const double stopLevelPoints = _Point * stopLevel;
   const double stopLossPoints  = pip * Stop_Loss;

   if(posType == OP_BUY)
     {
      const double newStopLoss = High(1) - stopLossPoints;
      if(posStopLoss <= newStopLoss - pip)
         return newStopLoss < bid
                  ? newStopLoss >= bid - stopLevelPoints
                     ? bid - stopLevelPoints
                     : newStopLoss
                  : bid;
     }

   if(posType == OP_SELL)
     {
      const double newStopLoss = Low(1) + spread + stopLossPoints;
      if(posStopLoss >= newStopLoss + pip)
         return newStopLoss > ask
                  ? newStopLoss <= ask + stopLevelPoints
                     ? ask + stopLevelPoints
                     : newStopLoss
                  : ask;
     }

   return posStopLoss;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ManageTrailingStop(const double trailingStop)
  {
   if((posType == OP_BUY  && MathAbs(trailingStop - Bid()) < _Point) ||
      (posType == OP_SELL && MathAbs(trailingStop - Ask()) < _Point))
     {
      ClosePosition();
      return;
     }

   if(MathAbs(trailingStop - posStopLoss) > _Point)
     {
      posStopLoss = NormalizeDouble(trailingStop, _Digits);
      ModifyPosition(posStopLoss, posTakeProfit, posTicket);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Bid(void)
  {
   return SymbolInfoDouble(_Symbol, SYMBOL_BID);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ask(void)
  {
   return SymbolInfoDouble(_Symbol, SYMBOL_ASK);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime Time(int bar)
  {
   datetime buffer[];
   ArrayResize(buffer, 1);
   return CopyTime(_Symbol, _Period, bar, 1, buffer) == 1 ? buffer[0] : 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Open(int bar)
  {
   double buffer[];
   ArrayResize(buffer, 1);
   return CopyOpen(_Symbol, _Period, bar, 1, buffer) == 1 ? buffer[0] : 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double High(int bar)
  {
   double buffer[];
   ArrayResize(buffer, 1);
   return CopyHigh(_Symbol, _Period, bar, 1, buffer) == 1 ? buffer[0] : 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Low(int bar)
  {
   double buffer[];
   ArrayResize(buffer, 1);
   return CopyLow(_Symbol, _Period, bar, 1, buffer) == 1 ? buffer[0] : 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Close(int bar)
  {
   double buffer[];
   ArrayResize(buffer, 1);
   return CopyClose(_Symbol, _Period, bar, 1, buffer) == 1 ? buffer[0] : 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetPipValue(void)
  {
   return _Digits == 4 || _Digits == 5 ? 0.0001
        : _Digits == 2 || _Digits == 3 ? 0.01
                        : _Digits == 1 ? 0.1 : 1;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsTradeAllowed(void)
  {
   return (bool) MQL5InfoInteger(MQL5_TRADE_ALLOWED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RefreshRates(void)
  {
   // Dummy function to make it compatible with MQL4
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int DayOfWeek(void)
  {
   MqlDateTime mqlTime;
   TimeToStruct(Time(0), mqlTime);
   return mqlTime.day_of_week;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsTradeContextFree(void)
  {
   if(IsTradeAllowed())
      return true;

   uint startWait = GetTickCount();
   Print("Trade context is busy! Waiting...");

   while(true)
     {
      if(IsStopped())
         return false;

      uint diff = GetTickCount() - startWait;
      if(diff > 30 * 1000)
        {
         Print("The waiting limit exceeded!");
         return false;
        }

      if(IsTradeAllowed())
        {
         RefreshRates();
         return true;
        }

      Sleep(TRADE_RETRY_WAIT);
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsOutOfSession(void)
  {
   const int dayOfWeek    = DayOfWeek();
   const int periodStart  = int(Time(0) % 86400);
   const int periodLength = PeriodSeconds(_Period);
   const int periodFix    = periodStart + (sessionCloseAtSessionClose ? periodLength : 0);
   const int friBarFix    = periodStart + (sessionCloseAtFridayClose || sessionCloseAtSessionClose ? periodLength : 0);

   return dayOfWeek == 0 && sessionIgnoreSunday ? true
        : dayOfWeek == 0 ? periodStart < sessionSundayOpen         || periodFix > sessionSundayClose
        : dayOfWeek  < 5 ? periodStart < sessionMondayThursdayOpen || periodFix > sessionMondayThursdayClose
                         : periodStart < sessionFridayOpen         || friBarFix > sessionFridayClose;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsForceSessionClose(void)
  {
   if(!sessionCloseAtFridayClose && !sessionCloseAtSessionClose)
      return false;

   const int dayOfWeek = DayOfWeek();
   const int periodEnd = int(Time(0) % 86400) + PeriodSeconds(_Period);

   return dayOfWeek == 0 && sessionCloseAtSessionClose ? periodEnd > sessionSundayClose
        : dayOfWeek  < 5 && sessionCloseAtSessionClose ? periodEnd > sessionMondayThursdayClose
        : dayOfWeek == 5 ? periodEnd > sessionFridayClose : false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsWithinMaxSpread(void)
  {
   if(Max_Spread == 0)
      return true;

   for(int attempt = 0; attempt < TRADE_RETRY_COUNT; attempt += 1)
     {
      const int spread = (int) MathRound((Ask() - Bid()) / _Point);

      if(spread <= Max_Spread)
         return true;

      Print("Too high spread of " + IntegerToString(spread) + " points. Waiting...");
      Sleep(TRADE_RETRY_WAIT);
     }

   Print("The entry order is cancelled due to too high spread.");

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActivateMinEquityProtection(void)
  {
   if(posType == OP_BUY || posType == OP_SELL)
      ClosePosition();

   const string equity  = DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY), 2);
   const string message = "Minimum equity protection activated at: " + IntegerToString(Min_Equity);
   Comment(message);
   Print(message);

   Sleep(20 * 1000);
   ExpertRemove();
   OnDeinit(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_INIT_RETCODE ValidateInit(void)
  {
   return INIT_SUCCEEDED;
  }
//+------------------------------------------------------------------+
/*STRATEGY MARKET FTMO-Data; USDCHF; M15 */
/*STRATEGY CODE {"properties":{"entryLots":0.1,"tradeDirectionMode":0,"oppositeEntrySignal":1,"stopLoss":50,"takeProfit":65,"useStopLoss":true,"useTakeProfit":true,"isTrailingStop":false},"openFilters":[{"name":"Entry Time","listIndexes":[0,0,0,0,0],"numValues":[1,0,23,0,0,0]},{"name":"Envelopes","listIndexes":[5,3,0,0,0],"numValues":[16,0.07,0,0,0,0]},{"name":"DeMarker","listIndexes":[2,0,0,0,0],"numValues":[30,0.46,0,0,0,0]},{"name":"MACD","listIndexes":[0,3,0,0,0],"numValues":[10,29,9,0,0,0]},{"name":"RSI","listIndexes":[2,3,0,0,0],"numValues":[18,47,0,0,0,0]},{"name":"RSI","listIndexes":[6,3,0,0,0],"numValues":[19,30,0,0,0,0]}],"closeFilters":[{"name":"Average True Range","listIndexes":[4,0,0,0,0],"numValues":[12,0.0015,0,0,0,0]}]} */
