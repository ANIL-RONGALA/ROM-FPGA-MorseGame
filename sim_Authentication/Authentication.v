module Authentication(clk, rst, UserDigit, UserLoad, LoggedIn, PlayerID_from_pswd, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);
   input clk, rst, UserLoad; 
   input [3:0] UserDigit;
   output LoggedIn; 
   output [2:0] PlayerID_from_pswd;
   input logout_from_gamectrl; 
   output isGuest_from_PSWD, LoggedInLED; 

   wire matchedID;
   wire [2:0] PlayerID_internal_from_ID; 
   wire logout_from_pswd;  
   wire isGuest_from_IDCheck; 

   PlayerID_Authentication PlayerID_Authentication1(clk, rst, UserDigit, UserLoad, matchedID, PlayerID_internal_from_ID, logout_from_pswd, isGuest_from_IDCheck);

   PSWD_Authentication PSWD_Authentication1(clk, rst, matchedID, PlayerID_internal_from_ID, logout_from_pswd, isGuest_from_IDCheck, UserLoad, UserDigit, LoggedIn, PlayerID_from_pswd, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);





endmodule
