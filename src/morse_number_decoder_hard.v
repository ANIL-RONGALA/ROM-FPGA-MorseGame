module morse_number_decoder_hard(q, morse_number); 
   input [3:0] q;
   output [3:0] morse_number; 
   reg [3:0] morse_number; 

   always @ (q) begin
      case (q)
         4'b0000: begin morse_number = 4'b0000; end 
         4'b0001: begin morse_number = 4'b0001; end
         4'b0010: begin morse_number = 4'b0010; end 
         4'b0011: begin morse_number = 4'b0011; end
         4'b0100: begin morse_number = 4'b0100; end 
         4'b0101: begin morse_number = 4'b0101; end
         4'b0110: begin morse_number = 4'b0110; end 
         4'b0111: begin morse_number = 4'b0111; end
         4'b1000: begin morse_number = 4'b1000; end 
         4'b1001: begin morse_number = 4'b1001; end
         4'b1010: begin morse_number = 4'b1010; end 
         4'b1011: begin morse_number = 4'b1011; end
         4'b1100: begin morse_number = 4'b1100; end 
         4'b1101: begin morse_number = 4'b1101; end
         4'b1110: begin morse_number = 4'b1110; end 
         4'b1111: begin morse_number = 4'b0000; end
         default: begin morse_number = 4'b0000; end
      endcase
   end
endmodule
