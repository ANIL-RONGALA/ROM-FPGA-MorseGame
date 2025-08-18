module gamecontrol3(clk, rst, morse_number, LoggedIn, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol, enable3_1, enable3_2, enable3_3, ThreeSecTimeout_1, ThreeSecTimeout_2, ThreeSecTimeOut_3);
   input clk, rst; 
   input [3:0] morse_number;  
   input LoggedIn, game_start, load;
   input [3:0] user_input;  
   output reconfig, enable; 
   input timeout; 
   output [3:0] number; 
   output [3:0] score_ones; 
   output [3:0] score_tens; 
   output correct; 
   input logout; 
   output logout_from_gamecontrol; 
   output enable3_1, enable3_2, enable3_3; 
   input ThreeSecTimeout_1, ThreeSecTimeout_2, ThreeSecTimeout_3;

   reg reconfig, enable; 
   reg [3:0] number; 
   reg [3:0] score_ones; 
   reg [3:0] score_tens; 
   reg correct; 
   reg logout_from_gamecontrol; 
   reg enable3_1, enable3_2, enable3_3;

   parameter INITIAL = 0, RECONFIG = 1, WAIT1 = 2, START1 = 3, BUFFER1 = 4, START2 = 5, BUFFER2 = 6, START3 = 7, BUFFER3 = 8, WAIT2 = 9, COMPARE1 = 10, WAIT3 = 11, COMPARE2 = 12, WAIT4 = 13, COMPARE3 = 14, DECISION = 15, GAMEOVER = 16;

   reg [4:0] state;
   reg [3:0] count_ones;
   reg [3:0] count_tens; 
   reg [3:0] user_entry; 
   reg [3:0] temp1; 
   reg [3:0] temp2; 
   reg [3:0] temp3; 
   reg flag; 

   always @ (posedge clk) begin
      if (rst == 1'b0) begin
         reconfig <= 1'b0;
         enable <= 1'b0;
         number <= 4'b0000;
         score_ones <= 4'b0000;
         score_tens <= 4'b0000; 
         correct <= 1'b0;  
         logout_from_gamecontrol <= 1'b0; 
         enable3_1 <= 1'b0;
         enable3_2 <= 1'b0; 
         count_ones <= 4'b0000;
         count_tens <= 4'b0000;
         user_entry <= 4'b0000; 
         temp1 <= 4'b0000; 
         temp2 <= 4'b0000; 
         state <= INITIAL;  
         flag <= 1'b1;   
      end
      else begin
         case (state)
            INITIAL: begin
               reconfig <= 1'b0;
               enable <= 1'b0;
               number <= 4'b0000;
               score_ones <= 4'b0000;
               score_tens <= 4'b0000; 
               correct <= 1'b0;  
               logout_from_gamecontrol <= 1'b0; 
               enable3_1 <= 1'b0;
               enable3_2 <= 1'b0; 
               count_ones <= 4'b0000;
               count_tens <= 4'b0000;
               user_entry <= 4'b0000; 
               temp1 <= 4'b0000; 
               temp2 <= 4'b0000;  
               flag <= 1'b1;
				   if (LoggedIn == 1'b1) begin
				      state <= RECONFIG;
			      end	
            end
//----------------------------------------------------------------
            RECONFIG: begin
               reconfig <= 1'b1; 
               state <= WAIT1;
            end
//----------------------------------------------------------------
            WAIT1: begin
               reconfig <= 1'b0;
               if (game_start == 1'b1) begin
                  state <= START1; 
               end
               else begin 
                  state <= WAIT1; 
               end 
            end
//----------------------------------------------------------------
            START1: begin
               flag <= 1'b1; 
               enable <= 1'b1; 
               enable3_1 <= 1'b1; 
               number <= morse_number; 
               temp1 <= morse_number; 
					state <= BUFFER1; 
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
            end
//---------------------------------------------------------------
            BUFFER1: begin
				   if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (ThreeSecTimeout_1 == 1'b1) begin
					   enable3_1 <= 1'b0; 
                  state <= START2; 
               end 
               else begin
                  state <= BUFFER1; 
               end
				end
//---------------------------------------------------------------
            START2: begin 
               enable3_2 <= 1'b1; 
               number <= morse_number; 
               temp2 <= morse_number; 
					state <= BUFFER2; 
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
            end
//----------------------------------------------------------------
            BUFFER2: begin
				   if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (ThreeSecTimeout_2 == 1'b1) begin
					   enable3_2 <= 1'b0;
                  state <= START3; 
               end 
               else begin
                  state <= BUFFER2; 
               end
            end
//----------------------------------------------------------------
            START3: begin
               enable3_3 <= 1'b1; 
               number <= morse_number; 
               temp3 <= morse_number; 
					state <= BUFFER3;
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
            end
//----------------------------------------------------------------
            BUFFER3: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (ThreeSecTimeout_3 == 1'b1) begin
					   enable3_3 <= 1'b0;
                  state <= WAIT2; 
               end 
               else begin
                  state <= BUFFER3; 
               end
            end
//----------------------------------------------------------------
            WAIT2: begin  
				   number <= 4'b1111; 
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (load == 1'b1) begin
                  user_entry <= user_input; 
                  state <= COMPARE1; 
               end
            end
//----------------------------------------------------------------
            COMPARE1: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end 
               if (user_entry == temp1) begin
                  state <= WAIT3; 
               end
               else begin
                  flag <= 1'b0; 
                  state <= WAIT3; 
               end
            end
//----------------------------------------------------------------
            WAIT3: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (load == 1'b1) begin
                  user_entry <= user_input; 
                  state <= COMPARE2;  
               end
            end
//----------------------------------------------------------------
            COMPARE2: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end 
               if (user_entry == temp2) begin
                  state <= DECISION; 
               end
               else begin
                  flag <= 1'b0; 
                  state <= DECISION; 
               end
            end
//----------------------------------------------------------------
            WAIT4: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (load == 1'b1) begin
                  user_entry <= user_input; 
                  state <= COMPARE3;  
               end
            end
//----------------------------------------------------------------
            COMPARE3: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end 
               if (user_entry == temp3) begin
                  state <= DECISION; 
               end
               else begin
                  flag <= 1'b0; 
                  state <= DECISION; 
               end
            end
//----------------------------------------------------------------
            DECISION: begin
               if (timeout == 1'b1) begin
                  state <= GAMEOVER;
               end
               if (flag == 1'b1) begin
                  count_ones <= count_ones + 1; 
                  correct <= 1'b1; 
                  if (count_ones == 4'b1010) begin
                      count_tens <= count_tens + 1;
                      count_ones <= 4'b0000; 
                  end
                  state <= START1;
               end
               else begin
                  correct <= 1'b0; 
                  state <= START1; 
               end   
            end
//----------------------------------------------------------------
            GAMEOVER: begin
               enable <= 1'b0; 
               number <= 4'b0000;
               temp1 <= 4'b0000;
               temp2 <= 4'b0000;  
               score_ones <= count_ones;
               score_tens <= score_tens; 
               if (game_start == 1'b1) begin
                  state <= RECONFIG; 
               end
            end
//---------------------------------------------------------------- 
            default: begin
               reconfig <= 1'b0;
               enable <= 1'b0;
               number <= 4'b0000;
               score_ones <= 4'b0000;
               score_tens <= 4'b0000; 
               correct <= 1'b0;  
               logout_from_gamecontrol <= 1'b0; 
               enable3_1 <= 1'b0;
               enable3_2 <= 1'b0; 
               count_ones <= 4'b0000;
               count_tens <= 4'b0000;
               user_entry <= 4'b0000; 
               temp1 <= 4'b0000; 
               temp2 <= 4'b0000; 
               state <= INITIAL;  
               flag <= 1'b1; 
            end
         endcase
      end
   end

endmodule 
