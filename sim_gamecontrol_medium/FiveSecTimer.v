module FiveSecTimer(clk, rst, enable, FiveSecTimeOut);
   input clk, rst, enable;
   output FiveSecTimeOut; 
   reg FiveSecTimeOut; 

   wire HundredmsTimeOut;
   wire OnemsTimeOut; 
   wire OneSec;
   wire FiveSec; 

   OnemsTimer_lfsr OnemsTimer1(clk, rst, enable, OnemsTimeOut); 

   Countto100 Countto100one(clk, rst, enable, OnemsTimeOut, HundredmsTimeOut);

   Countto10 Countto10one(clk, rst, HundredmsTimeOut, OneSec); 
  
   Countto5 Countto5one(clk, rst, OneSec, FiveSec); 
   
   assign FiveSecTimeOut = FiveSec; 
   
endmodule





