module Authentication(clk, rst, UserDigit, UserLoad, LoggedIn, PlayerID_internal_from_pswd, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED, IDCorrect);
   input clk, rst, UserLoad; 
   input [3:0] UserDigit;
   output LoggedIn; 
   output [2:0] PlayerID_internal_from_pswd;
   input logout_from_gamectrl; 
   output isGuest_from_PSWD, LoggedInLED; 
	output IDCorrect; 

   wire matchedID;
   wire [2:0] PlayerID_internal_from_authentication; 
   wire logout;  
   wire isGuest_from_IDCheck;  

   PlayerID_Authentication PlayerID_Authentication1(clk, rst, UserDigit, UserLoad, matchedID, PlayerID_internal_from_authentication, logout, isGuest_from_IDCheck);

   PSWD_Authentication Pswd_authentication1(clk, rst, matchedID, PlayerID_internal_from_authentication, logout, isGuest_from_IDCheck, UserLoad, UserDigit, LoggedIn, PlayerID_internal_from_pswd, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);


   assign IDCorrect = matchedID; 


endmodule
