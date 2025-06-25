`timescale 1 ns/100 ps
module testbench_Authentication();

   reg clk, rst;
   reg [3:0] UserDigit; 
   reg UserLoad; 
   wire LoggedIn; 
   wire [2:0] PlayerID_from_pswd;
   reg logout_from_gamectrl; 
   wire isGuest_from_PSWD, LoggedInLED;

   always begin
         clk = 1'b0;
         #10; 
         clk = 1'b1; 
         #10;
   end

   Authentication DUT_Authentication(clk, rst, UserDigit, UserLoad, LoggedIn, PlayerID_from_pswd, logout_from_gamectrl, isGuest_from_PSWD, LoggedInLED);

   initial begin 
      rst = 1'b1; 
      UserLoad = 1'b0;
      UserDigit = 4'b0000; 
      logout_from_gamectrl = 1'b0;

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
      #5 logout_from_gamectrl = 1'b1;
      @(posedge clk);
      #5 logout_from_gamectrl = 1'b0;
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

//------------------------------------------------------check1 over
      #5 UserDigit = 4'b0110;  //ID_Digit 1
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b0001;   //ID_Digit 2
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b1001;   //ID_Digit 3
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-------------------------------------------
      #5 UserDigit = 4'b0111;   //ID_Digit 4
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
      #5 UserDigit = 4'b1000;    //pswd_Digit1
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b1001;    //pswd_Digit2
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
       @(posedge clk);
      #5 UserDigit = 4'b0101;    //pswd_Digit3
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
       @(posedge clk);
      #5 UserDigit = 4'b0111;    //pswd_Digit4
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
       @(posedge clk);
      #5 UserDigit = 4'b1101;    //pswd_Digit5
      @(posedge clk);
      @(posedge clk);
      #5 UserLoad = 1'b1; 
      @(posedge clk);
      #5 UserLoad = 1'b0; 
      @(posedge clk);
      @(posedge clk);
//-----------------------------------------------
      @(posedge clk);
      #5 UserDigit = 4'b0001;    //pswd_Digit6
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
      #5 logout_from_gamectrl = 1'b1;
      @(posedge clk);
      #5 logout_from_gamectrl = 1'b0;

   end
endmodule  

