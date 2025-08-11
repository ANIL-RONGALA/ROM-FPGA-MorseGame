module LFSR_number_generator(clk, rst, q);
   input clk, rst; 
   output [3:0] q; 
   reg [3:0] q; 
   
   reg [15:0] LFSR = 16'b1111111111111111;
   wire feedback = LFSR[15];

   always @(posedge clk)
   begin
      if (rst == 1'b0) begin
         LFSR <= 16'b1111111111111111; 
         q <= 4'b0000; 
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
         q = {LFSR[6], LFSR[8], LFSR[11], LFSR[14]};
      end  
   end
endmodule

