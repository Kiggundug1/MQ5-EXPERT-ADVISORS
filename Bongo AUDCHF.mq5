cpp
//+------------------------------------------------------------------+
//|                                                      Bongo AUDCHF|
//|                        Copyright 2024, Forex Robot EASY Team     |
//|                       Website: https://forexroboteasy.com/       |
//+------------------------------------------------------------------+
#property strict

// Input parameters for users
input double RiskPercentage = 2.0;    // Risk percentage per trade
input double TakeProfit = 50;         // Take profit in pips
input double StopLoss = 30;           // Stop loss in pips
input double TrailingStop = 20;       // Trailing stop in pips
input int MovingAveragePeriod = 14;   // Period for moving average
input int RSIPeriod = 14;             // Period for RSI

// Global variables
double lotSize;
int magicNumber = 12345;    // Unique identifier for this EA's trades

// Event handler for initialization
int OnInit()
{
    // Check if EA is attached to the correct symbol
    if (_Symbol != 'AUDCHF')
    {
        Alert('Bongo AUDCHF must be attached to an AUDCHF chart.');
        return(INIT_FAILED);
    }

    // Perform broker and account type detection (for demonstration purposes)
    if (StringFind(AccountCompany(), 'IC Markets') != -1 || StringFind(AccountCompany(), 'Tickmill') != -1 || StringFind(AccountCompany(), 'Pepperstone') != -1)
    {
        Print('Broker compatible.');
    }
    else
    {
        Alert('This EA might not work properly with your broker. Compatible brokers: IC Markets, Tickmill, Pepperstone.');
    }

    // Calculate lot size based on risk percentage and account balance
    lotSize = CalculateLotSize(RiskPercentage);
    
    // Initialization was successful
    return(INIT_SUCCEEDED);
}

// Event handler for deinitialization
void OnDeinit(const int reason)
{
    // Clean up resources if necessary
}

// Event handler for new tick
void OnTick()
{
    // Get necessary indicators
    double ma = iMA(_Symbol, 0, MovingAveragePeriod, 0, MODE_SMA, PRICE_CLOSE, 0);
    double rsi = iRSI(_Symbol, 0, RSIPeriod, PRICE_CLOSE, 0);

    // Custom Market Movement Strategy logic
    Strategy(ma, rsi);
}

// Market Movement Strategy tailored for AUDCHF
void Strategy(double ma, double rsi)
{
    // Example logic for entering trades
    if (OrdersTotal() == 0)
    {
        if (rsi < 30 && Close[1] > ma && Close[0] < ma) // Example buy condition
        {
            OpenTrade(ORDER_TYPE_BUY, lotSize, StopLoss, TakeProfit, TrailingStop);
        }
        else if (rsi > 70 && Close[1] < ma && Close[0] > ma) // Example sell condition
        {
            OpenTrade(ORDER_TYPE_SELL, lotSize, StopLoss, TakeProfit, TrailingStop);
        }
    }
}

// Function to open a trade
void OpenTrade(int type, double lots, double sl, double tp, double ts)
{
    double slPrice, tpPrice;
    
    if (type == ORDER_TYPE_BUY)
    {
        slPrice = NormalizeDouble(Bid - sl * _Point, _Digits);
        tpPrice = NormalizeDouble(Bid + tp * _Point, _Digits);
    }
    else
    {
        slPrice = NormalizeDouble(Ask + sl * _Point, _Digits);
        tpPrice = NormalizeDouble(Ask - tp * _Point, _Digits);
    }

    int ticket = OrderSend(_Symbol, type, lots, NormalizeDouble(type == ORDER_TYPE_BUY ? Ask : Bid, _Digits), 0, slPrice, tpPrice, 'Bongo AUDCHF', magicNumber, 0, clrGreen);
    
    if (ticket < 0)
    {
        Print('OrderSend failed with error #', GetLastError());
    }
    else if (ts > 0)
    {
        OrderModify(ticket, OrderOpenPrice(), OrderStopLoss(), OrderTakeProfit(), 0, clrGreen);
    }
}

// Function to calculate lot size based on risk percentage
double CalculateLotSize(double riskPercent)
{
    double lotSize = 0.1; // Default lot size

    // Custom lot size calculation logic
    // Placeholder logic: can be enhanced for actual risk management
    double risk = AccountBalance() * (riskPercent / 100);
    double sl = StopLoss * _Point;
    lotSize = risk / sl;
    
    return (MathFloor(lotSize / MarketInfo(_Symbol, MODE_LOTSIZE)) * MarketInfo(_Symbol, MODE_LOTSIZE));
}