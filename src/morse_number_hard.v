module morse_number_hard(clk, rst, morse_number);  
   input clk, rst;
   output [3:0] morse_number;
   wire [3:0] q;   

   LFSR_number_generator LFSR_number_generator1(clk, rst, q); 
   morse_number_decoder_hard morse_number_decoder_hard1(q, morse_number); 

endmodule 
