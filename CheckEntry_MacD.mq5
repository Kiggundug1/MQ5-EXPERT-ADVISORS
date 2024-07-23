   string CheckEntry()
   {
 
      // create a string variable for the signal
      string signal="";
   
      // create an Array for several prices
      double myPriceArray[];

      // define the properties of the MacD EA  
      int MacDDefinition = iMACD(_Symbol,_Period,12,26,9,PRICE_CLOSE);

      // sort the price array from the current candle downwards
      ArraySetAsSeries(myPriceArray,true);
      
      // Defined MA1, one line,current candle,3 candles, store result 
      CopyBuffer(MacDDefinition,0,0,3,myPriceArray);

      // Get the value of the current candle
      float MacDValue=(myPriceArray[0]);  
      
      // Chart output depending on the value
       
      if (MacDValue>0) 
      signal="sell";
     
      if (MacDValue<0) 
      signal="buy";

   
   return signal;
   }
   

 