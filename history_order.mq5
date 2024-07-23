//+------------------------------------------------------------------+
//|                                                history_order.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  �������� ��� ������, ������� ����� ��������������               |
//+------------------------------------------------------------------+
//--- ����� CHistoryOrderInfo
#include <Trade\HistoryOrderInfo.mqh>
//+------------------------------------------------------------------+
//|  ������� ������ ������                                           |
//+------------------------------------------------------------------+
//--- ������ ������ CHistoryOrderInfo
CHistoryOrderInfo myhistory;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- �������� ��� ������������ ������ � �� ��������
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
//--- �������� ��� ������������ ������
   if(HistorySelect(0,TimeCurrent())) //-- ��� ������������ ������
     {
      //--- �������� ����� ���������� ������� � �������
      for(int j=HistoryOrdersTotal()-1; j>=0; j--)
        {
         //--- �������� ����� �� �������
         o_ticket=HistoryOrderGetTicket(j);
         if(o_ticket>0)
           {
            //--- ������������� ����� ������ ��� ���������� ������ � ���
            myhistory.Ticket(o_ticket);
            Print("������ ������ ",j," �����: ",myhistory.Ticket()," !");
            Print("������ ������ ",j," ����� ���������: ",TimeToString(myhistory.TimeSetup())," !");
            Print("������ ������ ",j," ���� ��������: ",myhistory.PriceOpen()," !");
            Print("������ ������ ",j," ������: ",myhistory.Symbol()," !");
            Print("������ ������ ",j," ��� ������: ",myhistory.OrderType()," !");
            Print("������ ������ ",j," �������� ����: ",myhistory.TypeDescription()," !");
            Print("������ ������ ",j," Magic: ",myhistory.Magic()," !");
            Print("������ ������ ",j," ����� ����������: ", myhistory.TimeDone() ," !");
            Print("������ ������ ",j," ��������� �����: ", myhistory.VolumeInitial() ," !");
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
// ����� ����������
   Print("�� ���� �������");
   Print("�������� ������� Buy: ",buy);
   Print("�������� ������� Sell: ",sell);
   Print("���������� ������� Buy Stop: ",buystop);
   Print("���������� ������� Sell Stop: ",sellstop);
   Print("���������� ������� Buy Limit: ",buylimit);
   Print("���������� ������� Sell Limit: ",selllimit);
   Print("���������� ������� Buy Stop Limit: ",buystoplimit);
   Print("���������� ������� Sell Stop Limit: ",sellstoplimit);
   Print("����� ���������� �������: ",HistoryOrdersTotal()," !");

   Print("�� ������� �������");
   Print("��������� �� ������������, �� ��� �� ������� ��������: ",s_started);
   Print("�������: ",s_placed);
   Print("����� ��������: ",s_cancelled);
   Print("��������� ��������: ",s_partial);
   Print("��������� ���������: ",s_filled);
   Print("���������: ",s_rejected);
   Print("����� �� ��������� ����� �������� ������: ",s_expired);
  }
//+------------------------------------------------------------------+
