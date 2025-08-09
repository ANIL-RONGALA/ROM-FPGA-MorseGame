module OnemsTimer_lfsr(clk, rst, enable, OnemsTimeOut);
   input clk, rst, enable;
   output OnemsTimeOut;
   reg OnemsTimeOut;
   reg [15:0] LFSR;
   wire feedback = LFSR[15];

   always @ (posedge clk)
      begin 
         if (rst == 1'b0 || enable == 1'b0) begin
            LFSR <= 16'd65535; 
         end
         
         else begin
            if (LFSR == 16'd56172) begin
               LFSR <= 16'd65535; 
               OnemsTimeOut <= 1'b1; 
            end

            else begin
               LFSR[0] <= feedback;
               LFSR[1] <= LFSR[0];
               LFSR[2] <= LFSR[1] ^ feedback;
               LFSR[3] <= LFSR[2] ^ feedback;
               LFSR[4] <= LFSR[3];
               LFSR[5] <= LFSR[4] ^ feedback;
               LFSR[6] <= LFSR[5];
               LFSR[7] <= LFSR[6];
               LFSR[8] <= LFSR[7];
               LFSR[9] <= LFSR[8];
               LFSR[10] <= LFSR[9];
               LFSR[11] <= LFSR[10];
               LFSR[12] <= LFSR[11];
               LFSR[13] <= LFSR[12];
               LFSR[14] <= LFSR[13];
               LFSR[15] <= LFSR[14];

               OnemsTimeOut <= 1'b0; 
            end
         end
      end
endmodule 











