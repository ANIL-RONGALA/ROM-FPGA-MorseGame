module signal_MUX(difficulty, signal1, signal2, signal3, signalout);
   input [1:0] difficulty; 
   input signal1, signal2, signal3; 
   output signalout; 
   reg signalout; 

   always @ (difficulty, signal1, signal2) begin
      case (difficulty) 
         2'b00: begin
            signalout = 1'b0; 
         end
         2'b01: begin
            signalout = signal1; 
         end
         2'b10: begin
            signalout = signal2; 
         end
         2'b11: begin
            signalout = signal3; 
         end
         default: begin
            signalout = 1'b0; 
         end
      endcase 
   end
endmodule