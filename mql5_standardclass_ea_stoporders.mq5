//+------------------------------------------------------------------+
//|                             mql5_standardclass_ea_stoporders.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  Включаемые файлы с классами, которые будут использованы         |
//+------------------------------------------------------------------+
//--- Объект класса CTrade
#include <Trade\Trade.mqh>
//--- Объект класса CPositionInfo
#include <Trade\PositionInfo.mqh>
//--- Объект класса CSymbolInfo
#include <Trade\SymbolInfo.mqh>
//--- Объект класса COrderInfo
#include <Trade\OrderInfo.mqh>
//+------------------------------------------------------------------+
//|  Входные параметры                                               |
//+------------------------------------------------------------------+
input int      StopLoss=30;      // Stop Loss
input int      TakeProfit=60;    // Take Profit
input int      ADX_Period=14;    // Период ADX
input int      MA_Period=15;     // Период Moving Average
input ulong    EA_Magic=99977;   // Magic Number советника
input double   Adx_Min=25.0;     // Минимальное значение ADX
input double   Lot=0.1;          // Количество лотов для торговли
input ulong    dev=100;          // Проскальзывание 
//+------------------------------------------------------------------+
//|  Другие полезные параметры                                       |
//+------------------------------------------------------------------+
int adxHandle; //--- хэндл нашего индикатора ADX
int maHandle;  //--- хэндл нашего индикатора Moving Average
double plsDI[],minDI[],adxVal[]; //--- динамические массивы для хранения значений +DI, -DI и ADX каждого бара
double maVal[]; //--- динамический массив для хранения значений индикатора Moving Average для каждого бара
double p_close; //--- переменная для хранения текущих значений цены закрытия бара
int STP,TKP;    //--- будут использоваться для Stop Loss, Take Profit
double TPC;     //--- будет использован для контроля маржи

//--- определим структуру типа MqlRates, которую будем использовать в торговле
//--- для хранения цен, объемов и спреда каждого бара
MqlRates mrate[];

//+------------------------------------------------------------------+
//|  Создаем объекты классов                                         |
//+------------------------------------------------------------------+
//--- Объект класса CTrade
CTrade mytrade;
//--- Объект класса СPositionInfo
CPositionInfo myposition;
//--- Объект класса CSymbolInfo
CSymbolInfo mysymbol;
//--- Объект класса COrderInfo
COrderInfo myorder;
//+------------------------------------------------------------------+
//| Пользовательские функции                                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|  Проверяет условия на покупку                                    |
//+------------------------------------------------------------------+
bool checkBuy()
  {
   bool dobuy=false;
   if((maVal[0]>maVal[1]) && (maVal[1]>maVal[2]) && (p_close>maVal[1]))
     {
      //--- MA растет и цена закрытия предыдущего бара выше MA
      if((adxVal[1]>Adx_Min) && (plsDI[1]>minDI[1]))
        {
         //--- значение ADX больше, чем минимально требуемое, и +DI больше, чем -DI
         dobuy=true;
        }
     }
   return(dobuy);
  }
//+------------------------------------------------------------------+
//|  Проверяет условия на продажу                                    |
//+------------------------------------------------------------------+
bool checkSell()
  {
   bool dosell=false;
   if((maVal[0]<maVal[1]) && (maVal[1]<maVal[2]) && (p_close<maVal[1]))
     {
      //--- MA падает и цена закрытия предыдущего бара ниже MA
      if((adxVal[1]>Adx_Min) && (minDI[1]>plsDI[1]))
        {
         //--- значение ADX больше, чем минимально требуемое, и -DI больше, чем +DI
         dosell=true;
        }
     }
   return(dosell);
  }
//+------------------------------------------------------------------+
//| Считает общее количество ордеров,                                |
//| размещенных советником на данном символе                         |
//+------------------------------------------------------------------+
int CountOrders()
  {
   int mark=0;

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(myorder.Select(OrderGetTicket(i)))
        {
         if(myorder.Magic()==EA_Magic && myorder.Symbol()==_Symbol) mark++;
        }
     }
   return(mark);
  }
