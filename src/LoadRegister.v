// ECE6370
// Author: ANIL RONGALA, 3848
// LoadRegister
// This module acts as the load register to store the input entered by the users. Whenever the load signal to this module is high the input entered by the players is stored in this register.
// The load signal is controlled by the player 1 and player 2 load button 


module LoadRegister(D_in, D_out, clk, rst, Load);
   input [1:0] D_in;
   output [1:0] D_out;
   input clk, rst;
   input Load; 
   reg [1:0] D_out;  

   always@(posedge clk) begin
         if(rst == 1'b0) begin
               D_out <= 2'b00;
         end
         else begin
               if (Load == 1'b1) begin
                     D_out <= D_in; //normal operation after reset
               end
         end
   end

endmodule


