// ECE6370
// Author: ANIL RONGALA, 3848
// Timer
// This module connects the digit timer of ones and tens digit. The input for the digit timer like reconfig, clk and rst are given through 
// this module and outputs generated like the timeout, ones and tens digit are provided to access controller and decode through this module.

module Timer_med(clk, rst, reconfig, ones, TenSecTimer, TimeOut); 
   input clk, rst, reconfig; 
   output [3:0] ones; 
   input TenSecTimer; 
   output TimeOut; 
   
   wire BorrowUpOnes; 
   //wire NoBorrowUpOnes; 
   //wire BorrowUpTens;  
 
   DigitTimer120 Ones(clk, rst, reconfig, ones, BorrowUpOnes, TenSecTimer, 1'b1, TimeOut);


endmodule