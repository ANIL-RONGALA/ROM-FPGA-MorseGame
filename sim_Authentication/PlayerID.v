//ECE6370
//Author: ANIL RONGALA, 3848
//PlayerID
//This module is a Player ID(4 digits) checking module. A RAM is connected to this module storing all the player's ID.
//If the player enters the correct password, this module sends a signal and an intenal player ID to the password 
//verifying module

module PlayerID(clk, rst, UserDigit, UserLoad, addr, data_rom_ID, matchedID, PlayerID_internal, logout, isGuest_from_IDCheck);

   input clk, rst, UserLoad;
   input [3:0] UserDigit; 
   output [4:0] addr; 
   input [15:0] data_rom_ID;
   output matchedID;
   output [2:0] PlayerID_internal; 
   input logout; 
   output isGuest_from_IDCheck; 

   reg [4:0] addr;
   reg matchedID; 
   reg [2:0] PlayerID_internal; 
   reg isGuest_from_IDCheck; 
   reg [15:0] EnteredID; 
   reg [15:0] ID_from_ROM; 
   
   parameter INITIAL = 0, DIGIT_ONE = 1, DIGIT_TWO = 2, DIGIT_THREE = 3, DIGIT_FOUR = 4, FETCHROM = 5, ROMCYC1 = 6, ROMCYC2 = 7, 
             ROMCATCH = 8, COMPARE = 9, STATUS_CHK = 10, GUEST_CHK = 11; 

   reg [3:0] state; 
   
   always @ (posedge clk) begin
      if (rst == 1'b0) begin
         addr <= 5'b00000;   
         matchedID <= 1'b0;
         PlayerID_internal <= 3'b000; 
         isGuest_from_IDCheck <= 1'b0;  
         EnteredID <= 16'd0; 
         ID_from_ROM <= 16'd0; 
         state <= INITIAL; 
      end
      else begin
         case(state)
            INITIAL: begin
               addr <= 5'b00000;   
               matchedID <= 1'b0;
               PlayerID_internal <= 3'b000; 
               isGuest_from_IDCheck <= 1'b0;  
               EnteredID <= 16'd0;
               ID_from_ROM <= 16'd0;  
               state <= DIGIT_ONE;
            end
//----------------------------------------------------------------
            DIGIT_ONE: begin
               if (UserLoad == 1'b1) begin
                  EnteredID[15:12] <= UserDigit;
                  state <= DIGIT_TWO;   
               end
               else begin
                  state <= DIGIT_ONE; 
               end          
            end
//----------------------------------------------------------------
            DIGIT_TWO: begin
               if (UserLoad == 1'b1) begin
                  EnteredID[11:8] <= UserDigit;
                  state <= DIGIT_THREE;   
               end
               else begin
                  state <= DIGIT_TWO; 
               end  
            end
//---------------------------------------------------------------- 
            DIGIT_THREE: begin
               if (UserLoad == 1'b1) begin
                  EnteredID[7:4] <= UserDigit;
                  state <= DIGIT_FOUR;   
               end
               else begin
                  state <= DIGIT_THREE; 
               end  
            end
//---------------------------------------------------------------- 
            DIGIT_FOUR: begin
               if (UserLoad == 1'b1) begin
                  EnteredID[3:0] <= UserDigit;
                  state <= FETCHROM;   
               end
               else begin
                  state <= DIGIT_FOUR; 
               end  
            end
//---------------------------------------------------------------- 
            FETCHROM: begin
               state <= ROMCYC1; 
            end
//---------------------------------------------------------------- 
            ROMCYC1: begin
               state <= ROMCYC2; 
            end
//---------------------------------------------------------------- 
            ROMCYC2: begin
               state <= ROMCATCH; 
            end
//----------------------------------------------------------------            
            ROMCATCH: begin
               ID_from_ROM <= data_rom_ID; 
               state <= COMPARE; 
            end
//---------------------------------------------------------------- 
            COMPARE: begin
               if (EnteredID == ID_from_ROM) begin
                  state <= GUEST_CHK; 
                  matchedID <= 1'b1;
                  PlayerID_internal <= addr; 
               end
               else begin
                  state <= STATUS_CHK; 
               end
            end
//---------------------------------------------------------------- 
            STATUS_CHK: begin
               if (ID_from_ROM == 16'b1111111111111111) begin
                  state <= INITIAL; 
               end
               else begin
                  addr <= addr + 1;
                  state <= FETCHROM;           
               end
            end
//----------------------------------------------------------------
            GUEST_CHK: begin
               if (ID_from_ROM == 16'b0101100101110011) begin
                  isGuest_from_IDCheck <= 1'b1;  
               end
               if (logout == 1'b1) begin
                  state <= INITIAL;
               end
               else begin
                  state <= GUEST_CHK;
               end
            end
//----------------------------------------------------------------  
            default: begin
               addr <= 5'b00000;   
               matchedID <= 1'b0;
               PlayerID_internal <= 3'b000; 
               isGuest_from_IDCheck <= 1'b0;  
               EnteredID <= 16'd0; 
               ID_from_ROM <= 16'd0; 
               state <= INITIAL;   
            end
//----------------------------------------------------------------
         endcase
      end
   end
endmodule