//+------------------------------------------------------------------+
//| Проверяет и удаляет отложенные ордера                            |
//+------------------------------------------------------------------+
bool DeletePending()
  {
   bool marker=false;
//--- проверка всех отложенных ордеров
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(myorder.Select(OrderGetTicket(i)))
        {
         if(myorder.Magic()==EA_Magic && myorder.Symbol()==_Symbol)
           {
            //--- проверим время ордера - оно должно быть меньше, чем время два бара назад 
            if(myorder.TimeSetup()<mrate[2].time)
              {
               //--- удаляем этот отложенный ордер и проверяем, был ли он успешно удален
                if(mytrade.OrderDelete(myorder.Ticket())) 
                  { // ордер успешно удален
                      Alert("Отложенный ордер с тикетом #", myorder.Ticket(), " был успешно удален!!");
                      marker=true;
                  }
                 else
                  {
                      Alert("Запрос на удаление отложенного ордера # ",myorder.Ticket() ," не был выполнен - ошибка: ",mytrade.ResultRetcodeDescription());
                  }

              }
           }
        }
     }
   return(marker);
  }
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- установка наименования символа для объекта класса CSymbolInfo
   mysymbol.Name(_Symbol);
//--- установка идентификатора эксперта (Expert Magic No) в объекте класса CTrade
   mytrade.SetExpertMagicNumber(EA_Magic);
//--- установка максимально допустимого проскальзывания в объекте класса CTrade
   mytrade.SetDeviationInPoints(dev);
//--- получаем хэндл индикатора ADX
   adxHandle=iADX(NULL,0,ADX_Period);
//--- получаем хэндл индикатора Moving Average
   maHandle=iMA(_Symbol,Period(),MA_Period,0,MODE_EMA,PRICE_CLOSE);
//--- если хэндлы неверные
   if(adxHandle<0 || maHandle<0)
     {
      Alert("Ошибка создания хэнлов индикаторов MA и ADX - ошибка: ",GetLastError(),"!!");
      return(1);
     }
//--- Будем поддерживать брокеров с 5/3 знаками
   STP = StopLoss;
   TKP = TakeProfit;
   if(_Digits==5 || _Digits==3)
     {
      STP = STP*10;
      TKP = TKP*10;
     }
//---
   return(0);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- Освобождаем хэдлы наших индикаторов
   IndicatorRelease(adxHandle);
   IndicatorRelease(maHandle);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
/*
     Убедимся в том, что значения наших массивов для котировок, 
     значений индикатора ADX и MA указаны как таймсерии
*/
//--- массив котировок
   ArraySetAsSeries(mrate,true);
//--- массив значений ADX
   ArraySetAsSeries(adxVal,true);
//--- массив значений MA
   ArraySetAsSeries(maVal,true);
//--- массив значений -DI
   ArraySetAsSeries(minDI,true);
//--- массив значений +DI
   ArraySetAsSeries(plsDI,true);
//

//--- Получим последние котировки, используя функцию объект класса CSymbolInfo
   if(!mysymbol.RefreshRates())
     {
      Alert("Ошибка обновления котировок - ошибка:",GetLastError(),"!!");
      return;
     }

//--- Копируем данные по 4-м последним барам
   if(CopyRates(_Symbol,_Period,0,4,mrate)<0)
     {
      Alert("Ошибка копирования исторических котировок - ошибка:",GetLastError(),"!!");
      return;
     }

//--- советник должен проверять условия торговли только при появлении нового бара
//--- объявим статическую переменную типа datetime
   static datetime Prev_time;
//--- объявим массив из одного элемента для хранения времени начала текущего бара (бар 0)
   datetime Bar_time[1];
//--- копируем время текущего бара
   Bar_time[0]=mrate[0].time;
//--- если оба времени равны, новый бар не появился
   if(Prev_time==Bar_time[0])
     {
      return;
     }
//--- сохраним время в статической переменной
   Prev_time=Bar_time[0];

//--- копируем новые значения индикаторов в массивы, используя хэндлы индикаторов
   if(CopyBuffer(adxHandle,0,0,5,adxVal)<1 || CopyBuffer(adxHandle,1,0,5,plsDI)<1
      || CopyBuffer(adxHandle,2,0,5,minDI)<1)
     {
      Alert("Ошибка копирования буферов индикатора ADX - ошибка:",GetLastError(),"!!");
      return;
     }
   if(CopyBuffer(maHandle,0,0,5,maVal)<1)
     {
      Alert("Ошибка копирования буфера индикатора Moving Average - ошибка:",GetLastError());
      return;
     }
