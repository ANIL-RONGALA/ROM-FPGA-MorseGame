module gamecontrol_hard(clk, rst, LoggedIn_hard, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_hard);
   input clk, rst, LoggedIn_hard, game_start, load;
   input [3:0] user_input;  
   output reconfig, enable;  
   input timeout; 
   output [3:0] number; 
   output [3:0] score_ones; 
   output [3:0] score_tens; 
   output correct; 
   input logout; 
   output logout_hard; 

   wire [3:0] morse_number;
   wire enable3_1, ThreeSecTimeout_1, enable3_2, ThreeSecTimeout_2, enable3_3, ThreeSecTimeout_3; 

   morse_number_hard morse_number_hard(clk, rst, morse_number);
   ThreeSecTimer ThreeSecTimer1(clk, rst, enable3_1, ThreeSecTimeout_1); 
   ThreeSecTimer ThreeSecTimer2(clk, rst, enable3_2, ThreeSecTimeout_2); 
   ThreeSecTimer ThreeSecTimer3(clk, rst, enable3_3, ThreeSecTimeout_3); 
   gamecontrol3 gamecontrol_hard(clk, rst, morse_number, LoggedIn_hard, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_hard, enable3_1, enable3_2, enable3_3, ThreeSecTimeout_1, ThreeSecTimeout_2, ThreeSecTimeout_3);
  
endmodule  
