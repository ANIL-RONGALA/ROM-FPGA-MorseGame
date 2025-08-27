module difficulty_selector(LoggedIn, difficulty, LoggedIn_easy, LoggedIn_medium, LoggedIn_hard, rst, logout_easy, logout_med, logout_hard, logout, PlayerID_from_pswd);

   input LoggedIn, rst; 
   input [1:0] difficulty; 
   output LoggedIn_easy;  
   reg LoggedIn_easy; 
	output LoggedIn_medium; 
	reg LoggedIn_medium; 
	output LoggedIn_hard; 
	reg LoggedIn_hard; 
   input logout_easy;
	input logout_med;  
	input logout_hard; 
   output logout;
	input PlayerID_from_pswd;  
   reg logout;

   always @ (LoggedIn, difficulty, rst) begin
      if (rst == 1'b0 || LoggedIn == 1'b0) begin
         LoggedIn_easy = 1'b0; 
			LoggedIn_medium = 1'b0;
			LoggedIn_hard = 1'b0; 
      end
      else begin
         if (LoggedIn == 1'b1) begin
            if (difficulty == 2'b00) begin
               LoggedIn_easy = 1'b0; 
					LoggedIn_medium = 1'b0; 
					LoggedIn_hard = 1'b0;
            end 
            else if (difficulty == 2'b01) begin
               LoggedIn_easy = 1'b1; 
					LoggedIn_medium = 1'b0; 
					LoggedIn_hard = 1'b0;
            end
            else if (difficulty == 2'b10) begin
               LoggedIn_easy = 1'b0;
				   LoggedIn_medium = 1'b1; 
				   LoggedIn_hard = 1'b0;	
            end
            else if (difficulty == 2'b11) begin
               LoggedIn_easy = 1'b0; 
					LoggedIn_medium = 1'b0;
				   LoggedIn_hard = 1'b1;	
            end
         end
         if (logout_easy == 1'b1 || logout_med == 1'b1 || logout_hard == 1'b1) begin
            logout = 1'b1;
         end
         else begin
            logout = 1'b0; 
         end
      end
   end
endmodule 
