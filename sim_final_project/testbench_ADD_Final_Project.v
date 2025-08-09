`timescale 1 ns/100 ps
module testbench_ADD_Final_Project(); 
   reg clk, rst, UserLoad;   
   reg [3:0] UserDigit;
   wire LoggedInLED;
   reg [1:0] difficulty; 
   reg load; 
   wire correct; 
   reg logout; 
   wire [6:0] display0; 
   wire [6:0] display1; 
   wire [6:0] display2; 
   wire [6:0] display3; 
   wire [6:0] display4;
   wire [6:0] ones_output; 
   wire correctID; 

   always begin
         clk = 1'b0;
         #10; 
         clk = 1'b1;
         #10;
   end
 
   ADD_Final_Project DUT_ADD_Final_Project(clk, rst, UserDigit, UserLoad, LoggedInLED, difficulty, load, correct, logout, display0, display1, display2, display3, display4, ones_output, correctID);

   initial begin 
      rst = 1'b1; 
      UserLoad = 1'b0; 
      UserDigit = 4'b0000; 
      difficulty = 2'b00; 
      load = 1'b0;
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

      #5 UserDigit = 4'b0101;  //ID_Digit 1
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b1001;   //ID_Digit 2
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b0111;   //ID_Digit 3
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b0011;   //ID_Digit 4
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
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
      @(posedge clk);
      @(posedge clk);
//------------------------------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b1010;    //pswd_Digit1
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b0000;    //pswd_Digit2
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
       @(posedge clk);
      #5 UserDigit = 4'b0100;    //pswd_Digit3
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
       @(posedge clk);
      #5 UserDigit = 4'b1010;    //pswd_Digit4
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b0101;    //pswd_Digit5
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b0100;    //pswd_Digit6
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
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
      #5 difficulty = 2'b01; 
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
      #5 UserLoad = 1'b1;
      @(posedge clk);
      #5 UserLoad = 1'b0; 
   end
endmodule