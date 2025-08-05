module difficulty_selector(LoggedIn, difficulty, LoggedIn_easy, LoggedIn_medium, LoggedIn_hard, rst, logout_easy, logout_medium, logout_hard, logout);

   input LoggedIn, rst; 
   input [1:0] difficulty; 
   output LoggedIn_easy, LoggedIn_medium, LoggedIn_hard; 
   reg LoggedIn_easy, LoggedIn_medium, LoggedIn_hard; 
   input logout_easy, logout_medium, logout_hard;
   output logout;
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
         if (logout_easy == 1'b1 || logout_medium == 1'b1 || logout_hard == 1'b1) begin
            logout = 1'b1;
         end
         else begin
            logout = 1'b0; 
         end
      end
   end
endmodule 