//--- ошибок нет, продолжаем
//--- копируем цену закрытия предыдущего бара (бара, предшествующего текущему, т.е. бара 1)

   p_close=mrate[1].close;  //--- цена закрытия бара 1

//--- выставлено ли более 3-х отложенных ордеров?
   if(CountOrders()>3)
     {
      DeletePending();
      return;
     }
   //--- есть ли открытая позиция?
   bool Buy_opened=false,Sell_opened=false;
   if(myposition.Select(_Symbol)==true) //--- есть открытая позиция
     {
      if(myposition.PositionType()==POSITION_TYPE_BUY)
        {
         Buy_opened=true;  //--- длинная (buy) позиция
         return;           //--- выходим и ждем нового бара
        }
      else if(myposition.PositionType()==POSITION_TYPE_SELL)
        {
         Sell_opened=true; //--- короткая (sell) позиция
         return;           //--- выходим и ждем нового бара
        }

     }
/*
    Проверка условий покупки : MA растет, 
    предыдущая цена закрытия больше ее, ADX > adxmin, +DI > -DI
*/
   if(checkBuy()==true)
     {
      Alert("Общее количество установленных отложенных ордеров: ",CountOrders(),"!!");
      //--- есть ли позиция на покупку?
      if(Buy_opened)
        {
         Alert("У нас уже есть позиция на покупку!!!");
         return;    //---  Не открываем новую позицию на покупку
        }
      //--- Цена покупки = bar 1 High + 2 pip + spread
      int sprd=mysymbol.Spread();
      double bprice =mrate[1].high + 10*_Point + sprd*_Point;
      double mprice=NormalizeDouble(bprice,_Digits);                //--- Цена покупки
      double stloss = NormalizeDouble(bprice - STP*_Point,_Digits); //--- Stop Loss
      double tprofit = NormalizeDouble(bprice+ TKP*_Point,_Digits); //--- Take Profit
      //--- Размещаем ордер Buy Stop
      if(mytrade.BuyStop(Lot,mprice,_Symbol,stloss,tprofit))
      //if(mytrade.OrderOpen(_Symbol,ORDER_TYPE_BUY_STOP,Lot,0.0,bprice,stloss,tprofit,ORDER_TIME_GTC,0)) 
        {
         //--- запрос выполнен или ордер размещен
         Alert("Ордер Buy Stop был успешно размещен с тикетом #:",mytrade.ResultOrder(),"!!");
         return;
        }
      else
        {
         Alert("Запрос на размещение ордера BuyStop с объемом:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", цена:", mytrade.RequestPrice(), " не выполнен - ошибка:",mytrade.ResultRetcodeDescription());
         return;
        }
     }

/*
    2. Проверка условий на продажу : MA падает, 
    предыдущая цена закрытия ниже находится ее, ADX > adxmin, -DI > +DI
*/
   if(checkSell()==true)
     {
      Alert("Общее количество установленных отложенных ордеров:",CountOrders(),"!!");
      //--- есть ли открытая позиция на продажу?
      if(Sell_opened)
        {
         Alert("У нас уже есть позиция на продажу!!!");
         return;    //--- выходим и ждем нового бара
        }
      //--- цена продажи = bar 1 Low - 2 pip 
      double sprice=mrate[1].low-10*_Point;
      double slprice=NormalizeDouble(sprice,_Digits);             //--- цена продажи
      double ssloss=NormalizeDouble(sprice+STP*_Point,_Digits);   //--- Stop Loss
      double stprofit=NormalizeDouble(sprice-TKP*_Point,_Digits); //--- Take Profit
      //--- Размещаем ордер Sell Stop
      if(mytrade.SellStop(Lot,slprice,_Symbol,ssloss,stprofit))
      //if(mytrade.OrderOpen(_Symbol,ORDER_TYPE_SELL_STOP,Lot,0.0,slprice,ssloss,stprofit,ORDER_TIME_GTC,0)) 
        {
         //--- Запрос выполнен или ордер размещен
         Alert("Отложенный ордер Sell Stop успешно размещен с тикетом #",mytrade.ResultOrder(),"!!");
         return;
        }
      else
        {
         Alert("Запрос о размещении отложенного ордера Sell Stop с объемом:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", цена:", mytrade.RequestPrice(), " не выполнен - ошибка:",mytrade.ResultRetcodeDescription());
         return;
        }
     }
  }
//+------------------------------------------------------------------+