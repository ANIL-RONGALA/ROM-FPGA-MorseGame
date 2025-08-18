module gamecontrol_medium(clk, rst, LoggedIn_medium, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol);
   input clk, rst, LoggedIn_medium, game_start, load;
   input [3:0] user_input;  
   output reconfig, enable; 
   input timeout; 
   output [3:0] number; 
   output [3:0] score_ones; 
   output [3:0] score_tens; 
   output correct; 
   input logout; 
   output logout_from_gamecontrol; 

   wire [3:0] morse_number;
   wire enable3_1, ThreeSecTimeout_1, enable3_2, ThreeSecTimeout_2, enable3_3, ThreeSecTimeout_3; 

   morse_number morse_number_easy(clk, rst, morse_number);
   ThreeSecTimer ThreeSecTimer1(clk, rst, enable3_1, ThreeSecTimeout_1); 
   ThreeSecTimer ThreeSecTimer2(clk, rst, enable3_2, ThreeSecTimeout_2); 
   ThreeSecTimer ThreeSecTimer3(clk, rst, enable3_3, ThreeSecTimeout_3); 
   gamecontrol2 gamecontrol_med(clk, rst, morse_number, LoggedIn_medium, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol, enable3_1, enable3_2, enable3_3, ThreeSecTimeout_1, ThreeSecTimeout_2, ThreeSecTimeout_3);
  
endmodule  
