//+------------------------------------------------------------------+
//|                             mql5_standardclass_ea_stoporders.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  ���������� ����� � ��������, ������� ����� ������������         |
//+------------------------------------------------------------------+
//--- ������ ������ CTrade
#include <Trade\Trade.mqh>
//--- ������ ������ CPositionInfo
#include <Trade\PositionInfo.mqh>
//--- ������ ������ CSymbolInfo
#include <Trade\SymbolInfo.mqh>
//--- ������ ������ COrderInfo
#include <Trade\OrderInfo.mqh>
//+------------------------------------------------------------------+
//|  ������� ���������                                               |
//+------------------------------------------------------------------+
input int      StopLoss=30;      // Stop Loss
input int      TakeProfit=60;    // Take Profit
input int      ADX_Period=14;    // ������ ADX
input int      MA_Period=15;     // ������ Moving Average
input ulong    EA_Magic=99977;   // Magic Number ���������
input double   Adx_Min=25.0;     // ����������� �������� ADX
input double   Lot=0.1;          // ���������� ����� ��� ��������
input ulong    dev=100;          // ��������������� 
//+------------------------------------------------------------------+
//|  ������ �������� ���������                                       |
//+------------------------------------------------------------------+
int adxHandle; //--- ����� ������ ���������� ADX
int maHandle;  //--- ����� ������ ���������� Moving Average
double plsDI[],minDI[],adxVal[]; //--- ������������ ������� ��� �������� �������� +DI, -DI � ADX ������� ����
double maVal[]; //--- ������������ ������ ��� �������� �������� ���������� Moving Average ��� ������� ����
double p_close; //--- ���������� ��� �������� ������� �������� ���� �������� ����
int STP,TKP;    //--- ����� �������������� ��� Stop Loss, Take Profit
double TPC;     //--- ����� ����������� ��� �������� �����

//--- ��������� ��������� ���� MqlRates, ������� ����� ������������ � ��������
//--- ��� �������� ���, ������� � ������ ������� ����
MqlRates mrate[];

//+------------------------------------------------------------------+
//|  ������� ������� �������                                         |
//+------------------------------------------------------------------+
//--- ������ ������ CTrade
CTrade mytrade;
//--- ������ ������ �PositionInfo
CPositionInfo myposition;
//--- ������ ������ CSymbolInfo
CSymbolInfo mysymbol;
//--- ������ ������ COrderInfo
COrderInfo myorder;
//+------------------------------------------------------------------+
//| ���������������� �������                                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|  ��������� ������� �� �������                                    |
//+------------------------------------------------------------------+
bool checkBuy()
  {
   bool dobuy=false;
   if((maVal[0]>maVal[1]) && (maVal[1]>maVal[2]) && (p_close>maVal[1]))
     {
      //--- MA ������ � ���� �������� ����������� ���� ���� MA
      if((adxVal[1]>Adx_Min) && (plsDI[1]>minDI[1]))
        {
         //--- �������� ADX ������, ��� ���������� ���������, � +DI ������, ��� -DI
         dobuy=true;
        }
     }
   return(dobuy);
  }
//+------------------------------------------------------------------+
//|  ��������� ������� �� �������                                    |
//+------------------------------------------------------------------+
bool checkSell()
  {
   bool dosell=false;
   if((maVal[0]<maVal[1]) && (maVal[1]<maVal[2]) && (p_close<maVal[1]))
     {
      //--- MA ������ � ���� �������� ����������� ���� ���� MA
      if((adxVal[1]>Adx_Min) && (minDI[1]>plsDI[1]))
        {
         //--- �������� ADX ������, ��� ���������� ���������, � -DI ������, ��� +DI
         dosell=true;
        }
     }
   return(dosell);
  }
