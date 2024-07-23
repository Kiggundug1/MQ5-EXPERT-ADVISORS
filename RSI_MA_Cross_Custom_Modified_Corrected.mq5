
/*
   RSI MA Cross Custom
   Modified to trade based on 21 SMA and 5 RSI cross
*/

// Basic properties
#define app_name  "RSI MA Cross Custom Modified"
#define app_magic 232323

#property copyright "Copyright 2013-2023 Novateq Pty Ltd"
#property link "https://orchardforex.com"
#property version "1.1"
#property description "RSI 5 and SMA 21 cross strategy"

// Inputs
input int                InpSMAPeriod          = 21;          // SMA Period
input ENUM_APPLIED_PRICE InpSMAAppliedPrice    = PRICE_CLOSE; // SMA Applied Price
input int                InpRSIPeriod          = 5;           // RSI Period
input ENUM_APPLIED_PRICE InpRSIAppliedPrice    = PRICE_CLOSE; // RSI Applied Price

// Basic inputs
input double             InpOrderSize          = 0.01;      // Order size in lots
input int                InpMagic              = app_magic; // Magic number
input string             InpTradeComment       = app_name;  // Trade comment

// Include trade class
#include <Trade/Trade.mqh>
CTrade        Trade;
CPositionInfo PositionInfo;

// Handles and buffers for the indicators
int           HandleSMA;
int           HandleRSI;

double        BufferSMA[];
double        BufferRSI[];
const int     BufferValuesRequired = 3;

// Initialisation
int OnInit() {
   // Reset the new bar
   IsNewBar();
   
   // MT5 Specific
   Trade.SetExpertMagicNumber(InpMagic);
   
   HandleSMA = iMA(Symbol(), Period(), InpSMAPeriod, 0, MODE_SMA, InpSMAAppliedPrice);
   HandleRSI = iRSI(Symbol(), Period(), InpRSIPeriod, InpRSIAppliedPrice);
   ArraySetAsSeries(BufferSMA, true);
   ArraySetAsSeries(BufferRSI, true);

   if (HandleSMA == INVALID_HANDLE || HandleRSI == INVALID_HANDLE) {
      Print("Failed to create indicator handles.");
      return(INIT_FAILED);
   }

   return(INIT_SUCCEEDED);
}

// Deinitialisation
void OnDeinit(const int reason) {
   IndicatorRelease(HandleSMA);
   IndicatorRelease(HandleRSI);
}

// New bar detection
bool IsNewBar() {
   static datetime lastBarTime = 0;
   datetime currentBarTime = iTime(Symbol(), Period(), 0);
   if (currentBarTime != lastBarTime) {
      lastBarTime = currentBarTime;
      return true;
   }
   return false;
}

// Main function
void OnTick() {
   if (!IsNewBar()) return;

   // Get the latest indicator values
   CopyBuffer(HandleSMA, 0, 0, BufferValuesRequired, BufferSMA);
   CopyBuffer(HandleRSI, 0, 0, BufferValuesRequired, BufferRSI);

   double currentSMA = BufferSMA[0];
   double currentRSI = BufferRSI[0];

   // Check for existing positions
   bool hasPosition = PositionInfo.SelectByMagic(Symbol(), InpMagic);

   // Buy condition: SMA < RSI
   if (currentSMA < currentRSI) {
      if (hasPosition && PositionInfo.PositionType() == POSITION_TYPE_SELL) {
         Trade.PositionClose(Symbol()); // Close existing sell position
         Trade.Buy(InpOrderSize, Symbol(), 0, 0, 0, InpTradeComment); // Open a buy position
      } else if (!hasPosition) {
         Trade.Buy(InpOrderSize, Symbol(), 0, 0, 0, InpTradeComment); // Open a buy position
      }
   }
   // Sell condition: SMA > RSI
   else if (currentSMA > currentRSI) {
      if (hasPosition && PositionInfo.PositionType() == POSITION_TYPE_BUY) {
         Trade.PositionClose(Symbol()); // Close existing buy position
         Trade.Sell(InpOrderSize, Symbol(), 0, 0, 0, InpTradeComment); // Open a sell position
      } else if (!hasPosition) {
         Trade.Sell(InpOrderSize, Symbol(), 0, 0, 0, InpTradeComment); // Open a sell position
      }
   }
}
