module Countto10(clk, rst, HundredmsTimeOut, OneSecTimeOut); 
   input clk, rst, HundredmsTimeOut; 
   output OneSecTimeOut; 
   reg OneSecTimeOut; 
   reg [3:0] count;

   always @ (posedge clk)
      begin
         if (rst == 1'b0) begin
            count <= 4'd0;
            OneSecTimeOut <= 1'b0;  
         end
         
         else begin
            if (HundredmsTimeOut == 1'b1) begin
                  count <= count + 1;
                  OneSecTimeOut <= 1'b0;
            end
        
            if (count == 4'd2) begin  
               count <= 4'b0000;
               OneSecTimeOut <= 1'b1; 
            end       
            else begin
               OneSecTimeOut <= 1'b0; 
            end
         end

      end
endmodule 
