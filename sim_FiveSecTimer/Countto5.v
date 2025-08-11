module Countto10(clk, rst, HundredmsTimeOut, FiveSecTimeOut); 
   input clk, rst, HundredmsTimeOut; 
   output FiveSecTimeOut; 
   reg FiveSecTimeOut; 
   reg [3:0] count;

   always @ (posedge clk)
      begin
         if (rst == 1'b0) begin
            count <= 4'd0;
            FiveSecTimeOut <= 1'b0;  
         end
         
         else begin
            if (HundredmsTimeOut == 1'b1) begin
                  count <= count + 1;
                  FiveSecTimeOut <= 1'b0;
            end
        
            if (count == 4'b0100) begin  
               count <= 4'b0000;
               FiveSecTimeOut <= 1'b1; 
            end       
            else begin
               FiveSecTimeOut <= 1'b0; 
            end
         end

      end
endmodule 
