module signal_MUX_4bit(difficulty, signal1, signal2, signal3, signalout);
   input [1:0] difficulty; 
   input [3:0] signal1;
   input [3:0] signal2;
	input [3:0] signal3; 
   output [3:0] signalout; 
   reg [3:0] signalout; 

   always @ (difficulty, signal1, signal2) begin
      case (difficulty) 
         2'b00: begin 
            signalout = 4'b0000; 
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
            signalout = 4'b0000; 
         end
      endcase 
   end
endmodule