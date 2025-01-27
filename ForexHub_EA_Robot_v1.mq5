//+------------------------------------------------------------------+
//|                                            ForexHub EA Robot.mq4 |
//|    Copyright 2020,Founder Kyle Maxwell @kyle_forexhub SA   Corp. |
//|                             +27814316650    https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020,Founder Kyle Maxwell @kyle_forexhub SA   Corp."
#property link      "+27814316650    https://www.mql5.com"
#property version   "1.00"
#property strict

input bool LHLLAndHHHL = true;
input bool LHLLAndHHHLWithin = true;
input bool ReversalIB = true;
input bool ReversalIBWithin = true;
input bool ContinuationIB = true;

input double FixedLot = 0.1;
input double PercentMargin = 1.0;

input int P1Filter = 1;
input int PeriodATRH = 120;
input double ATRHKoeffTP = 1.9;
input double ATRHKoeffSL = 1.3;
input double ATRHKoeffBreak = 0.2;
input double RSLKoeff = 0.5;

input int ExpirationEntryType1 = 12;
input int ExpirationSpecialEntryType1 = 2;
input double ATRHKoeffForSpecialExpirationEntryType1 = 2.0;
input int ExpirationEntryType2 = 12;
input int ExpirationEntryType3 = 1;
input int ExpirationEntryType4 = 1;
input int ExpirationEntryType5 = 1;

input double ATRHKoeffForTrailingStop = 0.2;
input int AllowableSpread = 50;
input int Magic = 256833;
input int Slippage = 10;

