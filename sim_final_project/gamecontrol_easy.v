module gamecontrol_easy(clk, rst, LoggedIn_easy, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol);
    input clk, rst, LoggedIn_easy, game_start, load;
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

    morse_number_easy morse_number_easy1(clk, rst, morse_number);
    gamecontrol gamecontrol1(clk, rst, morse_number, LoggedIn_easy, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol); 


endmodule
