
//+------------------------------------------------------------------+
//|                                                      RSI_SMA_EA  |
//|                        Copyright 2024, OpenAI Copilot            |
//|                                       https://openai.com/copilot |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

input int RSI_Period = 5; // RSI period
input double RSI_Overbought = 35.0; // RSI overbought level
input double RSI_Oversold = 65.0; // RSI oversold level
input int SMA_Period = 21; // Simple Moving Average period
input double LotSize = 0.1; // Lot size
input double StopLoss = 50; // Stop loss in points
input double TakeProfit = 50; // Take profit in points

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Clean up resources here
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
    double rsi = iRSI(Symbol(), 0, RSI_Period, PRICE_CLOSE, 0);
    double sma = iMA(Symbol(), 0, SMA_Period, 0, MODE_SMA, PRICE_CLOSE, 0);

    if (rsi > RSI_Overbought && sma > Bid)
    {
        // Sell signal
        double sl = Bid + StopLoss * Point;
        double tp = Bid - TakeProfit * Point;
        if (OrderSend(Symbol(), OP_SELL, LotSize, Bid, 3, sl, tp, "RSI vs SMA Sell", 0, clrNONE) < 0)
            Print("OrderSend Error: ", GetLastError());
    }
    else if (rsi < RSI_Oversold && sma < Ask)
    {
        // Buy signal
        double sl = Ask - StopLoss * Point;
        double tp = Ask + TakeProfit * Point;
        if (OrderSend(Symbol(), OP_BUY, LotSize, Ask, 3, sl, tp, "RSI vs SMA Buy", 0, clrNONE) < 0)
            Print("OrderSend Error: ", GetLastError());
    }
}
//+------------------------------------------------------------------+
