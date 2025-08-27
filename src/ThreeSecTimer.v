module ThreeSecTimer(clk, rst, enable, ThreeSecTimeOut);
   input clk, rst, enable; 
   output ThreeSecTimeOut; 
   //reg ThreeSecTimeOut; 

   wire HundredmsTimeOut;
   wire OnemsTimeOut; 
   wire OneSec;
   wire ThreeSec; 

   OnemsTimer_lfsr OnemsTimer1(clk, rst, enable, OnemsTimeOut); 

   Countto100 Countto100one(clk, rst, enable, OnemsTimeOut, HundredmsTimeOut);

   Countto10 Countto10one(clk, rst, HundredmsTimeOut, OneSec); 
  
   Countto3 Countto3one(clk, rst, OneSec, ThreeSec); 
   
   assign ThreeSecTimeOut = ThreeSec; 
   
endmodule





