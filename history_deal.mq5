//+------------------------------------------------------------------+
//|                                                history_deal.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  �������� ��� ������, ������� ����� ��������������               |
//+------------------------------------------------------------------+
//--- ����� CDealInfo
#include <Trade\DealInfo.mqh>
//+------------------------------------------------------------------+
//|  ������� ������ ������                                           |
//+------------------------------------------------------------------+
//--- ������ ������ CDealInfo
CDealInfo mydeal;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- �������� ��� ������������ ������ � �� ��������
    int buy=0;
    int sell=0;
    int deal_in=0;
    int deal_out=0;
    ulong d_ticket;
//--- �������� ��� ������������ ������
    if (HistorySelect(0,TimeCurrent())) 
    {
      //--- �������� ����� ���������� ������ � �������
      for (int j=HistoryDealsTotal()-1; j>=0; j--)
      {
         //--- �������� ������ �� �������
         d_ticket = HistoryDealGetTicket(j);
         if (d_ticket>0)
         {
          //--- ������������� ����� ������ ��� ������ � ���
          mydeal.Ticket(d_ticket);
          Print("������ ������ ",j," �����: ",mydeal.Ticket()," !");
          Print("������ ������ ",j," ����� ����������: ",TimeToString(mydeal.Time())," !");
          Print("������ ������ ",j," ����: ",mydeal.Price()," !");
          Print("������ ������ ",j," ������: ",mydeal.Symbol()," !");
          Print("������ ������ ",j," �������� ���� ������: ",mydeal.TypeDescription()," !");
          Print("������ ������ ", j ," Magic ������: ", mydeal.Magic() ," !");
          Print("������ ������ ", j ," ����� ������: ", mydeal.Time() ," !");
          Print("������ ������ ",j," ��������� ����� ������: ",mydeal.Volume()," !");
          Print("������ ������ ",j," ����������� ������: ",mydeal.EntryDescription()," !");
          Print("������ ������ ",j," ������� ������: ",mydeal.Profit()," !");
          //
          if (mydeal.Entry() == DEAL_ENTRY_IN) deal_in++;
          if (mydeal.Entry() == DEAL_ENTRY_OUT) deal_out++;
          if (mydeal.DealType() == DEAL_TYPE_BUY) buy++;
          if (mydeal.DealType() == DEAL_TYPE_SELL) sell++;
         }
      }
    }
//--- ������� ����������
   Print("����� ���������� ������ � �������:",HistoryDealsTotal()," !");
   Print("���������� ������ � ����������� IN: ",deal_in);
   Print("���������� ������ � ����������� OUT: ",deal_out);
   Print("���������� ������ �� �������: ",buy);
   Print("���������� ������ �� �������: ",sell);
  }
//+------------------------------------------------------------------+
