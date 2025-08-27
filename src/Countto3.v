module Countto3(clk, rst, HundredmsTimeOut, ThreeSecTimeOut);  
   input clk, rst, HundredmsTimeOut; 
   output ThreeSecTimeOut; 
   reg ThreeSecTimeOut; 
   reg [3:0] count;

   always @ (posedge clk)
      begin
         if (rst == 1'b0) begin
            count <= 4'd0;
            ThreeSecTimeOut <= 1'b0;  
         end
         
         else begin
            if (HundredmsTimeOut == 1'b1) begin
                  count <= count + 1;
                  ThreeSecTimeOut <= 1'b0;
            end
        
            if (count == 4'd3) begin  
               count <= 4'b0000;
               ThreeSecTimeOut <= 1'b1; 
            end       
            else begin
               ThreeSecTimeOut <= 1'b0; 
            end
         end

      end
endmodule 
