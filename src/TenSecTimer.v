module TenSecTimer(clk, rst, enable, TenSecTimeOut);
   input clk, rst, enable;
   output TenSecTimeOut; 

   wire HundredmsTimeOut; 
   wire OnemsTimeOut; 
   wire OneSec;
   wire TenSec; 

   OnemsTimer_lfsr OnemsTimer1(clk, rst, enable, OnemsTimeOut); 

   Countto100 Countto100one(clk, rst, enable, OnemsTimeOut, HundredmsTimeOut);

   Countto10 Countto10one(clk, rst, HundredmsTimeOut, OneSec); 
  
   Countto10 Countto10two(clk, rst, OneSec, TenSec); 
   
   assign TenSecTimeOut = TenSec; 
   
endmodule





