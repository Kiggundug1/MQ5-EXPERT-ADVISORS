mql5
//+------------------------------------------------------------------+
//|                                                      Sun USDCAD  |
//|                           Forex Robot EASY Team                  |
//|                 Website: https://forexroboteasy.com/             |
//|                                               Year: 2024         |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

// Define trading conditions based on specification
input double TakeProfit          = 50;    // Take Profit in points
input double StopLoss            = 30;    // Stop Loss in points
input double MartingaleMultiplier= 1.5;   // Martingale multiplier
input bool   UseMartingale       = true;  // Use Martingale strategy
input int    MaxCycles           = 5;     // Maximum concurrent cycles
input double MaxRiskPerTrade     = 2.0;   // Maximum risk per trade (% of account balance)

// Global variables
CTrade trade;
double LotSize;
int ActiveCycles = 0;
double AccountBalance;
int MagicNumber = 123456;

// Function to calculate lot size based on risk
double CalculateLotSize(double riskPercent, double stopLossPoints) {
   double tickValue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   double riskAmount = AccountBalance * (riskPercent / 100.0);
   double lot = riskAmount / (stopLossPoints * (tickValue / tickSize));
   return NormalizeDouble(lot, 2);  // Normalize to 2 decimal points
}

// Function to open a new cycle
void OpenNewCycle() {
   double price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   LotSize = CalculateLotSize(MaxRiskPerTrade, StopLoss);

   // Open buy order
   if (trade.Buy(LotSize, _Symbol, price, price + TakeProfit * Point, price - StopLoss * Point, 'Cycle Start')) {
      Print('New cycle started with a BUY order at price: ', price);
      ActiveCycles++;
   } else {
      Print('Error opening BUY order: ', trade.ResultRetcode(), ' (', trade.ResultRetcodeDescription(), ')');
   }
}

// Main trading logic
void OnTick() {
   AccountBalance = AccountInfoDouble(ACCOUNT_BALANCE);

   // Check if market condition meets cycle start criteria (simplified example)
   if (ActiveCycles < MaxCycles && CheckMarketCondition()) {
      OpenNewCycle();
   }

   // Process active cycles and manage martingale sequence
   for (int i = PositionsTotal() - 1; i >= 0; i--) {
      if (PositionGetSymbol(i) == _Symbol) {
         uint magic = PositionGetInteger(POSITION_MAGIC);
         if (magic == MagicNumber) {
            double posPrice = PositionGetDouble(POSITION_PRICE_OPEN);
            double vol = PositionGetDouble(POSITION_VOLUME);

            if (UseMartingale && PositionGetDouble(POSITION_PROFIT) < 0 ) {
               // Apply martingale strategy
               LotSize *= MartingaleMultiplier;
               if (trade.Buy(LotSize, _Symbol, SymbolInfoDouble(_Symbol, SYMBOL_BID), PositionGetDouble(POSITION_TP), PositionGetDouble(POSITION_SL), 'Martingale Step')) {
                  Print('Martingale applied. New BUY order opened.');
               } else {
                  Print('Error applying Martingale: ', trade.ResultRetcode(), ' (', trade.ResultRetcodeDescription(), ')');
               }
            }
            // Check for order close conditions
            else if (PositionGetDouble(POSITION_PROFIT) > 0 || PositionGetDouble(POSITION_PROFIT) < -AccountBalance * (MaxRiskPerTrade / 100.0)) {
               trade.PositionClose(PositionGetTicket(i));
               Print('Position closed: ', PositionGetTicket(i));
               ActiveCycles--;
            }
         }
      }
   }
}

// Function to check market condition for opening a new cycle (simplified)
bool CheckMarketCondition() {
   // Implement your market condition logic here
   return true;
}

int OnInit() {
   Print('Sun USDCAD Expert Advisor initialized.');
   ActiveCycles = 0;
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason) {
   Print('Sun USDCAD Expert Advisor deinitialized.');
}
