//ECE6370
//Author: ANIL RONGALA, 3848
//PSWD_Authentication
//

module PSWD_Authentication(clk, rst, matchedID, ID_internal_from_ID, logout, isGuest_from_ID, UserLoad, UserDigit, LoggedIn, PlayerID_internal, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);

   input clk, rst; 
   input matchedID; 
   input [2:0] ID_internal_from_ID;
   output logout;
   input isGuest_from_ID;
   input UserLoad; 
   input [3:0] UserDigit; 
   output LoggedIn; 
   output [2:0] PlayerID_internal;
   input logout_from_gamectrl; 
   output isGuest_from_PSWD;  
   output LoggedInLED; 

   wire [4:0] addr; 
   wire [23:0] data_rom_PSWD; 

   ROM_PSWD ROM_PSWD1(addr, clk, data_rom_PSWD); 
   PSWD PSWD1(clk, rst, matchedID, ID_internal_from_ID, logout, isGuest_from_ID, UserLoad, UserDigit, addr, data_rom_PSWD, LoggedIn, PlayerID_internal, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED); 

endmodule 