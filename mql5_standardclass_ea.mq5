//+------------------------------------------------------------------+
//|                                        mql5_standardclass_ea.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  ���������� ����� � ��������, ������� ����� ������������         |
//+------------------------------------------------------------------+
//--- ����� CTrade
#include <Trade\Trade.mqh>
//--- ����� CPositionInfo
#include <Trade\PositionInfo.mqh>
//--- ����� CAccountInfo
#include <Trade\AccountInfo.mqh>
//--- ����� CSymbolInfo
#include <Trade\SymbolInfo.mqh>

//+------------------------------------------------------------------+
//|  ������� ���������                                               |
//+------------------------------------------------------------------+
input int      StopLoss=100;     // Stop Loss
input int      TakeProfit=240;   // Take Profit
input int      ADX_Period=15;    // ������ ADX
input int      MA_Period=15;     // ������ Moving Average
input ulong    EA_Magic=99977;   // Magic Number ���������
input double   Adx_Min=24.0;     // ����������� �������� ADX
input double   Lot=0.1;          // ���������� ����� ��� ��������
input ulong    dev=100;          // ��������������� � ������� 
input long     Trail_point=32;   // ���������� ������� ��� ���������� TP/SL
input int      Min_Bars = 20;    // ����������� ���������� �����, ��������� �������� ��� ��������
input double   TradePct = 25;    // ������� ��������� �������� ����� �����
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
//+------------------------------------------------------------------+
//|  �������� �������� �������                                       |
//+------------------------------------------------------------------+
//--- ������ ������ �Trade
CTrade mytrade;
//--- ������ ������ �PositionInfo
CPositionInfo myposition;
//--- ������ ������ �AccountInfo
CAccountInfo myaccount;
//--- ������ ������ �SymbolInfo
CSymbolInfo mysymbol;
//+------------------------------------------------------------------+
//| ���������������� �������                                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|  ���������, ����� �� �������� ��������� �������� ��������        |
//+------------------------------------------------------------------+
bool checkTrading()
  {
   bool can_trade=false;
//--- �������� ����, ��������������� �� �������� � �������� � �.�.
   if(myaccount.TradeAllowed() && myaccount.TradeExpert() && mysymbol.IsSynchronized())
     {
      //--- ���� �� � ��� ����������� ���������� �����?
      int mbars=Bars(_Symbol,_Period);
      if(mbars>Min_Bars)
        {
         can_trade=true;
        }
     }
   return(can_trade);
  }
//+------------------------------------------------------------------+
//|  ������������, ��� ����� ���������� ��� �������� ������          |
//|------------------------------------------------------------------+
bool ConfirmMargin(ENUM_ORDER_TYPE otype,double price)
  {
   bool confirm=false;
   double lot_price=myaccount.MarginCheck(_Symbol,otype,Lot,price);  //--- ���� ����/���-�� ��������� �����
   double act_f_mag=myaccount.FreeMargin();                          //--- ���-�� ��������� ����� �����
//--- ���������, ���������� �� ������� �����
   if(MathFloor(act_f_mag*TPC)>MathFloor(lot_price))
     {
      confirm=true;
     }
   return(confirm);
  }
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
//|  ���������, ����� �� ��������� �������� �������                  |
//+------------------------------------------------------------------+
bool checkClosePos(string ptype,double Closeprice)
  {
   bool mark=false;
   if(ptype=="BUY")
     {
      //--- ����� �� ��������� ��� �������?
      if(Closeprice<maVal[1]) //--- ���� �������� ����������� ���� ���� MA
        {
         mark=true;
        }
     }
   if(ptype=="SELL")
     {
      //--- ����� �� ��������� ��� �������?
      if(Closeprice>maVal[1]) //--- ���� �������� ����������� ���� ���� MA
        {
         mark=true;
        }
     }
   return(mark);
  }
//+------------------------------------------------------------------+
//| ��������� � ���� �����, ��������� �������� �������               |
//+------------------------------------------------------------------+
bool ClosePosition(string ptype,double clp)
  {
   bool marker=false;
     
      if(myposition.Select(_Symbol)==true)
        {
         if(myposition.Magic()==EA_Magic && myposition.Symbol()==_Symbol)
           {
            //--- ���������, ����� �� ��������� ��� �������
            if(checkClosePos(ptype,clp)==true)
              {
               //--- ��������� ��� ������� � ���������, ������� �� ��� ���������
               if(mytrade.PositionClose(_Symbol)) 
                 {//--- ������ ������� ��������
                  Alert("�������� ������� ���� ������� �������!!");
                  marker=true;
                 }
               else
                 {
                  Alert("������ �� �������� ������� �� �������� - ������: ",mytrade.ResultRetcodeDescription());
                 }
              }
           }
        }
      return(marker);
     }
