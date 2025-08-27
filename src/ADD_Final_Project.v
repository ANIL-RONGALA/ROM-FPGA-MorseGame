module ADD_Final_Project(clk, rst, UserDigit, UserLoad, LoggedInLED, difficulty, game_start, correct_final, 
logout, display0, display1, display2, display3, display4, ones_output, correctID);
   input clk, rst;
   input [3:0] UserDigit; 
   input UserLoad; 
   output LoggedInLED; 
   input [1:0] difficulty; 
   input game_start;
  // input load; 	
   output correct_final; 
   input logout; 
   output [6:0] display0; 
   output [6:0] display1; 
   output [6:0] display2;  
   output [6:0] display3; 
   output [6:0] display4; 
   output [6:0] ones_output;  
   output correctID; 

   wire LoggedIn; //Authentication to difficulty_selector
   wire [2:0] PlayerID_from_pswd; //Authentication to difficulty selector
   wire logout_from_gamectrl; //difficulty selector to Authentication
   wire isGuest_from_PSWD; // Authentication to 
   wire LoggedIn_easy; //difficulty selector to gamecontrol_easy
   wire LoggedIn_medium; //difficulty selector to gamecontrol_medium
   wire LoggedIn_hard; //difficulty selector to gamecontrol_hard  
   wire logout_easy; //gamecontrol to difficulty selector and nm_decoder
   wire reconfig; //gc_easy to timer100
   wire enable; //gc_easy to timer100
   wire timeout; // timer100 to gc_easy and nm_decoder
   wire [3:0] number; //gc_easy to nm_decoder
   wire [3:0] score_ones; //gc_easy to 
   wire [3:0] score_tens; //gc_easy to

   wire [3:0] ones; //timer100 to My7seg
	wire [3:0] ones_med; //timer120 to My7seg
	wire [3:0] ones_hard; 
	wire [3:0] ones_final; 
	
	wire reconfig_med; //timer120 to gc_med
	wire enable_med; //timer120 to gc_med
	wire timeout_med; //timer120 to gc_med
	wire logout_med; //gc_med to difficulty selector
	
	wire [3:0] number_med; //gc_easy to nm_decoder
   wire [3:0] score_ones_med; //gc_easy to 
   wire [3:0] score_tens_med; //gc_tens to
	wire [3:0] number_final; 
	
	wire correct;
	wire correct_med; 
	wire correct_hard; 
	
	wire reconfig_hard; 
	wire enable_hard; 
	wire timeout_hard;
	wire logout_hard; 
	wire [3:0] number_hard; 
   wire [3:0] score_ones_hard; 
   wire [3:0] score_tens_hard;
	wire timeout_final;

   button_shaper shaper1(UserLoad, Load_signal, clk, rst);
   button_shaper shaper2(game_start, start_signal, clk, rst);  
   button_shaper shaper3(logout, logout_signal, clk, rst); 	
	

   Authentication Authentication1(clk, rst, UserDigit, Load_signal, LoggedIn, PlayerID_from_pswd, 
	logout_from_difficulty_selector, isGuest_from_PSWD, LoggedInLED, correctID);

   difficulty_selector selector1(LoggedIn, difficulty, LoggedIn_easy, LoggedIn_medium, LoggedIn_hard, rst, 
	logout_easy, logout_med, logout_hard, logout_from_difficulty_selector, PlayerID_from_pswd);
 
   gamecontrol_easy gamecontrol1(clk, rst, LoggedIn_easy, start_signal, Load_signal, UserDigit, reconfig,
	enable, timeout, number, score_ones, score_tens, correct, logout_signal, logout_easy);

	gamecontrol_medium gamecontrol_med(clk, rst, LoggedIn_medium, start_signal, Load_signal, UserDigit,
	reconfig_med, enable_med, timeout_med, number_med, score_ones_med, score_tens_med, correct_med, logout_signal, logout_med);
	
	gamecontrol_hard gamecontrol_hard1(clk, rst, LoggedIn_hard, start_signal, Load_signal, UserDigit, reconfig_hard, 
	enable_hard, timeout_hard, number_hard, score_ones_hard, score_tens_hard, correct_hard, logout_signal, logout_hard);
	
   Timer100 Timer1(clk, rst, enable, reconfig, timeout, ones);
	Timer120 Timer2(clk, rst, enable_med, reconfig_med, timeout_med, ones_med); 
	Timer120 Timer3(clk, rst, enable_hard, reconfig_hard, timeout_hard, ones_hard);
	
	signal_MUX correct_select(difficulty, correct, correct_med, correct_hard, correct_final); 
	signal_MUX_4bit ones_select(difficulty, ones, ones_med, ones_hard, ones_final); 
	signal_MUX_4bit number_select(difficulty, number, number_med, number_hard, number_final); 
	signal_MUX timeout_select(difficulty, timeout, timeout_med, timeout_hard, timeout_final); 

	
   My7seg my7seg1(ones_final, ones_output); 
	
   number_morse_decoder decoder1(number_final, logout_easy, timeout, timeout_med, timeout_hard,
	rst, display0, display1, display2, display3, display4); 

endmodule


