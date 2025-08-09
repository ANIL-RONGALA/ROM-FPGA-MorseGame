module ADD_Final_Project(clk, rst, UserDigit, UserLoad, LoggedInLED, difficulty, load, correct, logout, display0, display1, display2, display3, display4, ones_output, correctID);
   input clk, rst;
   input [3:0] UserDigit; 
   input UserLoad; 
   output LoggedInLED; 
   input [1:0] difficulty; 
  // input game_start;
   input load; 	
   output correct; 
   input logout; 
   output [6:0] display0; 
   output [6:0] display1; 
   output [6:0] display2; 
   output [6:0] display3; 
   output [6:0] display4; 
   output [6:0] ones_output;  
   output correctID; 

   wire LoggedIn; //Authentication to difficulty_selector
   wire [2:0] PlayerID_internal; //Authentication to 
   wire logout_from_gamectrl; //difficulty selector to Authentication
   wire isGuest_from_PSWD; // Authentication to 
   wire LoggedIn_easy; //difficulty selector to gamecontrol_easy
  // wire LoggedIn_medium; //difficulty selector to 
  // wire LoggedIn_hard; //difficulty selector to 
   wire logout_easy; //gamecontrol to difficulty selector and nm_decoder
   wire reconfig; //gc_easy to timer100
   wire enable; //gc_easy to timer100
   wire timeout; // timer100 to gc_easy and nm_decoder
   wire [3:0] number; //gc_easy to nm_decoder
   wire [3:0] score_ones; //gc_easy to 
   wire [3:0] score_tens; //gc_tens to

   wire [3:0] ones; //timer100 to My7seg
  

   button_shaper shaper1(UserLoad, Load_signal, clk, rst);
   //button_shaper shaper2(game_start, start_signal, clk, rst);  
	button_shaper shaper3(load, morse_load_signal, clk, rst); 


   Authentication Authentication1(clk, rst, UserDigit, UserLoad, LoggedIn, PlayerID_internal, logout_from_difficulty_selector, isGuest_from_PSWD, LoggedInLED, correctID);

   difficulty_selector selector1(LoggedIn, difficulty, LoggedIn_easy, rst, logout_easy, logout_from_difficulty_selector);
 
   gamecontrol_easy gamecontrol1(clk, rst, LoggedIn_easy, Load_signal, morse_load_signal, UserDigit, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_easy);

   Timer100 Timer1(clk, rst, enable, reconfig, timeout, ones);

   My7seg my7seg1(ones, ones_output); 
   number_morse_decoder decoder1(number, logout_easy, timeout, rst, display0, display1, display2, display3, display4); 

endmodule