double stoplevel, freezy, hi, lo;
double ATRH, spread, entry, TP, SL, Break, RSL, RSLT;
datetime expir, LE1_TimeSBar, SE1_TimeSBar, LE3_TimeSBar, SE3_TimeSBar, LE5_TimeSBar, SE5_TimeSBar;
int shiftSBar;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   stoplevel = MarketInfo(_Symbol,MODE_STOPLEVEL);
   freezy = MarketInfo(_Symbol,MODE_FREEZELEVEL);
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
//---
   //Movement sl: trailing, breakeven level, reduce risk level
   int total = OrdersTotal();
   for(int i=0; i<total; i++) {
      if(OrderSelect(i,SELECT_BY_POS) && OrderSymbol()==_Symbol && OrderMagicNumber()==Magic) {
         int f = StringFind(OrderComment(),"S");
         if(f>=0 && OrderType()==OP_BUY && isHHHL()) {
            double spr = StringToDouble(StringSubstr(OrderComment(),f+1));
            int bshift = iBarShift(_Symbol,PERIOD_CURRENT,OrderOpenTime(),false);
            double highest = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,bshift,0)];
            computeForLongDt(bshift+1,spr);
            if(highest>=TP) {
               double newsl = NormalizeDouble(Low[bshift+2] - ATRH*ATRHKoeffForTrailingStop,_Digits);
               if(newsl>OrderStopLoss()) {
                  Print("HHHL traling stop for buy ("+DoubleToStr(newsl,_Digits)+","+DoubleToStr(OrderStopLoss(),_Digits)+") ["+DoubleToStr(ATRH,_Digits)+","+DoubleToStr(spread,0)+","+DoubleToStr(entry,_Digits)+","+DoubleToStr(TP,_Digits)+","+DoubleToStr(SL,_Digits)+","+DoubleToStr(Break,_Digits)+","+DoubleToStr(RSL,_Digits)+","+DoubleToStr(RSLT,_Digits)+"]");
                  modifyBuy(OrderTicket(),OrderOpenPrice(),newsl,OrderTakeProfit(),OrderExpiration()); return;
               }
            }
         }
         else if(f>=0 && OrderType()==OP_SELL && isLHLL()) {
            double spr = StringToDouble(StringSubstr(OrderComment(),f+1));
            int bshift = iBarShift(_Symbol,PERIOD_CURRENT,OrderOpenTime(),false);
            double lowest = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,bshift,0)];
            computeForShortDt(bshift+1,spr);
            if(lowest<=TP) {
               double newsl = NormalizeDouble(High[bshift+2] + ATRH*ATRHKoeffForTrailingStop,_Digits);
               if(newsl<OrderStopLoss()) {
                  Print("LHLL traling stop for sell ("+DoubleToStr(newsl,_Digits)+","+DoubleToStr(OrderStopLoss(),_Digits)+") ["+DoubleToStr(ATRH,_Digits)+","+DoubleToStr(spread,0)+","+DoubleToStr(entry,_Digits)+","+DoubleToStr(TP,_Digits)+","+DoubleToStr(SL,_Digits)+","+DoubleToStr(Break,_Digits)+","+DoubleToStr(RSL,_Digits)+","+DoubleToStr(RSLT,_Digits)+"]");
                  modifySell(OrderTicket(),OrderOpenPrice(),newsl,OrderTakeProfit(),OrderExpiration()); return;
               }
            }
         }
         
         else if(f>=0 && OrderType()==OP_BUY) {
            double spr = StringToDouble(StringSubstr(OrderComment(),f+1));
            int bshift = iBarShift(_Symbol,PERIOD_CURRENT,OrderOpenTime(),false);
            computeForLongDt(bshift+1,spr);
            double newsl = 0.0;
            string text = "";
            if(Close[0]>=RSLT) { text = "RSL reduce risk movement stoploss for buy ("; newsl = NormalizeDouble(RSL,_Digits); }
            else if(Close[0]>=Break) { text = "Breakeven movement stoploss for buy ("; newsl = OrderOpenPrice(); }
            if(newsl>OrderStopLoss()) {
               Print(text+DoubleToStr(newsl,_Digits)+","+DoubleToStr(OrderStopLoss(),_Digits)+") ["+DoubleToStr(ATRH,_Digits)+","+DoubleToStr(spread,0)+","+DoubleToStr(entry,_Digits)+","+DoubleToStr(TP,_Digits)+","+DoubleToStr(SL,_Digits)+","+DoubleToStr(Break,_Digits)+","+DoubleToStr(RSL,_Digits)+","+DoubleToStr(RSLT,_Digits)+"]");
               modifyBuy(OrderTicket(),OrderOpenPrice(),newsl,OrderTakeProfit(),OrderExpiration()); return;
            }
         }
         else if(f>=0 && OrderType()==OP_SELL) {
            double spr = StringToDouble(StringSubstr(OrderComment(),f+1));
            int bshift = iBarShift(_Symbol,PERIOD_CURRENT,OrderOpenTime(),false);
            computeForShortDt(bshift+1,spr);
            double newsl = 0.0;
            string text = "";
            if(Close[0]<=RSLT) { text = "RSL reduce risk movement stoploss for sell ("; newsl = NormalizeDouble(RSL,_Digits); }
            else if(Close[0]<=Break) { text = "Breakeven movement stoploss for sell ("; newsl = OrderOpenPrice(); }
            if(newsl>0.0 && newsl<OrderStopLoss()) {
               Print(text+DoubleToStr(newsl,_Digits)+","+DoubleToStr(OrderStopLoss(),_Digits)+") ["+DoubleToStr(ATRH,_Digits)+","+DoubleToStr(spread,0)+","+DoubleToStr(entry,_Digits)+","+DoubleToStr(TP,_Digits)+","+DoubleToStr(SL,_Digits)+","+DoubleToStr(Break,_Digits)+","+DoubleToStr(RSL,_Digits)+","+DoubleToStr(RSLT,_Digits)+"]");
               modifySell(OrderTicket(),OrderOpenPrice(),newsl,OrderTakeProfit(),OrderExpiration()); return;
            }
         }
      }
   }
   //***************************************************************************************
   //Long Entry Type2
   if(LHLLAndHHHL && LHLLAndHHHLWithin && LE1_TimeSBar>0 && isLHLL() && Low[2]>Low[1] && Low[3]>Low[1] && Low[4]>Low[1] && Low[5]>Low[1]) {
      shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE1_TimeSBar,false) - 1;
      hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
      lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      if(shiftSBar>=0 && hi<=High[shiftSBar+1] && lo>=Low[shiftSBar]) {
         if(getTicketByComment("WLHLL"+IntegerToString(Time[1]))==0) {
            computeForLong();
            expir = TimeCurrent()+ExpirationEntryType2*60*60;
            Print("Place Long Entry Type2");
            buyStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WLHLL"+IntegerToString(Time[1]), expir); return;
         }
      }
   }
   
   //Short Entry Type2
   if(LHLLAndHHHL && LHLLAndHHHLWithin && SE1_TimeSBar>0 && isHHHL() && High[2]<High[1] && High[3]<High[1] && High[4]<High[1] && High[5]<High[1]) {
      shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE1_TimeSBar,false) - 1;
      hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
      lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      if(shiftSBar>=0 && hi<=High[shiftSBar] && lo>=Low[shiftSBar+1]) {
         if(getTicketByComment("WHHHL"+IntegerToString(Time[1]))==0) {
            computeForShort();
            expir = TimeCurrent()+ExpirationEntryType2*60*60;
            Print("Place Short Entry Type2");
            sellStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WHHHL"+IntegerToString(Time[1]), expir); return;
         }
      }
   }
   
   //Long Entry Type1
   if(LHLLAndHHHL && isLHLL() && Low[2]>Low[1] && Low[3]>Low[1] && Low[4]>Low[1] && Low[5]>Low[1]) {
      if(LE1_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE1_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((LE1_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar+1] && lo<Low[shiftSBar])) && getTicketByComment("LHLL"+IntegerToString(Time[1]))==0) {
         computeForLong();
         LE1_TimeSBar = Time[1];
         if(High[2]-Low[1]>ATRH*ATRHKoeffForSpecialExpirationEntryType1) expir = TimeCurrent()+ExpirationSpecialEntryType1*60*60;
         else expir = TimeCurrent()+ExpirationEntryType1*60*60;
         int t = getTicketByComment("LHLL");
         if(t>0) {
            if(OrderSelect(t,SELECT_BY_TICKET) && OrderType()==OP_BUYSTOP) {
               bool d = OrderDelete(t,clrSilver);
               if(!d) Print("Error delete order "+IntegerToString(_LastError));
               return;
            }
         }
         Print("Place Long Entry Type1");
         buyStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "LHLL"+IntegerToString(LE1_TimeSBar)+"S"+DoubleToString(spread,0), expir); return;
      }
   }
   
   //Short Entry Type1
   if(LHLLAndHHHL && isHHHL() && High[2]<High[1] && High[3]<High[1] && High[4]<High[1] && High[5]<High[1]) {
      if(SE1_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE1_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((SE1_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar] && lo<Low[shiftSBar+1])) && getTicketByComment("HHHL"+IntegerToString(Time[1]))==0) {
         computeForShort();
         SE1_TimeSBar = Time[1];
         if(High[1]-Low[2]>ATRH*ATRHKoeffForSpecialExpirationEntryType1) expir = TimeCurrent()+ExpirationSpecialEntryType1*60*60;
         else expir = TimeCurrent()+ExpirationEntryType1*60*60;
         int t = getTicketByComment("HHHL");
         if(t>0) {
            if(OrderSelect(t,SELECT_BY_TICKET) && OrderType()==OP_SELLSTOP) {
               bool d = OrderDelete(t,clrSilver);
               if(!d) Print("Error delete order "+IntegerToString(_LastError));
               return;
            }
         }
         Print("Place Short Entry Type1");
         sellStop(getLots(),NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits),"HHHL"+IntegerToString(SE1_TimeSBar)+"S"+DoubleToString(spread,0),expir); return;
      }
   }
   //*****************************************************************************************
   //Long Entry Type4
   if(ReversalIBWithin && ((ReversalIB && LE3_TimeSBar>0)|| (ContinuationIB && LE5_TimeSBar>0 && Low[7]>Low[2] && Low[8]>Low[2] && Low[9]>Low[2] && Low[10]>Low[2] && Low[11]>Low[2] && Low[12]>Low[2] && Low[13]>Low[2] && Low[14]>Low[2])) && isIB() && Low[3]>Low[2] && Low[4]>Low[2] && Low[5]>Low[2] && Low[6]>Low[2]) {
      if(LE3_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE3_TimeSBar,false) - 1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
         if(shiftSBar>=0 && hi<=High[shiftSBar+1] && lo>=Low[shiftSBar]) {
            if(getTicketByComment("WLIB"+IntegerToString(Time[1]))==0) {
               computeForLong();
               expir = TimeCurrent()+ExpirationEntryType4*60*60;
               Print("Place Long Entry Type4");
               buyStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WLIB"+IntegerToString(Time[1]), expir); return;
            }
         }
      }
      if(LE5_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE5_TimeSBar,false) - 1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
         if(shiftSBar>=0 && hi<=High[shiftSBar+1] && lo>=Low[shiftSBar]) {
            if(getTicketByComment("WLIB"+IntegerToString(Time[1]))==0) {
               computeForLong();
               expir = TimeCurrent()+ExpirationEntryType4*60*60;
               Print("Place Long Entry Type4");
               buyStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WLIB"+IntegerToString(Time[1]), expir); return;
            }
         }
      }
   }
   
   //Short Entry Type4
   if(ReversalIBWithin && ((ReversalIB && SE3_TimeSBar>0) || (ContinuationIB && SE5_TimeSBar && High[7]<High[2] && High[8]<High[2] && High[9]<High[2] && High[10]<High[2] && High[11]<High[2] && High[12]<High[2] && High[13]<High[2] && High[14]<High[2])) && isIB() && High[3]<High[2] && High[4]<High[2] && High[5]<High[2] && High[6]<High[2]) {
      if(SE3_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE3_TimeSBar,false) - 1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
         if(shiftSBar>=0 && hi<=High[shiftSBar] && lo>=Low[shiftSBar+1]) {
            if(getTicketByComment("WSIB"+IntegerToString(Time[1]))==0) {
               computeForShort();
               expir = TimeCurrent()+ExpirationEntryType4*60*60;
               Print("Place Short Entry Type4");
               sellStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WSIB"+IntegerToString(Time[1]), expir); return;
            }
         }
      }
      
      if(SE5_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE5_TimeSBar,false) - 1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
         if(shiftSBar>=0 && hi<=High[shiftSBar] && lo>=Low[shiftSBar+1]) {
            if(getTicketByComment("WSIB"+IntegerToString(Time[1]))==0) {
               computeForShort();
               expir = TimeCurrent()+ExpirationEntryType4*60*60;
               Print("Place Short Entry Type4");
               sellStop(getLots(), NormalizeDouble(entry,_Digits), NormalizeDouble(SL,_Digits), NormalizeDouble(TP,_Digits), "WSIB"+IntegerToString(Time[1]), expir); return;
            }
         }
      }
   }
   
   //Long Entry Type3
   if(ReversalIB && isIB() && Low[3]>Low[2] && Low[4]>Low[2] && Low[5]>Low[2] && Low[6]>Low[2]) {
      if(LE3_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE3_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((LE3_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar+1] && lo<Low[shiftSBar])) && getTicketByComment("LIB"+IntegerToString(Time[1]))==0) {
         computeForLong();
         LE3_TimeSBar = Time[1];
         expir = TimeCurrent()+ExpirationEntryType3*60*60;
         Print("Place Long Entry Type3");
         buyStop(getLots(),NormalizeDouble(entry,_Digits),NormalizeDouble(SL,_Digits),NormalizeDouble(TP,_Digits),"LIB"+IntegerToString(LE3_TimeSBar)+"S"+DoubleToString(spread,0),expir); return;
      }
   }
   
   //Short Entry Type3
   if(ReversalIB && isIB() && High[3]<High[2] && High[4]<High[2] && High[5]<High[2] && High[6]<High[2]) {
      if(SE3_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE3_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((SE3_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar] && lo<Low[shiftSBar+1])) && getTicketByComment("SIB"+IntegerToString(Time[1]))==0) {
         computeForShort();
         SE3_TimeSBar = Time[1];
         expir = TimeCurrent()+ExpirationEntryType3*60*60;
         Print("Place Short Entry Type3");
         sellStop(getLots(),NormalizeDouble(entry,_Digits),NormalizeDouble(SL,_Digits),NormalizeDouble(TP,_Digits),"SIB"+IntegerToString(SE3_TimeSBar)+"S"+DoubleToString(spread,0),expir); return;
      }
   }
   
   //Open Long Entry Type5
   if(ContinuationIB && isIB() && Low[3]>Low[2] && Low[4]>Low[2] && Low[5]>Low[2] && Low[6]>Low[2] && Low[7]>Low[2] && Low[8]>Low[2] &&
      Low[9]>Low[2] && Low[10]>Low[2] && Low[11]>Low[2] && Low[12]>Low[2] && Low[13]>Low[2] && Low[14]>Low[2]) {
      if(LE5_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,LE5_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((LE5_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar+1] && lo<Low[shiftSBar])) && getTicketByComment("LCIB"+IntegerToString(Time[1]))==0) {
         computeForLong();
         LE5_TimeSBar = Time[1];
         expir = TimeCurrent()+ExpirationEntryType5*60*60;
         Print("Place Long Entry Type5");
         buyStop(getLots(),NormalizeDouble(entry,_Digits),NormalizeDouble(SL,_Digits),NormalizeDouble(TP,_Digits),"LCIB"+IntegerToString(LE5_TimeSBar)+"S"+DoubleToString(spread,0),expir); return;
      }
   }
   
   //Open Short Entry Type5
   if(ContinuationIB && isIB() && High[3]<High[2] && High[4]<High[2] && High[5]<High[2] && High[6]<High[2] && High[7]<High[2] && High[8]<High[2] &&
      High[9]<High[2] && High[10]<High[2] && High[11]<High[2] && High[12]<High[2] && High[13]<High[2] && High[14]<High[2]) {
      if(SE5_TimeSBar>0) {
         shiftSBar = iBarShift(_Symbol,PERIOD_CURRENT,SE5_TimeSBar,false)-1;
         hi = High[iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,shiftSBar,0)];
         lo = Low[iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,shiftSBar,0)];
      }
      if((SE5_TimeSBar==0 || (shiftSBar>=0 && hi>High[shiftSBar] && lo<Low[shiftSBar+1])) && getTicketByComment("SCIB"+IntegerToString(Time[1]))==0) {
         computeForShort();
         SE5_TimeSBar = Time[1];
         expir = TimeCurrent()+ExpirationEntryType5*60*60;
         Print("Place Short Entry Type5");
         sellStop(getLots(),NormalizeDouble(entry,_Digits),NormalizeDouble(SL,_Digits),NormalizeDouble(TP,_Digits),"SCIB"+IntegerToString(SE5_TimeSBar)+"S"+DoubleToString(spread,0),expir); return;
      }
   }
   
  }
