// ECE6370
// Author: ANIL RONGALA, 3848
// DigitTimer
// This module is used to generate a 4-bit number for use in timer displays and also the timeout signal to determine when the game ends. 
module DigitTimer120(clk, rst, reconfig, number, BorrowUp, BorrowDn, NoBorrowUp, NoBorrowDn);
   input clk, rst, reconfig, BorrowDn, NoBorrowUp;
   output BorrowUp, NoBorrowDn; 
   reg BorrowUp, NoBorrowDn; 
   output [3:0] number; 
   reg [3:0] number; 
   always @ (posedge clk) begin
      if (rst == 1'b0) begin
         number <= 4'b0000; 
         BorrowUp <= 1'b0; 
         NoBorrowDn <= 1'b0; 
      end
      else begin
         BorrowUp <= 1'b0; 
         if (reconfig == 1'b1) begin
            number <= 4'b1100; 
            BorrowUp <= 1'b0; 
            NoBorrowDn <= 1'b0; 
         end
         else begin
            BorrowUp <= 1'b0; 
            if (BorrowDn == 1'b1) begin
               if (number == 4'b0000) begin
                  if (NoBorrowUp == 1'b0) begin
                     number <= 4'b1001;
                     BorrowUp <= 1'b1;    
                  end
                  else begin
                     NoBorrowDn <= 1'b1;
                  end
               end
               else if (number == 4'b0001) begin
                  if (NoBorrowUp == 1'b1) begin
                     NoBorrowDn <= 1'b1; 
                  end
                  number <= number - 1;
               end
               else begin
                  number <= number - 1;
               end
            end
         end
      end
  end
endmodule