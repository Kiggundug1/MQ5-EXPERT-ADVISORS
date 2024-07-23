mql5
//+------------------------------------------------------------------+
//|                                    CAP Zone Recovery EA Pro.mq5  |
//|                                  Author: Forex Robot EASY Team   |
//|                         Website: https://forexroboteasy.com/     |
//|                                               Year: 2024         |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

input string SymbolName = 'EURUSD';          // Trading Symbol
input double Initial_Lot_Size = 0.1;         // Initial Lot Size
input double Take_Profit_Points = 50;        // Take Profit in points
input double Hedge_Distance_Points = 40;     // Pip Distance for the next hedge trade
input int Max_Trades = 10;                   // Maximum number of trades to open
input double Max_Lot_Size = 2.0;             // Maximum lot size limit
input double DailyProfitLimit = 100.0;       // Profit limit to stop trading
input double DailyLossLimit = -100.0;        // Loss limit to stop trading
input bool Enable_Email_Notifications = true;// Enable/disable email notifications

// Global variables
double OpenPrice = 0;                        // Price at which initial trade was opened
int HedgeDirection = 1;                      // Direction for opening the hedge trade
int OrderCount = 0;                          // Number of orders opened
double Total_Lot = 0;                        // Total lot size of all open orders

// Trade and Position Classes Initialization
CTrade trade;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Reset values on initialization
   OpenPrice = 0;
   HedgeDirection = 1;
   OrderCount = 0;
   Total_Lot = 0;
   
   // Check if the trading symbol is correct
   if (SymbolName == '')
     {
      Print('Symbol name cannot be empty.');
      return(INIT_PARAMETERS_INCORRECT);
     }
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // If there are no trades, enter initial trade
   if (PositionsTotal() == 0)
     {
      EnterInitialTrade();
      return;
     }
   
   // Check the profit/loss and decide on next hedging trade
   double totalProfit = CalculateTotalProfit();
   
   // Close all trades if profit limit is achieved
   if (totalProfit >= Take_Profit_Points * OrderCount)
     {
      CloseAllTrades();
      return;
     }

   // Monitor and respond to price movements for hedging
   ManageHedging();
   
   // Check and stop trading if the profit or loss limits are reached
   if (totalProfit >= DailyProfitLimit || totalProfit <= DailyLossLimit)
     {
      DisableTrading();
      return;
     }
  }

//+------------------------------------------------------------------+
//| Enter the initial trade                                          |
//+------------------------------------------------------------------+
void EnterInitialTrade()
  {
   if (Total_Lot < Max_Lot_Size) 
     {
      double lotSize = Initial_Lot_Size;
      trade.Buy(lotSize, Symbol(), Ask, 3, 0, Ask + Take_Profit_Points * Point(), 'Initial Buy Trade');
      OpenPrice = Ask;
      Total_Lot += lotSize;
      OrderCount++;
      if (Enable_Email_Notifications)
        SendMail('CAP Zone Recovery', 'Initial Buy Trade opened.');
     }
   else
     {
      Print('Max lot size exceeded.');
     }
  }

//+------------------------------------------------------------------+
//| Calculate total profit of all open trades                        |
//+------------------------------------------------------------------+
double CalculateTotalProfit()
  {
   double totalProfit = 0;
   for (int i = 0; i < PositionsTotal(); i++)
     {
      if (PositionGetSymbol(i) == Symbol())
        {
         totalProfit += PositionGetString(POSITION_SYMBOL, SYMBOL_NAME) == SymbolName ? PositionGetDouble(POSITION_PROFIT) : 0;
        }
     }
   return totalProfit;
  }

//+------------------------------------------------------------------+
//| Close all open trades                                            |
//+------------------------------------------------------------------+
void CloseAllTrades()
  {
   for (int i = 0; i < PositionsTotal(); i++)
      if (PositionGetSymbol(i) == Symbol())
        trade.PositionClose(PositionGetSymbol(i));

   Print('All positions closed with profit.');
   if (Enable_Email_Notifications)
      SendMail('CAP Zone Recovery', 'All positions closed with profit.');
  }

//+------------------------------------------------------------------+
//| Manage hedging trades based on current market conditions         |
//+------------------------------------------------------------------+
void ManageHedging()
  {
   if (PositionsTotal() >= Max_Trades) return;
   
   double currentPrice = Ask;
   double lotSize = Initial_Lot_Size * MathPow(2, OrderCount - 1);

   if (currentPrice <= OpenPrice - Hedge_Distance_Points * Point() && HedgeDirection == 1)
     {
      if (Total_Lot + lotSize <= Max_Lot_Size)
        {
         trade.Sell(lotSize, Symbol(), Bid, 3, 0, Bid - Take_Profit_Points * Point(), 'Hedge Sell Trade');
         HedgeDirection = -1;
         Total_Lot += lotSize;
         OrderCount++;
         if (Enable_Email_Notifications)
            SendMail('CAP Zone Recovery', 'Hedge Sell Trade opened.');
        }
     }
   else if (currentPrice >= OpenPrice + Hedge_Distance_Points * Point() && HedgeDirection == -1)
     {
      if (Total_Lot + lotSize <= Max_Lot_Size)
        {
         trade.Buy(lotSize, Symbol(), Ask, 3, 0, Ask + Take_Profit_Points * Point(), 'Hedge Buy Trade');
         HedgeDirection = 1;
         Total_Lot += lotSize;
         OrderCount++;
         if (Enable_Email_Notifications)
            SendMail('CAP Zone Recovery', 'Hedge Buy Trade opened.');
        }
     }
  }

//+------------------------------------------------------------------+
//| Disable trading when profit or loss limits are met               |
//+------------------------------------------------------------------+
void DisableTrading()
  {
   if (DailyProfitLimit > 0)
      Print('Trading stopped after reaching profit limit.');
   else if (DailyLossLimit < 0)
      Print('Trading stopped after reaching loss limit.');
   
   for (int i = 0; i < PositionsTotal(); i++)
      if (PositionGetSymbol(i) == Symbol())
         trade.PositionClose(PositionGetSymbol(i));
         
   ExpertRemove(); // Remove the EA after meeting limits
  }