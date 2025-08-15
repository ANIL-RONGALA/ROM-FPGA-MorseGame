`timescale 1 ns/100 ps
module testbench_gamecontrol_medium(); 
   reg clk, rst, LoggedIn_medium; 
   reg game_start, load; 
   reg [3:0] user_input;  
   wire reconfig, enable; 
   reg timeout; 
   wire [3:0] number; 
   wire [3:0] score_ones;
   wire [3:0] score_tens; 
   wire correct; 
   reg logout;
   wire logout_from_gamecontrol; 

   always begin
      clk = 1'b0;
      #10; 
      clk = 1'b1;
      #10;
   end

   gamecontrol_medium DUT_gamecontrol_medium(clk, rst, LoggedIn_medium, game_start, load, user_input, reconfig, enable, timeout, number, score_ones, score_tens, correct, logout, logout_from_gamecontrol);

   initial begin
      rst = 1'b1;
      LoggedIn_medium = 1'b0;
      game_start = 1'b0;
      load = 1'b0;  
      user_input = 4'b0000;
      timeout = 1'b0; 
      logout = 1'b0; 

      @(posedge clk);
      @(posedge clk);  
      #5 rst = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 rst = 1'b1;
      @(posedge clk);
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk);

      LoggedIn_medium = 1'b1; 
    
      @(posedge clk);
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk);

      #5 game_start = 1'b1;
      @(posedge clk);
      #5 game_start = 1'b0;

      @(posedge clk);
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk); 
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk); 
      @(posedge clk);

   end
endmodule 