//+------------------------------------------------------------------+
//| ������� ����� ���������� �������,                                |
//| ����������� ���������� �� ������ �������                         |
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
//| ��������� � ������� ���������� ������                            |
//+------------------------------------------------------------------+
bool DeletePending()
  {
   bool marker=false;
//--- �������� ���� ���������� �������
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(myorder.Select(OrderGetTicket(i)))
        {
         if(myorder.Magic()==EA_Magic && myorder.Symbol()==_Symbol)
           {
            //--- �������� ����� ������ - ��� ������ ���� ������, ��� ����� ��� ���� ����� 
            if(myorder.TimeSetup()<mrate[2].time)
              {
               //--- ������� ���� ���������� ����� � ���������, ��� �� �� ������� ������
                if(mytrade.OrderDelete(myorder.Ticket())) 
                  { // ����� ������� ������
                      Alert("���������� ����� � ������� #", myorder.Ticket(), " ��� ������� ������!!");
                      marker=true;
                  }
                 else
                  {
                      Alert("������ �� �������� ����������� ������ # ",myorder.Ticket() ," �� ��� �������� - ������: ",mytrade.ResultRetcodeDescription());
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
//--- ��������� ������������ ������� ��� ������� ������ CSymbolInfo
   mysymbol.Name(_Symbol);
//--- ��������� �������������� �������� (Expert Magic No) � ������� ������ CTrade
   mytrade.SetExpertMagicNumber(EA_Magic);
//--- ��������� ����������� ����������� ��������������� � ������� ������ CTrade
   mytrade.SetDeviationInPoints(dev);
//--- �������� ����� ���������� ADX
   adxHandle=iADX(NULL,0,ADX_Period);
//--- �������� ����� ���������� Moving Average
   maHandle=iMA(_Symbol,Period(),MA_Period,0,MODE_EMA,PRICE_CLOSE);
//--- ���� ������ ��������
   if(adxHandle<0 || maHandle<0)
     {
      Alert("������ �������� ������ ����������� MA � ADX - ������: ",GetLastError(),"!!");
      return(1);
     }
//--- ����� ������������ �������� � 5/3 �������
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
//--- ����������� ����� ����� �����������
   IndicatorRelease(adxHandle);
   IndicatorRelease(maHandle);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
/*
     �������� � ���, ��� �������� ����� �������� ��� ���������, 
     �������� ���������� ADX � MA ������� ��� ���������
*/
//--- ������ ���������
   ArraySetAsSeries(mrate,true);
//--- ������ �������� ADX
   ArraySetAsSeries(adxVal,true);
//--- ������ �������� MA
   ArraySetAsSeries(maVal,true);
//--- ������ �������� -DI
   ArraySetAsSeries(minDI,true);
//--- ������ �������� +DI
   ArraySetAsSeries(plsDI,true);
//

//--- ������� ��������� ���������, ��������� ������� ������ ������ CSymbolInfo
   if(!mysymbol.RefreshRates())
     {
      Alert("������ ���������� ��������� - ������:",GetLastError(),"!!");
      return;
     }

//--- �������� ������ �� 4-� ��������� �����
   if(CopyRates(_Symbol,_Period,0,4,mrate)<0)
     {
      Alert("������ ����������� ������������ ��������� - ������:",GetLastError(),"!!");
      return;
     }

//--- �������� ������ ��������� ������� �������� ������ ��� ��������� ������ ����
//--- ������� ����������� ���������� ���� datetime
   static datetime Prev_time;
//--- ������� ������ �� ������ �������� ��� �������� ������� ������ �������� ���� (��� 0)
   datetime Bar_time[1];
//--- �������� ����� �������� ����
   Bar_time[0]=mrate[0].time;
//--- ���� ��� ������� �����, ����� ��� �� ��������
   if(Prev_time==Bar_time[0])
     {
      return;
     }
//--- �������� ����� � ����������� ����������
   Prev_time=Bar_time[0];

//--- �������� ����� �������� ����������� � �������, ��������� ������ �����������
   if(CopyBuffer(adxHandle,0,0,5,adxVal)<1 || CopyBuffer(adxHandle,1,0,5,plsDI)<1
      || CopyBuffer(adxHandle,2,0,5,minDI)<1)
     {
      Alert("������ ����������� ������� ���������� ADX - ������:",GetLastError(),"!!");
      return;
     }
   if(CopyBuffer(maHandle,0,0,5,maVal)<1)
     {
      Alert("������ ����������� ������ ���������� Moving Average - ������:",GetLastError());
      return;
     }
//--- ������ ���, ����������
//--- �������� ���� �������� ����������� ���� (����, ��������������� ��������, �.�. ���� 1)

   p_close=mrate[1].close;  //--- ���� �������� ���� 1

//--- ���������� �� ����� 3-� ���������� �������?
   if(CountOrders()>3)
     {
      DeletePending();
      return;
     }
   //--- ���� �� �������� �������?
   bool Buy_opened=false,Sell_opened=false;
   if(myposition.Select(_Symbol)==true) //--- ���� �������� �������
     {
      if(myposition.PositionType()==POSITION_TYPE_BUY)
        {
         Buy_opened=true;  //--- ������� (buy) �������
         return;           //--- ������� � ���� ������ ����
        }
      else if(myposition.PositionType()==POSITION_TYPE_SELL)
        {
         Sell_opened=true; //--- �������� (sell) �������
         return;           //--- ������� � ���� ������ ����
        }

     }
/*
    �������� ������� ������� : MA ������, 
    ���������� ���� �������� ������ ��, ADX > adxmin, +DI > -DI
*/
   if(checkBuy()==true)
     {
      Alert("����� ���������� ������������� ���������� �������: ",CountOrders(),"!!");
      //--- ���� �� ������� �� �������?
      if(Buy_opened)
        {
         Alert("� ��� ��� ���� ������� �� �������!!!");
         return;    //---  �� ��������� ����� ������� �� �������
        }
      //--- ���� ������� = bar 1 High + 2 pip + spread
      int sprd=mysymbol.Spread();
      double bprice =mrate[1].high + 10*_Point + sprd*_Point;
      double mprice=NormalizeDouble(bprice,_Digits);                //--- ���� �������
      double stloss = NormalizeDouble(bprice - STP*_Point,_Digits); //--- Stop Loss
      double tprofit = NormalizeDouble(bprice+ TKP*_Point,_Digits); //--- Take Profit
      //--- ��������� ����� Buy Stop
      if(mytrade.BuyStop(Lot,mprice,_Symbol,stloss,tprofit))
      //if(mytrade.OrderOpen(_Symbol,ORDER_TYPE_BUY_STOP,Lot,0.0,bprice,stloss,tprofit,ORDER_TIME_GTC,0)) 
        {
         //--- ������ �������� ��� ����� ��������
         Alert("����� Buy Stop ��� ������� �������� � ������� #:",mytrade.ResultOrder(),"!!");
         return;
        }
      else
        {
         Alert("������ �� ���������� ������ BuyStop � �������:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", ����:", mytrade.RequestPrice(), " �� �������� - ������:",mytrade.ResultRetcodeDescription());
         return;
        }
     }

/*
    2. �������� ������� �� ������� : MA ������, 
    ���������� ���� �������� ���� ��������� ��, ADX > adxmin, -DI > +DI
*/
   if(checkSell()==true)
     {
      Alert("����� ���������� ������������� ���������� �������:",CountOrders(),"!!");
      //--- ���� �� �������� ������� �� �������?
      if(Sell_opened)
        {
         Alert("� ��� ��� ���� ������� �� �������!!!");
         return;    //--- ������� � ���� ������ ����
        }
      //--- ���� ������� = bar 1 Low - 2 pip 
      double sprice=mrate[1].low-10*_Point;
      double slprice=NormalizeDouble(sprice,_Digits);             //--- ���� �������
      double ssloss=NormalizeDouble(sprice+STP*_Point,_Digits);   //--- Stop Loss
      double stprofit=NormalizeDouble(sprice-TKP*_Point,_Digits); //--- Take Profit
      //--- ��������� ����� Sell Stop
      if(mytrade.SellStop(Lot,slprice,_Symbol,ssloss,stprofit))
      //if(mytrade.OrderOpen(_Symbol,ORDER_TYPE_SELL_STOP,Lot,0.0,slprice,ssloss,stprofit,ORDER_TIME_GTC,0)) 
        {
         //--- ������ �������� ��� ����� ��������
         Alert("���������� ����� Sell Stop ������� �������� � ������� #",mytrade.ResultOrder(),"!!");
         return;
        }
      else
        {
         Alert("������ � ���������� ����������� ������ Sell Stop � �������:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", ����:", mytrade.RequestPrice(), " �� �������� - ������:",mytrade.ResultRetcodeDescription());
         return;
        }
     }
  }
//+------------------------------------------------------------------+