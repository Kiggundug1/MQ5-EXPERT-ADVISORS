//+------------------------------------------------------------------+
//|                                        mql5_standardclass_ea.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  Включаемые файлы с классами, которые будут использованы         |
//+------------------------------------------------------------------+
//--- Класс CTrade
#include <Trade\Trade.mqh>
//--- Класс CPositionInfo
#include <Trade\PositionInfo.mqh>
//--- Класс CAccountInfo
#include <Trade\AccountInfo.mqh>
//--- Класс CSymbolInfo
#include <Trade\SymbolInfo.mqh>

//+------------------------------------------------------------------+
//|  Входные параметры                                               |
//+------------------------------------------------------------------+
input int      StopLoss=100;     // Stop Loss
input int      TakeProfit=240;   // Take Profit
input int      ADX_Period=15;    // Период ADX
input int      MA_Period=15;     // Период Moving Average
input ulong    EA_Magic=99977;   // Magic Number советника
input double   Adx_Min=24.0;     // Минимальное значение ADX
input double   Lot=0.1;          // Количество лотов для торговли
input ulong    dev=100;          // Проскальзывание в пунктах 
input long     Trail_point=32;   // Количество пунктов для увеличения TP/SL
input int      Min_Bars = 20;    // Минимальное количество баров, требуемое эксперту для торговли
input double   TradePct = 25;    // Процент свободной торговой маржи счета
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
//+------------------------------------------------------------------+
//|  Создание объектов классов                                       |
//+------------------------------------------------------------------+
//--- Объект класса СTrade
CTrade mytrade;
//--- Объект класса СPositionInfo
CPositionInfo myposition;
//--- Объект класса СAccountInfo
CAccountInfo myaccount;
//--- Объект класса СSymbolInfo
CSymbolInfo mysymbol;
//+------------------------------------------------------------------+
//| Пользовательские функции                                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|  Проверяет, может ли советник совершать торговые операции        |
//+------------------------------------------------------------------+
bool checkTrading()
  {
   bool can_trade=false;
//--- проверка того, синхронизирован ли терминал с сервером и т.д.
   if(myaccount.TradeAllowed() && myaccount.TradeExpert() && mysymbol.IsSynchronized())
     {
      //--- есть ли у нас достаточное количество баров?
      int mbars=Bars(_Symbol,_Period);
      if(mbars>Min_Bars)
        {
         can_trade=true;
        }
     }
   return(can_trade);
  }
//+------------------------------------------------------------------+
//|  Подтверждает, что маржи достаточно для открытия ордера          |
//|------------------------------------------------------------------+
bool ConfirmMargin(ENUM_ORDER_TYPE otype,double price)
  {
   bool confirm=false;
   double lot_price=myaccount.MarginCheck(_Symbol,otype,Lot,price);  //--- цена лота/кол-во требуемой маржи
   double act_f_mag=myaccount.FreeMargin();                          //--- кол-во свободной маржи счета
//--- проверяет, достаточно ли средств маржи
   if(MathFloor(act_f_mag*TPC)>MathFloor(lot_price))
     {
      confirm=true;
     }
   return(confirm);
  }
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
//|  Проверяет, нужно ли закрывать открытую позицию                  |
//+------------------------------------------------------------------+
bool checkClosePos(string ptype,double Closeprice)
  {
   bool mark=false;
   if(ptype=="BUY")
     {
      //--- нужно ли закрывать эту позицию?
      if(Closeprice<maVal[1]) //--- цена закрытия предыдущего бара ниже MA
        {
         mark=true;
        }
     }
   if(ptype=="SELL")
     {
      //--- нужно ли закрывать эту позицию?
      if(Closeprice>maVal[1]) //--- цена закрытия предыдущего бара выше MA
        {
         mark=true;
        }
     }
   return(mark);
  }
//+------------------------------------------------------------------+
//| Проверяет и если нужно, закрывает открытую позицию               |
//+------------------------------------------------------------------+
bool ClosePosition(string ptype,double clp)
  {
   bool marker=false;
     
      if(myposition.Select(_Symbol)==true)
        {
         if(myposition.Magic()==EA_Magic && myposition.Symbol()==_Symbol)
           {
            //--- Проверяем, нужно ли закрывать эту позицию
            if(checkClosePos(ptype,clp)==true)
              {
               //--- закрываем эту позицию и проверяем, успешно ли она закрылась
               if(mytrade.PositionClose(_Symbol)) 
                 {//--- запрос успешно выполнен
                  Alert("Открытая позиция была успешно закрыта!!");
                  marker=true;
                 }
               else
                 {
                  Alert("Запрос на закрытие позиции не выполнен - ошибка: ",mytrade.ResultRetcodeDescription());
                 }
              }
           }
        }
      return(marker);
     }
