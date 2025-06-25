//ECE6370
//Author: ANIL RONGALA, 3848
//PSWD
//

module PSWD(clk, rst, matchedID, ID_internal_from_ID, logout, isGuest_from_ID, UserLoad, UserDigit, addr, data_rom_PSWD, LoggedIn, PlayerID_internal, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);
 
   input clk, rst; 
   input matchedID; 
   input [2:0] ID_internal_from_ID;
   output logout;
   input isGuest_from_ID;
   input UserLoad; 
   input [3:0] UserDigit; 
   output [4:0] addr; 
   input [23:0] data_rom_PSWD; 
   output LoggedIn; 
   output [2:0] PlayerID_internal;
   input logout_from_gamectrl; 
   output isGuest_from_PSWD;  
   output LoggedInLED; 

   reg logout;
   reg [4:0] addr;
   reg LoggedIn; 
   reg [2:0] PlayerID_internal;
   reg isGuest_from_PSWD; 
   reg [23:0] EnteredPSWD;
   reg [23:0] PSWD_from_ROM;
   reg LoggedInLED; 

   parameter INITIAL = 0, DIGIT_ONE = 1, DIGIT_TWO = 2, DIGIT_THREE = 3, DIGIT_FOUR = 4, DIGIT_FIVE = 5, DIGIT_SIX = 6,
             FETCHROM = 7, ROMCYC1 = 8, ROMCYC2 = 9, ROMCATCH = 10, COMPARE = 11, PASSED = 12, WAIT1 = 13, WAIT2 = 14;  
   reg [3:0] state;
  // reg [1:0] count; 
   reg [2:0] count2; 
   reg [1:0] count3; 

   always @ (posedge clk) begin
      if (rst == 1'b0) begin
         logout <= 1'b0;
         addr <= 5'b00000;
         LoggedIn <= 1'b0;
         PlayerID_internal <= 3'b000;
         isGuest_from_PSWD <= 1'b0;
         EnteredPSWD <= 24'd0; 
         PSWD_from_ROM <= 24'd0; 
         LoggedInLED <= 1'b0; 
         count2 <= 3'b000;
         count3 <= 2'b00;
         state <= INITIAL; 
      end
      else begin
         case(state) 
            INITIAL: begin
               logout <= 1'b0;
               addr <= 5'b00000;
               LoggedIn <= 1'b0;
               PlayerID_internal <= 3'b000;
               isGuest_from_PSWD <= 1'b0;
               EnteredPSWD <= 24'd0; 
               PSWD_from_ROM <= 24'd0; 
               LoggedInLED <= 1'b0;
         //      count <= 2'b00; 
               count2 <= 3'b000;
               count3 <= 2'b00; 
               if (matchedID == 1'b1) begin 
                  state <= DIGIT_ONE;
               end
            end
//----------------------------------------------------------------
            DIGIT_ONE: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[23:20] <= UserDigit;
                  state <= DIGIT_TWO;   
               end
               else begin
                  state <= DIGIT_ONE; 
               end
            end
//----------------------------------------------------------------
            DIGIT_TWO: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[19:16] <= UserDigit;
                  state <= DIGIT_THREE;   
               end
               else begin
                  state <= DIGIT_TWO; 
               end  
            end
//----------------------------------------------------------------
            DIGIT_THREE: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[15:12] <= UserDigit;
                  state <= DIGIT_FOUR;   
               end
               else begin
                  state <= DIGIT_THREE; 
               end  
            end
//----------------------------------------------------------------
            DIGIT_FOUR: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[11:8] <= UserDigit;
                  state <= DIGIT_FIVE;   
               end
               else begin
                  state <= DIGIT_FOUR; 
               end  
            end
//----------------------------------------------------------------
            DIGIT_FIVE: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[7:4] <= UserDigit;
                  state <= DIGIT_SIX;   
               end
               else begin
                  state <= DIGIT_FIVE; 
               end  
            end
//----------------------------------------------------------------
            DIGIT_SIX: begin
               if (UserLoad == 1'b1) begin
                  EnteredPSWD[3:0] <= UserDigit;
                  state <= FETCHROM;   
               end
               else begin
                  state <= DIGIT_SIX; 
               end   
            end
//----------------------------------------------------------------
            FETCHROM: begin
               addr <= {2'b00, ID_internal_from_ID}; 
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
               PSWD_from_ROM <= data_rom_PSWD;
               count3 <= count3 + 1; 
               if (count3 == 2'b11) begin 
                  state <= COMPARE; 
               end
               end
//----------------------------------------------------------------
            COMPARE: begin
               if (EnteredPSWD == PSWD_from_ROM) begin
                  state <= PASSED; 
               end
               else begin
                  state <= DIGIT_ONE; 
               end
            end
//----------------------------------------------------------------
            PASSED: begin
               LoggedIn <= 1'b1;
               LoggedInLED <= 1'b1;  
               PlayerID_internal <= ID_internal_from_ID; 
               if (isGuest_from_ID == 1'b1) begin
                  isGuest_from_PSWD <= 1'b1; 
               end
               if (logout_from_gamectrl == 1'b1) begin
                  state <= WAIT1;
               end
               else begin 
                  state <= PASSED;
               end
            end
//----------------------------------------------------------------
            WAIT1: begin
               logout <= 1'b1;
               LoggedIn <= 1'b0;
               LoggedInLED <= 1'b0;  
               state <= WAIT2; 
            end
//----------------------------------------------------------------
            WAIT2: begin
               logout <= 1'b0;
               count2 <= count2 + 1;       
               if (count2 == 3'b101) begin
                  state <= INITIAL;   
               end 
            end
//----------------------------------------------------------------
            default: begin
               logout <= 1'b0;
               addr <= 5'b00000;
               LoggedIn <= 1'b0;
               PlayerID_internal <= 3'b000;
               isGuest_from_PSWD <= 1'b0;
               EnteredPSWD <= 24'd0; 
               PSWD_from_ROM <= 24'd0; 
               LoggedInLED <= 1'b0;
              // count <= 2'b00; 
               count2 <= 3'b000;
               state <= INITIAL;
            end
//----------------------------------------------------------------
         endcase
      end
   end
endmodule