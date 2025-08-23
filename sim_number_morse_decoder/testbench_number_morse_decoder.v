`timescale 1 ns/100 ps
module testbench_number_morse_decoder();
   reg [3:0] number;
   reg logout_from_gamecontrol, timeout, rst; 
   wire [6:0] display0; 
   wire [6:0] display1; 
   wire [6:0] display2; 
   wire [6:0] display3; 
   wire [6:0] display4;
 
   number_morse_decoder DUT_number_morse_decoder(number, logout_from_gamecontrol, timeout, rst, display0, display1, display2, display3, display4); 

   initial begin
      number = 4'b0000; 
      logout_from_gamecontrol = 1'b0;
      timeout = 1'b0; 
      rst = 1'b1; 
 
      #50 rst = 1'b0;
      #50 rst = 1'b1;
      
      #100 number = 4'b1001; 
      #100 number = 4'b1100; 
      #100 number = 4'b0101; 
      #100 number = 4'b0111; 
      
      #100 timeout = 1'b1; 

      #100 number = 4'b1110;
      #100 number = 4'b1000;

      #100 logout_from_gamecontrol = 1'b1; 
      #100 number = 4'b1111;
   end
endmodule 