//+------------------------------------------------------------------+
//|  Проверяет условия модификации открытой позиции                  |
//+------------------------------------------------------------------+
   bool CheckModify(string otype,double cprc)
     {
      bool check=false;
      if(otype=="BUY")
        {
         if((maVal[2]<maVal[1]) && (maVal[1]<maVal[0]) && (cprc>maVal[1]) && (adxVal[1]>Adx_Min))
           {
            check=true;
           }
        }
      else if(otype=="SELL")
        {
         if((maVal[2]>maVal[1]) && (maVal[1]>maVal[0]) && (cprc<maVal[1]) && (adxVal[1]>Adx_Min))
           {
            check=true;
           }
        }
      return(check);
     }
//+------------------------------------------------------------------+
//| Изменяет параметры открытой позиции                              |
//+------------------------------------------------------------------+
   void Modify(string ptype,double stpl,double tkpf)
     {
      double ntp,nsl,pbid,pask;                  //--- новые Stop Loss, Take profit ,и цены Bid и Ask
      long tsp=Trail_point;
      if(_Digits==5 || _Digits==3) tsp=tsp*10;   //--- учет 5/3 знаковых цен
      long stplevel= mysymbol.StopsLevel();      //--- Stops Level
      if(tsp<stplevel) tsp=stplevel;             //--- размер трейлинга должен быть не меньше, чем Stops Level
      if(ptype=="BUY")
        {
         pbid=mysymbol.Bid();           //--- текушая цена bid
         if(tkpf-pbid<=stplevel*_Point)
           {
           //--- увеличиваем takeprofit, если расстояние до Take Profit 
           //--- меньше или равно Stops level
            ntp = pbid + tsp*_Point;
            nsl = pbid - tsp*_Point;
           }
         else
           {
           //--- расстояние до takeprofit больше, чем Stops level
           //--- не меняем значение takeprofit
            ntp = tkpf;
            nsl = pbid - tsp*_Point;
           }
        }
      else //--- короткая позиция
        {
         pask=mysymbol.Ask();            //--- текущая цена Ask
         if(pask-tkpf<=stplevel*_Point)
           {
            ntp = pask - tsp*_Point;
            nsl = pask + tsp*_Point;
           }
         else
           {
            ntp = tkpf;
            nsl = pask + tsp*_Point;
           }
        }
      //--- изменяем параметры позиции и проверяем результат
      if(mytrade.PositionModify(_Symbol,nsl,ntp)) 
        {//--- Запрос успешно завершен
         Alert("Параметры открытой позиции успешно изменены!!");
         return;
        }
      else
        {
         Alert("Запрос на изменение параметров позиции не выполнен - ошибка:: ",mytrade.ResultRetcodeDescription());
         return;
        }

     }
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
   int OnInit()
     {
      //--- установка наименования символа для объекта класса CSymbolInfo
      mysymbol.Name(_Symbol);
      //--- установка идентификатора эксперта (Magic) в объекте класса CTrade
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
      STP = StopLoss;
      TKP = TakeProfit;
      //--- будем поддерживать брокеров с 5/3 знаками
      if(_Digits==5 || _Digits==3)
        {
         STP = STP*10;
         TKP = TKP*10;
        }
      //--- установим процент капитала для торговли
      TPC = TradePct;
      TPC = TPC/100;
      //---
      return(0);
     }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
   void OnDeinit(const int reason)
     {
      //--- Release our indicator handles
      IndicatorRelease(adxHandle);
      IndicatorRelease(maHandle);

     }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
   void OnTick()
     {
      //--- проверим снова, может ли советник торговать
      if(checkTrading()==false)
        {
         Alert("Советник не может торговать, поскольку не удовлетворяются некоторые торговые требования");
         return;
        }
      //--- Объявим структуру типа MqlRates, которую будем использовать при торговле
      MqlRates mrate[];   //--- будет использована для хранения цен, объемов и спреда каждого бара
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

      //--- Получим последние котировки, используя функцию объект класса CSymbolInfo
      if(!mysymbol.RefreshRates())
        {
         Alert("Ошибка обновления котировок - ошибка: ",GetLastError(),"!!");
         return;
        }
      //--- Копируем данные по 3-м последним барам
      if(CopyRates(_Symbol,_Period,0,3,mrate)<0)
        {
         Alert("Ошибка копирования исторических котировок - ошибка: ",GetLastError(),"!!");
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
      if(CopyBuffer(adxHandle,0,0,3,adxVal)<3 || CopyBuffer(adxHandle,1,0,3,plsDI)<3
         || CopyBuffer(adxHandle,2,0,3,minDI)<3)
        {
         Alert("Ошибка копирования буферов индикатора ADX - ошибка: ",GetLastError(),"!!");
         return;
        }
      if(CopyBuffer(maHandle,0,0,3,maVal)<3)
        {
         Alert("Ошибка копирования буфера индикатора Moving Average - ошибка:",GetLastError());
         return;
        }
      //--- ошибок нет, продолжаем
      //--- копируем цену закрытия предыдущего бара (бара, предшествующего текущему, т.е. бара 1)

      p_close=mrate[1].close;  //--- цена закрытия бара 1
      //--- есть ли открытые позиции по текущему символу?
      bool Buy_opened=false,Sell_opened=false;
      if(myposition.Select(_Symbol)==true) //--- открытые позиции есть
        {
         if(myposition.PositionType()==POSITION_TYPE_BUY)
           {
            Buy_opened=true;  // длинная позиция (Buy)
            //--- получаем значения StopLoss и Take Profit позиции
            double buysl = myposition.StopLoss();      //--- Stop Loss
            double buytp = myposition.TakeProfit();    //--- Take Profit
            //--- проверяем, нужно ли закрывать открытую позицию
            if(ClosePosition("BUY",p_close)==true)
              {
               Buy_opened=false;                       //--- позиция была закрыта
               return;                                 //--- выходим
              }
            else
              {
               if(CheckModify("BUY",p_close)==true) //--- надо ли изменять параметры позиции?
                 {
                  Modify("BUY",buysl,buytp);
                  return; //--- выходим
                 }
              }
           }
         else if(myposition.PositionType()==POSITION_TYPE_SELL)
           {
            Sell_opened=true; //--- короткая позиция (Sell)
            //--- Получаем значения StopLoss и Take Profit
            double sellsl = myposition.StopLoss();    //--- Stop Loss
            double selltp = myposition.TakeProfit();  //--- Take Profit
            if(ClosePosition("SELL",p_close)==true)
              {
               Sell_opened=false;                     //--- позиция была закрыта
               return;                                //--- выходим
              }
            else
              {
               if(CheckModify("SELL",p_close)==true) //--- нужно ли модифицировать параметры позиции
                 {
                  Modify("SELL",sellsl,selltp);
                  return;                            //--- выходим
                 }
              }
           }
        }
/*
    Проверка условий покупки : MA растет, 
    предыдущая цена закрытия больше ее, ADX > adxmin, +DI > -DI
*/
      if(checkBuy()==true)
        {
         //--- есть ли открытая позиция на покупку?
         if(Buy_opened)
           {
            Alert("У нас уже есть открытая позиция на покупку!!!");
            return;    //--- Не открываем новую позицию на покупку
           }

         double mprice=NormalizeDouble(mysymbol.Ask(),_Digits);                //--- последняя цена ask
         double stloss = NormalizeDouble(mysymbol.Ask() - STP*_Point,_Digits); //--- Stop Loss
         double tprofit = NormalizeDouble(mysymbol.Ask()+ TKP*_Point,_Digits); //--- Take Profit
         //--- проверяем маржу 
         if(ConfirmMargin(ORDER_TYPE_BUY,mprice)==false)
           {
            Alert("Недостаточно средств для совершения торговой операции с параметрами, которые установлены.");
            return;
           }
         //--- открываем позицию на покупку (Buy)
         if(mytrade.Buy(Lot,_Symbol,mprice,stloss,tprofit))
         //if(mytrade.PositionOpen(_Symbol,ORDER_TYPE_BUY,Lot,mprice,stloss,tprofit)) //--- Request is completed or order placed
           {
            Alert("Ордер на покупку успешно помещен с тикетом #",mytrade.ResultDeal(),"!!");
           }
         else
           {
            Alert("Запрос на покупку с объемом:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", цена:", mytrade.RequestPrice(), " не выполнен -ошибка:",mytrade.ResultRetcodeDescription());
            return;
           }
        }
/*
    2. Проверка условий на продажу : MA падает, 
    предыдущая цена закрытия ниже находится ее, ADX > adxmin, -DI > +DI
*/
      if(checkSell()==true)
        {
         //--- есть ли открытая позиция на продажу?
         if(Sell_opened)
           {
            Alert("У нас уже есть позиция на продажу!!!");
            return;    //--- выходим и ждем нового бара
           }

         double sprice=NormalizeDouble(mysymbol.Bid(),_Digits);              //--- последняя цена Bid
         double ssloss=NormalizeDouble(mysymbol.Bid()+STP*_Point,_Digits);   //--- Stop Loss
         double stprofit=NormalizeDouble(mysymbol.Bid()-TKP*_Point,_Digits); //--- Take Profit
         //--- проверка маржи
         if(ConfirmMargin(ORDER_TYPE_SELL,sprice)==false)
           {
            Alert("Недостаточно средств для совершения торговой операции с параметрами, которые установлены");
            return;
           }
         //--- открываем позицию на продажу и проверяем результат
         if(mytrade.Sell(Lot,_Symbol,sprice,ssloss,stprofit))
         //if(mytrade.PositionOpen(_Symbol,ORDER_TYPE_SELL,Lot,sprice,ssloss,stprofit)) //---Request is completed or order placed
           {
            Alert("Ордер на продажу успешно помещен с тикетом #:",mytrade.ResultDeal(),"!!");
           }
         else
           {
            Alert("Запрос на покупку с объемом:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", цена:", mytrade.RequestPrice(), " не выполнен - ошибка:",mytrade.ResultRetcodeDescription());
            return;
           }
        }
     }
//+------------------------------------------------------------------+