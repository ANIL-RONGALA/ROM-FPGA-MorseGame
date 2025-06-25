module PlayerID_Authentication(clk, rst, UserDigit, UserLoad, matchedID, PlayerID_internal, logout, isGuest_from_IDCheck);

   input clk, rst, UserLoad;
   input [3:0] UserDigit; 
   output matchedID;
   output [2:0] PlayerID_internal; 
   input logout; 
   output isGuest_from_IDCheck; 
 
   wire [4:0] addr; 
   wire [15:0] data_rom_ID;

   PlayerID PlayerID1(clk, rst, UserDigit, UserLoad, addr, data_rom_ID, matchedID, PlayerID_internal, logout, isGuest_from_IDCheck); 
   ROM_PlayerID ROM_PlayerID1(addr, clk, data_rom_ID); 

endmodule
