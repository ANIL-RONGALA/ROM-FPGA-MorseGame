// ECE6370
// Author: ANIL RONGALA, 3848
// Timer99
// Timer99 module connects the OneSecTimer to the Digit Timer. Signals received from access controller like enable, reconfig are send to 
// OneSecTimer and DigitTimer. Outputs from the Digit Timer, ones and tens are send to decoder and TimeOut is send to access controller 

module Timer120(clk, rst, enable, reconfig, TimeOut, ones);
   input clk, rst, enable, reconfig; 
   output TimeOut; 
   output [3:0] ones; 

   wire TenSecTimer; 

   TenSecTimer TenSecTimer1(clk, rst, enable, TenSecTimer); 
   Timer_med Timer_med1(clk, rst, reconfig, ones, TenSecTimer, TimeOut);    

endmodule