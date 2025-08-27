module gamecontrol2(clk, rst, morse_number, LoggedIn, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol, enable5_1, enable5_2, FiveSecTimeout_1, FiveSecTimeout_2);
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
   output enable5_1, enable5_2; 
   input FiveSecTimeout_1, FiveSecTimeout_2;

   reg reconfig, enable; 
   reg [3:0] number; 
   reg [3:0] score_ones; 
   reg [3:0] score_tens; 
   reg correct; 
   reg logout_from_gamecontrol; 
   reg enable5_1, enable5_2;

   parameter INITIAL = 0, RECONFIG = 1, WAIT1 = 2, START1 = 3, BUFFER1 = 4, START2 = 5, BUFFER2 = 6, WAIT2 = 7, COMPARE1 = 8, WAIT3 = 9, COMPARE2 = 10, DECISION = 11, GAMEOVER = 12;

   reg [3:0] state;
   reg [3:0] count_ones;
   reg [3:0] count_tens; 
   reg [3:0] user_entry; 
   reg [3:0] temp1; 
   reg [3:0] temp2; 
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
         enable5_1 <= 1'b0;
         enable5_2 <= 1'b0; 
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
               enable5_1 <= 1'b0;
               enable5_2 <= 1'b0; 
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
               enable5_1 <= 1'b1; 
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
               if (FiveSecTimeout_1 == 1'b1) begin
					   enable5_1 <= 1'b0; 
                  state <= START2; 
               end 
               else begin
                  state <= BUFFER1; 
               end
				end
//---------------------------------------------------------------
            START2: begin 
               enable5_2 <= 1'b1; 
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
               if (FiveSecTimeout_2 == 1'b1) begin
					   enable5_2 <= 1'b0;
                  state <= WAIT2; 
               end 
               else begin
                  state <= BUFFER2; 
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
					if (logout == 1'b1) begin
					   logout_from_gamecontrol <= 1'b1; 
						state <= INITIAL; 
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
               enable5_1 <= 1'b0;
               enable5_2 <= 1'b0; 
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
