//+------------------------------------------------------------------+
//|                                                history_order.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  Включаем все классы, которые будут использоваться               |
//+------------------------------------------------------------------+
//--- Класс CHistoryOrderInfo
#include <Trade\HistoryOrderInfo.mqh>
//+------------------------------------------------------------------+
//|  Создаем объект класса                                           |
//+------------------------------------------------------------------+
//--- Объект класса CHistoryOrderInfo
CHistoryOrderInfo myhistory;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- Получаем все исторические ордера и их свойства
   int buystop=0;
   int sellstop=0;
   int buylimit=0;
   int selllimit=0;
   int buystoplimit=0;
   int sellstoplimit=0;
   int buy=0;
   int sell=0;

   int s_started=0;
   int s_placed=0;
   int s_cancelled=0;
   int s_partial=0;
   int s_filled=0;
   int s_rejected=0;
   int s_expired=0;

   ulong o_ticket;
//--- Выбираем все исторические записи
   if(HistorySelect(0,TimeCurrent())) //-- Все исторические ордера
     {
      //--- Получаем общее количество ордеров в истории
      for(int j=HistoryOrdersTotal()-1; j>=0; j--)
        {
         //--- Выбираем ордер по индексу
         o_ticket=HistoryOrderGetTicket(j);
         if(o_ticket>0)
           {
            //--- Устанавливаем тикет ордера для дальнейшей работы с ним
            myhistory.Ticket(o_ticket);
            Print("Индекс ордера ",j," Тикет: ",myhistory.Ticket()," !");
            Print("Индекс ордера ",j," Время установки: ",TimeToString(myhistory.TimeSetup())," !");
            Print("Индекс ордера ",j," Цена открытия: ",myhistory.PriceOpen()," !");
            Print("Индекс ордера ",j," Символ: ",myhistory.Symbol()," !");
            Print("Индекс ордера ",j," Тип ордера: ",myhistory.OrderType()," !");
            Print("Индекс ордера ",j," Описание типа: ",myhistory.TypeDescription()," !");
            Print("Индекс ордера ",j," Magic: ",myhistory.Magic()," !");
            Print("Индекс ордера ",j," Время исполнения: ", myhistory.TimeDone() ," !");
            Print("Индекс ордера ",j," Начальный объем: ", myhistory.VolumeInitial() ," !");
            //
            if(myhistory.OrderType() == ORDER_TYPE_BUY_STOP) buystop++;
            if(myhistory.OrderType() == ORDER_TYPE_SELL_STOP) sellstop++;
            if(myhistory.OrderType() == ORDER_TYPE_BUY) buy++;
            if(myhistory.OrderType() == ORDER_TYPE_SELL) sell++;
            if(myhistory.OrderType() == ORDER_TYPE_BUY_LIMIT) buylimit++;
            if(myhistory.OrderType() == ORDER_TYPE_SELL_LIMIT) selllimit++;
            if(myhistory.OrderType() == ORDER_TYPE_BUY_STOP_LIMIT) buystoplimit++;
            if(myhistory.OrderType() == ORDER_TYPE_SELL_STOP_LIMIT) sellstoplimit++;

            if(myhistory.State() == ORDER_STATE_STARTED) s_started++;
            if(myhistory.State() == ORDER_STATE_PLACED) s_placed++;
            if(myhistory.State() == ORDER_STATE_CANCELED) s_cancelled++;
            if(myhistory.State() == ORDER_STATE_PARTIAL) s_partial++;
            if(myhistory.State() == ORDER_STATE_FILLED) s_filled++;
            if(myhistory.State() == ORDER_STATE_REJECTED) s_rejected++;
            if(myhistory.State() == ORDER_STATE_EXPIRED) s_expired++;
           }
        }
     }
// Вывод статистики
   Print("По типу ордеров");
   Print("Рыночных ордеров Buy: ",buy);
   Print("Рыночных ордеров Sell: ",sell);
   Print("Отложенных ордеров Buy Stop: ",buystop);
   Print("Отложенных ордеров Sell Stop: ",sellstop);
   Print("Отложенных ордеров Buy Limit: ",buylimit);
   Print("Отложенных ордеров Sell Limit: ",selllimit);
   Print("Отложенных ордеров Buy Stop Limit: ",buystoplimit);
   Print("Отложенных ордеров Sell Stop Limit: ",sellstoplimit);
   Print("Общее количество ордеров: ",HistoryOrdersTotal()," !");

   Print("По статусу ордеров");
   Print("Проверены на корректность, но еще не приняты брокером: ",s_started);
   Print("Принято: ",s_placed);
   Print("Снято клиентом: ",s_cancelled);
   Print("Выполнены частично: ",s_partial);
   Print("Выполнены полностью: ",s_filled);
   Print("Отклонены: ",s_rejected);
   Print("Сняты по истечении срока действия ордера: ",s_expired);
  }
//+------------------------------------------------------------------+