//+------------------------------------------------------------------+
//|  ��������� ������� ����������� �������� �������                  |
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
//| �������� ��������� �������� �������                              |
//+------------------------------------------------------------------+
   void Modify(string ptype,double stpl,double tkpf)
     {
      double ntp,nsl,pbid,pask;                  //--- ����� Stop Loss, Take profit ,� ���� Bid � Ask
      long tsp=Trail_point;
      if(_Digits==5 || _Digits==3) tsp=tsp*10;   //--- ���� 5/3 �������� ���
      long stplevel= mysymbol.StopsLevel();      //--- Stops Level
      if(tsp<stplevel) tsp=stplevel;             //--- ������ ��������� ������ ���� �� ������, ��� Stops Level
      if(ptype=="BUY")
        {
         pbid=mysymbol.Bid();           //--- ������� ���� bid
         if(tkpf-pbid<=stplevel*_Point)
           {
           //--- ����������� takeprofit, ���� ���������� �� Take Profit 
           //--- ������ ��� ����� Stops level
            ntp = pbid + tsp*_Point;
            nsl = pbid - tsp*_Point;
           }
         else
           {
           //--- ���������� �� takeprofit ������, ��� Stops level
           //--- �� ������ �������� takeprofit
            ntp = tkpf;
            nsl = pbid - tsp*_Point;
           }
        }
      else //--- �������� �������
        {
         pask=mysymbol.Ask();            //--- ������� ���� Ask
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
      //--- �������� ��������� ������� � ��������� ���������
      if(mytrade.PositionModify(_Symbol,nsl,ntp)) 
        {//--- ������ ������� ��������
         Alert("��������� �������� ������� ������� ��������!!");
         return;
        }
      else
        {
         Alert("������ �� ��������� ���������� ������� �� �������� - ������:: ",mytrade.ResultRetcodeDescription());
         return;
        }

     }
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
   int OnInit()
     {
      //--- ��������� ������������ ������� ��� ������� ������ CSymbolInfo
      mysymbol.Name(_Symbol);
      //--- ��������� �������������� �������� (Magic) � ������� ������ CTrade
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
      STP = StopLoss;
      TKP = TakeProfit;
      //--- ����� ������������ �������� � 5/3 �������
      if(_Digits==5 || _Digits==3)
        {
         STP = STP*10;
         TKP = TKP*10;
        }
      //--- ��������� ������� �������� ��� ��������
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
      //--- �������� �����, ����� �� �������� ���������
      if(checkTrading()==false)
        {
         Alert("�������� �� ����� ���������, ��������� �� ��������������� ��������� �������� ����������");
         return;
        }
      //--- ������� ��������� ���� MqlRates, ������� ����� ������������ ��� ��������
      MqlRates mrate[];   //--- ����� ������������ ��� �������� ���, ������� � ������ ������� ����
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

      //--- ������� ��������� ���������, ��������� ������� ������ ������ CSymbolInfo
      if(!mysymbol.RefreshRates())
        {
         Alert("������ ���������� ��������� - ������: ",GetLastError(),"!!");
         return;
        }
      //--- �������� ������ �� 3-� ��������� �����
      if(CopyRates(_Symbol,_Period,0,3,mrate)<0)
        {
         Alert("������ ����������� ������������ ��������� - ������: ",GetLastError(),"!!");
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
      if(CopyBuffer(adxHandle,0,0,3,adxVal)<3 || CopyBuffer(adxHandle,1,0,3,plsDI)<3
         || CopyBuffer(adxHandle,2,0,3,minDI)<3)
        {
         Alert("������ ����������� ������� ���������� ADX - ������: ",GetLastError(),"!!");
         return;
        }
      if(CopyBuffer(maHandle,0,0,3,maVal)<3)
        {
         Alert("������ ����������� ������ ���������� Moving Average - ������:",GetLastError());
         return;
        }
      //--- ������ ���, ����������
      //--- �������� ���� �������� ����������� ���� (����, ��������������� ��������, �.�. ���� 1)

      p_close=mrate[1].close;  //--- ���� �������� ���� 1
      //--- ���� �� �������� ������� �� �������� �������?
      bool Buy_opened=false,Sell_opened=false;
      if(myposition.Select(_Symbol)==true) //--- �������� ������� ����
        {
         if(myposition.PositionType()==POSITION_TYPE_BUY)
           {
            Buy_opened=true;  // ������� ������� (Buy)
            //--- �������� �������� StopLoss � Take Profit �������
            double buysl = myposition.StopLoss();      //--- Stop Loss
            double buytp = myposition.TakeProfit();    //--- Take Profit
            //--- ���������, ����� �� ��������� �������� �������
            if(ClosePosition("BUY",p_close)==true)
              {
               Buy_opened=false;                       //--- ������� ���� �������
               return;                                 //--- �������
              }
            else
              {
               if(CheckModify("BUY",p_close)==true) //--- ���� �� �������� ��������� �������?
                 {
                  Modify("BUY",buysl,buytp);
                  return; //--- �������
                 }
              }
           }
         else if(myposition.PositionType()==POSITION_TYPE_SELL)
           {
            Sell_opened=true; //--- �������� ������� (Sell)
            //--- �������� �������� StopLoss � Take Profit
            double sellsl = myposition.StopLoss();    //--- Stop Loss
            double selltp = myposition.TakeProfit();  //--- Take Profit
            if(ClosePosition("SELL",p_close)==true)
              {
               Sell_opened=false;                     //--- ������� ���� �������
               return;                                //--- �������
              }
            else
              {
               if(CheckModify("SELL",p_close)==true) //--- ����� �� �������������� ��������� �������
                 {
                  Modify("SELL",sellsl,selltp);
                  return;                            //--- �������
                 }
              }
           }
        }
/*
    �������� ������� ������� : MA ������, 
    ���������� ���� �������� ������ ��, ADX > adxmin, +DI > -DI
*/
      if(checkBuy()==true)
        {
         //--- ���� �� �������� ������� �� �������?
         if(Buy_opened)
           {
            Alert("� ��� ��� ���� �������� ������� �� �������!!!");
            return;    //--- �� ��������� ����� ������� �� �������
           }

         double mprice=NormalizeDouble(mysymbol.Ask(),_Digits);                //--- ��������� ���� ask
         double stloss = NormalizeDouble(mysymbol.Ask() - STP*_Point,_Digits); //--- Stop Loss
         double tprofit = NormalizeDouble(mysymbol.Ask()+ TKP*_Point,_Digits); //--- Take Profit
         //--- ��������� ����� 
         if(ConfirmMargin(ORDER_TYPE_BUY,mprice)==false)
           {
            Alert("������������ ������� ��� ���������� �������� �������� � �����������, ������� �����������.");
            return;
           }
         //--- ��������� ������� �� ������� (Buy)
         if(mytrade.Buy(Lot,_Symbol,mprice,stloss,tprofit))
         //if(mytrade.PositionOpen(_Symbol,ORDER_TYPE_BUY,Lot,mprice,stloss,tprofit)) //--- Request is completed or order placed
           {
            Alert("����� �� ������� ������� ������� � ������� #",mytrade.ResultDeal(),"!!");
           }
         else
           {
            Alert("������ �� ������� � �������:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", ����:", mytrade.RequestPrice(), " �� �������� -������:",mytrade.ResultRetcodeDescription());
            return;
           }
        }
/*
    2. �������� ������� �� ������� : MA ������, 
    ���������� ���� �������� ���� ��������� ��, ADX > adxmin, -DI > +DI
*/
      if(checkSell()==true)
        {
         //--- ���� �� �������� ������� �� �������?
         if(Sell_opened)
           {
            Alert("� ��� ��� ���� ������� �� �������!!!");
            return;    //--- ������� � ���� ������ ����
           }

         double sprice=NormalizeDouble(mysymbol.Bid(),_Digits);              //--- ��������� ���� Bid
         double ssloss=NormalizeDouble(mysymbol.Bid()+STP*_Point,_Digits);   //--- Stop Loss
         double stprofit=NormalizeDouble(mysymbol.Bid()-TKP*_Point,_Digits); //--- Take Profit
         //--- �������� �����
         if(ConfirmMargin(ORDER_TYPE_SELL,sprice)==false)
           {
            Alert("������������ ������� ��� ���������� �������� �������� � �����������, ������� �����������");
            return;
           }
         //--- ��������� ������� �� ������� � ��������� ���������
         if(mytrade.Sell(Lot,_Symbol,sprice,ssloss,stprofit))
         //if(mytrade.PositionOpen(_Symbol,ORDER_TYPE_SELL,Lot,sprice,ssloss,stprofit)) //---Request is completed or order placed
           {
            Alert("����� �� ������� ������� ������� � ������� #:",mytrade.ResultDeal(),"!!");
           }
         else
           {
            Alert("������ �� ������� � �������:",mytrade.RequestVolume(), ", sl:", mytrade.RequestSL(),", tp:",mytrade.RequestTP(), ", ����:", mytrade.RequestPrice(), " �� �������� - ������:",mytrade.ResultRetcodeDescription());
            return;
           }
        }
     }
//+------------------------------------------------------------------+