//+------------------------------------------------------------------+
//|                               EASY BUY SELL SIGNAL CORRECTED.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright   ""
#property link        "https://fxdreema.com"
#property description ""
#property version     "1.0"
#property strict

// Input Parameters
input bool ENABLE_SPREAD_METER = true;
input bool ENABLE_STATUS = true;
input bool ENABLE_TEST_INDICATORS = true;
input bool ENABLE_EVENT_TICK = true; // enable "Tick" event
input bool ENABLE_EVENT_TRADE = false; // enable "Trade" event
input bool ENABLE_EVENT_TIMER = false; // enable "Timer" event
input bool VIRTUAL_STOPS_ENABLED = false; // enable virtual stops
input int VIRTUAL_STOPS_TIMEOUT = 0; // virtual stops timeout
input string USE_EMERGENCY_STOPS = "no"; // "yes" to use emergency (hard stops) when virtual stops are in use. "always" to use EMERGENCY_STOPS_ADD as emergency stops when there is no virtual stop.
input int EMERGENCY_STOPS_REL = 0; // use 0 to disable hard stops when virtual stops are enabled. Use a value >=0 to automatically set hard stops with virtual. Example: if 2 is used, then hard stops will be 2 times bigger than virtual ones.
input int EMERGENCY_STOPS_ADD = 0; // add pips to relative size of emergency stops (hard stops)
input bool ON_TRADE_REALTIME = false;
input int ON_TIMER_PERIOD = 60; // Timer event period (in seconds)

int easyBuySellHandle;

int OnInit()
{
    easyBuySellHandle = iCustom(Symbol(), PERIOD_CURRENT, "Market\\Easy Buy Sell Signal");
    if (easyBuySellHandle == INVALID_HANDLE)
    {
        Print("Error loading Easy Buy Sell Signal indicator");
        return(INIT_FAILED);
    }
    return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
    if (easyBuySellHandle != INVALID_HANDLE)
    {
        IndicatorRelease(easyBuySellHandle);
    }
}

void OnTick()
{
    double buySignal[], sellSignal[];
    if (CopyBuffer(easyBuySellHandle, 0, 0, 1, buySignal) <= 0 || 
        CopyBuffer(easyBuySellHandle, 1, 0, 1, sellSignal) <= 0)
    {
        Print("Error reading indicator buffers");
        return;
    }

    // Example logic based on indicator signals
    if (buySignal[0] > 0)
    {
        // Execute buy trade
        Print("Buy signal detected");
    }
    else if (sellSignal[0] > 0)
    {
        // Execute sell trade
        Print("Sell signal detected");
    }
}