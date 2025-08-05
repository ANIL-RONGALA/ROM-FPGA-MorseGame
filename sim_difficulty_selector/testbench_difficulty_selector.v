`timescale 1 ns/100 ps
module testbench_difficulty_selector();

   reg LoggedIn, rst; 
   reg [1:0] difficulty; 
   wire LoggedIn_easy, LoggedIn_medium, LoggedIn_hard; 

   difficulty_selector DUT_difficulty_selector(LoggedIn, difficulty, LoggedIn_easy, LoggedIn_medium, LoggedIn_hard, rst); 

   initial begin
      rst = 1'b1; 
      LoggedIn = 1'b0; 
      difficulty = 2'b00; 

      
      #50 rst = 1'b0;
      
      #25 rst = 1'b1;
     
      #50 LoggedIn = 1'b1; 
     
      #50 difficulty = 2'b01; 
      
      #50 difficulty = 2'b11; 
      
      #50 LoggedIn = 1'b0; 
     
      #50 difficulty = 2'b10; 
   end
endmodule
