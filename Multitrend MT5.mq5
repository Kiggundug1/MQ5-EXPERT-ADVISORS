mql5
//+------------------------------------------------------------------+
//|                                                 MultiTrade MT5   |
//|                        Copyright © 2024, Forex Robot EASY Team  |
//|                                    https://forexroboteasy.com/   |
//+------------------------------------------------------------------+
#include <ChartObjects\ChartObjectsTxtControls.mqh>

// Define the eight major currencies
enum Currencies { AUD, CAD, CHF, EUR, GBP, JPY, NZD, USD };

// Input parameters for user customization
input int MA_Period = 14;            // Default moving average period
input double RSI_Threshold = 70.0;   // Default RSI threshold for alerts
input int AlertUpdateTime = 60;      // Alert check interval (seconds)

// Structure to hold currency pair data
struct CurrencyData {
  string symbol;
  double price;
  double volume;
  string trend;
};

// Global variables
CurrencyData currencies[];
datetime lastAlertTime = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
  // Initialize currency data
  InitializeCurrencyPairs();

  // Initialize dashboard GUI
  InitializeDashboard();

  // Setup timer for periodic alert checks
  EventSetTimer(AlertUpdateTime);

  return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Initialize currency pairs data                                   |
//+------------------------------------------------------------------+
void InitializeCurrencyPairs() {
  currencies[0].symbol = 'AUDUSD';
  currencies[1].symbol = 'CADUSD';
  currencies[2].symbol = 'CHFUSD';
  currencies[3].symbol = 'EURUSD';
  currencies[4].symbol = 'GBPUSD';
  currencies[5].symbol = 'JPYUSD';
  currencies[6].symbol = 'NZDUSD';
  currencies[7].symbol = 'USDUSD';
}

//+------------------------------------------------------------------+
//| Initialize Dashboard GUI                                         |
//+------------------------------------------------------------------+
void InitializeDashboard() {
  // Create GUI elements to display currency data
  for (int i = 0; i < ArraySize(currencies); i++) {
    string label_name = 'Label' + IntegerToString(i);
    CreateLabel(label_name, 10, 20 * i, ColorSaddleBrown, currencies[i].symbol);
  }
}

//+------------------------------------------------------------------+
//| Timer function for periodic alert checks                         |
//+------------------------------------------------------------------+
void OnTimer() {
  // Check for real-time updates
  CheckCurrencyUpdates();

  // Update dashboard with the latest data
  UpdateDashboard();

  // Check for trade alerts
  CheckTradeAlerts();
}

//+------------------------------------------------------------------+
//| Check currency updates                                           |
//+------------------------------------------------------------------+
void CheckCurrencyUpdates() {
  for (int i = 0; i < ArraySize(currencies); i++) {
    currencies[i].price = iClose(currencies[i].symbol, 0, 0);
    currencies[i].volume = iVolume(currencies[i].symbol, 0);
    currencies[i].trend = GetTrend(currencies[i].symbol);
  }
}

//+------------------------------------------------------------------+
//| Update Dashboard with latest data                                |
//+------------------------------------------------------------------+
void UpdateDashboard() {
  for (int i = 0; i < ArraySize(currencies); i++) {
    string label_name = 'Label' + IntegerToString(i);
    string text = currencies[i].symbol + ': ' + DoubleToString(currencies[i].price, 4) 
                  + ' | Volume: ' + DoubleToString(currencies[i].volume, 0)
                  + ' | Trend: ' + currencies[i].trend;
    UpdateLabel(label_name, text);
  }
}

//+------------------------------------------------------------------+
//| Check for trade alerts                                           |
//+------------------------------------------------------------------+
void CheckTradeAlerts() {
  for (int i = 0; i < ArraySize(currencies); i++) {
    double rsi = iRSI(currencies[i].symbol, 0, MA_Period, 0);
    if (rsi > RSI_Threshold || rsi < (100 - RSI_Threshold)) {
      if (lastAlertTime == 0 || (TimeCurrent() - lastAlertTime >= AlertUpdateTime)) {
        SendTradeAlert(currencies[i].symbol, rsi);
        lastAlertTime = TimeCurrent();
      }
    }
  }
}

//+------------------------------------------------------------------+
//| Get trend direction based on moving average                      |
//+------------------------------------------------------------------+
string GetTrend(string symbol) {
  double ma_current = iMA(symbol, 0, MA_Period, 0, MODE_SMA, PRICE_CLOSE, 0);
  double ma_previous = iMA(symbol, 0, MA_Period, 0, MODE_SMA, PRICE_CLOSE, 1);

  if (ma_current > ma_previous)
    return 'UP';
  else if (ma_current < ma_previous)
    return 'DOWN';
  else
    return 'FLAT';
}

//+------------------------------------------------------------------+
//| Create label for displaying data                                 |
//+------------------------------------------------------------------+
void CreateLabel(string name, int x, int y, color col, string text) {
  if (!ObjectCreate(0, name, OBJ_LABEL, 0, 0, 0))
    Print('Failed to create label: ', name);
  else
    ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, x);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, y);
    ObjectSetInteger(0, name, OBJPROP_COLOR, col);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
}

//+------------------------------------------------------------------+
//| Update label text                                                |
//+------------------------------------------------------------------+
void UpdateLabel(string name, string text) {
  if (ObjectFind(0, name) != -1)
    ObjectSetString(0, name, OBJPROP_TEXT, text);
}

//+------------------------------------------------------------------+
//| Send trade alert                                                 |
//+------------------------------------------------------------------+
void SendTradeAlert(string symbol, double rsi) {
  string alert_message = 'Alert: ' + symbol + ' RSI: ' + DoubleToString(rsi, 2);
  Print(alert_message);
  Alert(alert_message);

  // Send Push Notification
  SendNotification(alert_message);

  // Additional custom alert types (e.g., email, etc.) could be added here
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
  // Remove all label objects
  for (int i = 0; i < ArraySize(currencies); i++) {
    string label_name = 'Label' + IntegerToString(i);
    ObjectDelete(0, label_name);
  }

  // Remove timer
  EventKillTimer();
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() {
  // We use the timer event for updates and alerts, keeping OnTick light
}

//+------------------------------------------------------------------+