//+------------------------------------------------------------------+
// SL – stop loss level
// TP – target profit level
// Break – price level the pair needs to reach before you can move your SL to breakeven
// P1 – this is simply a 1-pip filter for our entries
// RSL – reduced stop loss; basically just reduces risk by half
// RSLT – price level when you can move your SL to RSL
void computeForLong() {
   ATRH = iATR(_Symbol,PERIOD_H1,PeriodATRH,0);
   spread = NormalizeDouble((Ask - Bid)/_Point,0);
   entry = High[2] + P1Filter*_Point;
   TP = entry - spread*_Point - P1Filter*_Point + ATRH*ATRHKoeffTP;
   SL = entry - spread*_Point - P1Filter*_Point - ATRH*ATRHKoeffSL;
   Break = TP - ATRH*ATRHKoeffBreak;
   RSL = entry - spread*_Point - P1Filter*_Point - (ATRH*ATRHKoeffSL)*RSLKoeff;
   RSLT = entry - spread*_Point - P1Filter*_Point + ATRH;
}
void computeForLongDt(int bshift, double lateSpread) {
   int h1bshift = iBarShift(_Symbol,PERIOD_H1,Time[bshift],false);
   ATRH = iATR(_Symbol,PERIOD_H1,PeriodATRH,h1bshift);
   
   entry = High[bshift+1] + P1Filter*_Point;
   TP = entry - lateSpread*_Point - P1Filter*_Point + ATRH*ATRHKoeffTP;
   SL = entry - lateSpread*_Point - P1Filter*_Point - ATRH*ATRHKoeffSL;
   Break = TP - ATRH*ATRHKoeffBreak;
   RSL = entry - lateSpread*_Point - P1Filter*_Point - (ATRH*ATRHKoeffSL)*RSLKoeff;
   RSLT = entry - lateSpread*_Point - P1Filter*_Point + ATRH;
}
void computeForShort() {
   ATRH = iATR(_Symbol,PERIOD_H1,PeriodATRH,0);
   spread = NormalizeDouble((Ask - Bid)/_Point,0);
   entry = Low[2] - P1Filter*_Point;
   TP = entry + spread*_Point + P1Filter*_Point - ATRH*ATRHKoeffTP;
   SL = entry + spread*_Point + P1Filter*_Point + ATRH*ATRHKoeffSL;
   Break = TP + ATRH*ATRHKoeffBreak;
   RSL = entry + spread*_Point + P1Filter*_Point + (ATRH*ATRHKoeffSL)*RSLKoeff;
   RSLT = entry + spread*_Point + P1Filter*_Point - ATRH;
}
void computeForShortDt(int bshift, double lateSpread) {
   int h1bshift = iBarShift(_Symbol,PERIOD_H1,Time[bshift],true);
   ATRH = iATR(_Symbol,PERIOD_H1,PeriodATRH,h1bshift);
   
   entry = Low[2] - P1Filter*_Point;
   TP = entry + lateSpread*_Point + P1Filter*_Point - ATRH*ATRHKoeffTP;
   SL = entry + lateSpread*_Point + P1Filter*_Point + ATRH*ATRHKoeffSL;
   Break = TP + ATRH*ATRHKoeffBreak;
   RSL = entry + lateSpread*_Point + P1Filter*_Point + (ATRH*ATRHKoeffSL)*RSLKoeff;
   RSLT = entry + lateSpread*_Point + P1Filter*_Point - ATRH;
}
//----------------------------------------------------------------------
bool isHHHL() {
   if(High[1]>High[2] && Low[1]>Low[2]) return true; // [1] is the signal bar ([1]SBar,[2]Bar1,[3]Bar2,[4]Bar3,[5]Bar4)
   else return false;
}
bool isLHLL() {
   if(High[1]<High[2] && Low[1]<Low[2]) return true;
   else return false;
}
bool isIB() {
   if(High[1]<High[2] && Low[1]>Low[2]) return true;
   else return false;
}
//---------------------------------------------------------------------
void modifyBuy(int ticket, double price, double sl, double tp, datetime expirat) {
   if((Bid-sl)/_Point<freezy) sl=Bid-freezy*_Point;
   if((Bid-sl)/_Point<stoplevel) sl = Bid-stoplevel*_Point;
   bool m = OrderModify(ticket,price,NormalizeDouble(sl,_Digits),tp,expirat,clrYellow);
   if(!m) Print("Error modify buy order "+IntegerToString(_LastError));
}
void modifySell(int ticket, double price, double sl, double tp, datetime expirat) {
   if((sl-Ask)/_Point<freezy) sl=Ask+freezy*_Point;
   if((sl-Ask)/_Point<stoplevel) sl = Ask+stoplevel*_Point;
   bool m = OrderModify(ticket,price,NormalizeDouble(sl,_Digits),tp,expirat,clrYellow);
   if(!m) Print("Error modify sell order "+IntegerToString(_LastError));
}
//-----------------------------------------------------------------------------------------
void buyStop(double volume, double price, double sl, double tp, string comment, datetime expiration) {
   RefreshRates();
   if((price-Ask)/_Point<stoplevel) price = Ask + stoplevel*_Point;
   if(sl>0.0 && (price-sl)/_Point<stoplevel) sl = price-stoplevel*_Point;
   if(tp>0.0 && (tp-price)/_Point<stoplevel) tp = price+stoplevel*_Point;
   int ticket = OrderSend(_Symbol,OP_BUYSTOP,volume,NormalizeDouble(price,_Digits),Slippage,NormalizeDouble(sl,_Digits),NormalizeDouble(tp,_Digits),comment,Magic,expiration,clrLime);
   if(ticket==-1) Print("Error open buystop "+IntegerToString(_LastError)+" ["+DoubleToStr(Ask,_Digits)+","+DoubleToStr(price,_Digits)+","+DoubleToStr(sl,_Digits)+","+DoubleToStr(tp,_Digits)+"]");
}
void sellStop(double volume, double price, double sl, double tp, string comment, datetime expiration) {
   RefreshRates();
   if((Bid-price)/_Point<stoplevel) {/*Print("***YYY1");*/ price = Bid - stoplevel*_Point; }
   if(sl>0.0 && (sl-price)/_Point<stoplevel) {/*Print("***YYY2");*/ sl = price+stoplevel*_Point; }
   if(tp>0.0 && (price-tp)/_Point<stoplevel) {/*Print("***YYY3");*/ tp = price-stoplevel*_Point; }
   int ticket=OrderSend(_Symbol,OP_SELLSTOP,volume,NormalizeDouble(price,_Digits),Slippage,NormalizeDouble(sl,_Digits),NormalizeDouble(tp,_Digits),comment,Magic,expiration,clrRed);
   if(ticket==-1) Print("Error open sellstop "+IntegerToString(_LastError)+" ["+DoubleToStr(Bid,_Digits)+","+DoubleToStr(price,_Digits)+","+DoubleToStr(sl,_Digits)+","+DoubleToStr(tp,_Digits)+"]");
   //else Print("SUCC "+IntegerToString(_LastError)+" ["+DoubleToStr(Bid,_Digits)+","+DoubleToStr(price,_Digits)+","+DoubleToStr(sl,_Digits)+","+DoubleToStr(tp,_Digits)+"]");
}
//--------------------------------------------------------------------------
int getTicketByComment(string comm) {
   int total = OrdersTotal();
   for(int j=0; j<total; j++) {
      if(OrderSelect(j,SELECT_BY_POS)) {
         if(StringFind(OrderComment(),comm)>=0) return OrderTicket();
      }
   }
   return 0;
}
//--------------------------------------------------------------------------
double getLots() {
  double lot = 0.0;
  double step = MarketInfo(Symbol(),MODE_LOTSTEP);
  if(FixedLot>0.0) lot = FixedLot;
  else {
    double free = AccountFreeMargin();
    double lotsize = MarketInfo(Symbol(),MODE_LOTSIZE);
    double onelot = MarketInfo(Symbol(),MODE_MARGINREQUIRED);
    lot = MathFloor(free*PercentMargin/100/onelot/step)*step;
   }
  double max = MarketInfo(Symbol(), MODE_MAXLOT);
  double min = MarketInfo(Symbol(), MODE_MINLOT);
  if(step>=1.0) lot = NormalizeDouble(lot, 0);
  else if(step>=0.1) lot = NormalizeDouble(lot, 1);
  else if(step<0.1) lot = NormalizeDouble(lot, 2);
  if(lot>max) lot = max;
  if(lot<min) lot = min;
  return lot;
 }
/////////////////////////////////////////////////////////////////////////////////