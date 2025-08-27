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
   wire enable5_1, FiveSecTimeout_1, enable5_2, FiveSecTimeout_2; 

   morse_number morse_number_easy(clk, rst, morse_number);
   FiveSecTimer FiveSecTimer1(clk, rst, enable5_1, FiveSecTimeout_1); 
   FiveSecTimer FiveSecTimer2(clk, rst, enable5_2, FiveSecTimeout_2); 
   gamecontrol2 gamecontrol_med(clk, rst, morse_number, LoggedIn_medium, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol, enable5_1, enable5_2, FiveSecTimeout_1, FiveSecTimeout_2);
  
endmodule  
