module gamecontrol(clk, rst, morse_number, LoggedIn, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol); 
   input clk, rst;
   input [3:0] morse_number; 
   input LoggedIn, game_start;
   input load; 
   input [3:0] user_input;  
   output reconfig, enable;
   input timeout; 
   output [3:0] number; 
   output [3:0] score_ones; 
   output [3:0] score_tens;
   output correct; 
   input logout; 
   output logout_from_gamecontrol; 
   reg reconfig, enable; 
   reg [3:0] number; 
   reg [3:0] score_ones; 
   reg [3:0] score_tens;
   reg correct; 
   reg logout_from_gamecontrol; 
   parameter INITIAL = 0, RECONFIG = 1, WAIT1 = 2, START = 3, WAIT2 = 4, COMPARE = 5, GAME_OVER = 6;

   reg [2:0] state;
   reg [3:0] count_ones;
   reg [3:0] count_tens; 
   reg [3:0] user_entry; 

   always @ (posedge clk) begin
      if (rst == 1'b0) begin
         reconfig <= 1'b0;
         enable <= 1'b0; 
         number <= 4'b0000;
         score_ones <= 4'b0000;
         score_tens <= 4'b0000;  
         count_ones <= 4'b0000;
         count_tens <= 4'b0000;
         user_entry <= 4'b0000; 
         logout_from_gamecontrol <= 1'b0; 
         correct <= 1'b0; 
         state <= INITIAL; 
      end
      else begin
         case(state)
            INITIAL: begin
               reconfig <= 1'b0;
               enable <= 1'b0; 
               number <= 4'b0000;
               score_ones <= 4'b0000;
               score_tens <= 4'b0000;  
               count_ones <= 4'b0000;
               count_tens <= 4'b0000;
               logout_from_gamecontrol <= 1'b0; 
               correct <= 1'b0; 
               if (LoggedIn == 1'b1) begin
                   state <= RECONFIG; 
               end
               else begin
                  state <= INITIAL; 
               end
            end
//----------------------------------
            RECONFIG: begin
               reconfig <= 1'b1;
               state <= WAIT1; 
            end
//----------------------------------
            WAIT1: begin
               reconfig <= 1'b0;
               if (game_start == 1'b1) begin
                  state <= START;
               end
               else begin
                  state <= WAIT1; 
               end
            end
//----------------------------------
            START: begin
               enable <= 1'b1; 
               number <= morse_number;
               state <= WAIT2;  
            end
//----------------------------------
            WAIT2: begin
               if (timeout == 1'b1) begin
                  state <= GAME_OVER; 
               end
               if (load == 1'b1) begin
                  user_entry <= user_input; 
                  state <= COMPARE; 
               end
            end
//----------------------------------
            COMPARE: begin
               if (timeout == 1'b1) begin
                  state <= GAME_OVER; 
               end
               if (number == user_entry) begin
                  count_ones <= count_ones + 1;
                  correct <= 1'b1; 
                  if (count_ones == 4'b1010) begin
                      count_tens <= count_tens + 1;
                      count_ones <= 4'b0000; 
                  end
                  state <= START;
               end
               else begin
                  correct <= 1'b0; 
                  state <= START; 
               end
            end
//----------------------------------
            GAME_OVER: begin
               enable <= 1'b0; 
               number <= 4'b0000; 
               score_ones <= count_ones; 
               score_tens <= count_tens; 
               if (logout == 1'b1) begin
                  state <= INITIAL; 
                  logout_from_gamecontrol <= 1'b1; 
               end
               if (game_start == 1'b1) begin
                  state <= RECONFIG; 
               end
            end
//----------------------------------
            default: begin
               reconfig <= 1'b0;
               enable <= 1'b0; 
               number <= 4'b0000;
               score_ones <= 4'b0000;
               score_tens <= 4'b0000;  
               count_ones <= 4'b0000;
               count_tens <= 4'b0000;
               user_entry <= 4'b0000; 
               logout_from_gamecontrol <= 1'b0; 
               state <= INITIAL;
            end
//----------------------------------
         endcase
      end
   end
endmodule 
