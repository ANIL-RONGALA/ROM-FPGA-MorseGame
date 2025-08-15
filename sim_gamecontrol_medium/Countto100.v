module Countto100(clk, rst, enable, OnemsTimeOut, HundredmsTimeOut); 
   input clk, rst, enable, OnemsTimeOut;
   output HundredmsTimeOut; 
   reg HundredmsTimeOut; 
   reg [6:0] count; 

   always @ (posedge clk)
      begin
         if (rst == 1'b0 || enable == 1'b0) begin
            count <= 7'd0; 
            HundredmsTimeOut <= 1'b0;
         end
         
         else begin
            if (OnemsTimeOut == 1'b1) begin 
                  count <= count + 1; 
                  HundredmsTimeOut <= 1'b0;
            end

            if (count == 7'd2) begin    
                  count <= 7'd0;
                  HundredmsTimeOut <= 1'b1; 
            end
            else begin
               HundredmsTimeOut <= 1'b0; 
            end
 
         end

      end

endmodule 
