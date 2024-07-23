   string CheckEntry()
 {
      
      // create an empty string for the signal
      string signal ="";
      
       // create an Array for several prices
      double myPriceArray[];

      // define the properties of the iAC EA  
      int iACDefinition =iAC(_Symbol,_Period);
      
      // sort the price array1 from the current candle downwards
      ArraySetAsSeries(myPriceArray,true);  

      // Defined MA1, one line,current candle,3 candles, store result 
      CopyBuffer(iACDefinition,0,0,3,myPriceArray);
 
       // Get the value of the current candle
      float iACValue=myPriceArray[0];
      
      // if value is above the zero line
      if (iACValue>0)
      signal="buy";    

      // if value is below the zero line      
      if (iACValue<0)
      signal="sell";  
      
      // return signal to main module
      return signal;    
     
  }