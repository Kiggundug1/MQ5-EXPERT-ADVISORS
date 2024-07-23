//+------------------------------------------------------------------+
//|                                                history_deal.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  Включаем все классы, которые будут использоваться               |
//+------------------------------------------------------------------+
//--- Класс CDealInfo
#include <Trade\DealInfo.mqh>
//+------------------------------------------------------------------+
//|  Создаем объект класса                                           |
//+------------------------------------------------------------------+
//--- Объект класса CDealInfo
CDealInfo mydeal;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- Получаем все исторические сделки и их свойства
    int buy=0;
    int sell=0;
    int deal_in=0;
    int deal_out=0;
    ulong d_ticket;
//--- Выбираем все исторические записи
    if (HistorySelect(0,TimeCurrent())) 
    {
      //--- Получаем общее количество сделок в истории
      for (int j=HistoryDealsTotal()-1; j>=0; j--)
      {
         //--- Выбираем сделки по индексу
         d_ticket = HistoryDealGetTicket(j);
         if (d_ticket>0)
         {
          //--- Устанавливаем тикет сделки для работы с ней
          mydeal.Ticket(d_ticket);
          Print("Индекс сделки ",j," Тикет: ",mydeal.Ticket()," !");
          Print("Индекс сделки ",j," Время исполнения: ",TimeToString(mydeal.Time())," !");
          Print("Индекс сделки ",j," Цена: ",mydeal.Price()," !");
          Print("Индекс сделки ",j," Символ: ",mydeal.Symbol()," !");
          Print("Индекс сделки ",j," Описание типа сделки: ",mydeal.TypeDescription()," !");
          Print("Индекс сделки ", j ," Magic сделки: ", mydeal.Magic() ," !");
          Print("Индекс сделки ", j ," Время сделки: ", mydeal.Time() ," !");
          Print("Индекс сделки ",j," Начальный объем сделки: ",mydeal.Volume()," !");
          Print("Индекс сделки ",j," Направление сделки: ",mydeal.EntryDescription()," !");
          Print("Индекс сделки ",j," Прибыль сделки: ",mydeal.Profit()," !");
          //
          if (mydeal.Entry() == DEAL_ENTRY_IN) deal_in++;
          if (mydeal.Entry() == DEAL_ENTRY_OUT) deal_out++;
          if (mydeal.DealType() == DEAL_TYPE_BUY) buy++;
          if (mydeal.DealType() == DEAL_TYPE_SELL) sell++;
         }
      }
    }
//--- Выводим статистику
   Print("Общее количество сделок в истории:",HistoryDealsTotal()," !");
   Print("Количество сделок в направлении IN: ",deal_in);
   Print("Количество сделок в направлении OUT: ",deal_out);
   Print("Количество сделок на покупку: ",buy);
   Print("Количество сделок на продажу: ",sell);
  }
//+------------------------------------------------------------------+
