#include <Trade\Trade.mqh>

// Create an instance of CTrade
CTrade trade;

// Indicator handle
int handle;

// Previous signals to track changes
double previousBuySignal = 0;
double previousSellSignal = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    string name = "Market\\Easy Buy Sell Signal.ex5";
    // Initialize the indicator
    handle = iCustom(_Symbol, PERIOD_CURRENT, name, 9, 14);

    // Check if the handle is valid
    if (handle == INVALID_HANDLE)
    {
        Print("Failed to initialize indicator. Error: ", GetLastError());
        return(INIT_FAILED);
    }

    // Initialize previous signals
    previousBuySignal = 0;
    previousSellSignal = 0;

    return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Release the indicator handle
    IndicatorRelease(handle);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
    // Retrieve the latest signals
    double buySignal = iCustom(_Symbol, PERIOD_CURRENT, handle, 0);
    double sellSignal = iCustom(_Symbol, PERIOD_CURRENT, handle, 1);

    // Debugging: Print signal values
    Print("Buy Signal: ", buySignal, " Sell Signal: ", sellSignal);

    // Check if there's an existing position
    bool positionExists = false;
    ENUM_POSITION_TYPE currentPositionType = POSITION_TYPE_BUY;
    ulong ticket = 0;

    if (PositionsTotal() > 0)
    {
        if (PositionSelect(_Symbol))
        {
            ticket = PositionGetInteger(POSITION_TICKET);
            currentPositionType = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
            positionExists = true;
        }
    }

    // Trade execution logic based on signal changes
    if (buySignal > 0 && buySignal != previousBuySignal)
    {
        if (positionExists)
        {
            if (currentPositionType == POSITION_TYPE_SELL)
            {
                if (trade.PositionClose(ticket))
                {
                    Print("Sell position closed successfully");
                    if (trade.Buy(0.01, NULL, 0, 0, 0, "Buy Signal"))
                    {
                        Print("Buy order opened successfully");
                    }
                    else
                    {
                        Print("Error opening buy order: ", GetLastError());
                    }
                }
                else
                {
                    Print("Error closing sell position: ", GetLastError());
                }
            }
        }
        else
        {
            if (trade.Buy(0.01, NULL, 0, 0, 0, "Buy Signal"))
            {
                Print("Buy order opened successfully");
            }
            else
            {
                Print("Error opening buy order: ", GetLastError());
            }
        }
    }
    else if (sellSignal > 0 && sellSignal != previousSellSignal)
    {
        if (positionExists)
        {
            if (currentPositionType == POSITION_TYPE_BUY)
            {
                if (trade.PositionClose(ticket))
                {
                    Print("Buy position closed successfully");
                    if (trade.Sell(0.01, NULL, 0, 0, 0, "Sell Signal"))
                    {
                        Print("Sell order opened successfully");
                    }
                    else
                    {
                        Print("Error opening sell order: ", GetLastError());
                    }
                }
                else
                {
                    Print("Error closing buy position: ", GetLastError());
                }
            }
        }
        else
        {
            if (trade.Sell(0.01, NULL, 0, 0, 0, "Sell Signal"))
            {
                Print("Sell order opened successfully");
            }
            else
            {
                Print("Error opening sell order: ", GetLastError());
            }
        }
    }

    // Update previous signals
    previousBuySignal = buySignal;
    previousSellSignal = sellSignal;
}
