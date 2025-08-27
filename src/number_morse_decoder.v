module number_morse_decoder(number, logout_from_gamecontrol, timeout, timeout_med, timeout_hard, rst, display0, display1, display2, display3, display4); 
   input [3:0] number;
   input logout_from_gamecontrol, timeout, timeout_med, timeout_hard, rst; 
   output [6:0] display0 = 7'b1111111; 
   output [6:0] display1 = 7'b1111111; 
   output [6:0] display2 = 7'b1111111; 
   output [6:0] display3 = 7'b1111111; 
   output [6:0] display4 = 7'b1111111;  
   reg [6:0] display0; 
   reg [6:0] display1; 
   reg [6:0] display2; 
   reg [6:0] display3; 
   reg [6:0] display4;


always @ (number, logout_from_gamecontrol, timeout, timeout_med, timeout_hard, rst) begin 
      if (rst == 1'b0 || timeout == 1'b1 || timeout_med == 1'b1 || timeout_hard == 1'b1) begin 
         display0 = 7'b1111111;
         display1 = 7'b1111111;
         display2 = 7'b1111111;
         display3 = 7'b1111111;
         display4 = 7'b1111111;
      end
      else begin
         case (number)
            4'b0000: begin //0
               display0 = 7'b1110111; display1 = 7'b1110111; display2 = 7'b1110111; display3 = 7'b1110111; display4 = 7'b1110111;
            end
            4'b0001: begin //1
               display0 = 7'b1110111; display1 = 7'b1110111; display2 = 7'b1110111; display3 = 7'b1110111; display4 = 7'b0100011;
            end
            4'b0010: begin //2
               display0 = 7'b1110111; display1 = 7'b1110111; display2 = 7'b1110111; display3 = 7'b0100011; display4 = 7'b0100011;
            end
            4'b0011: begin //3
               display0 = 7'b1110111; display1 = 7'b1110111; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b0100011;
            end
            4'b0100: begin //4
               display0 = 7'b1110111; display1 = 7'b0100011; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b0100011;
            end
            4'b0101: begin //5
               display0 = 7'b0100011; display1 = 7'b0100011; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b0100011;
            end
            4'b0110: begin //6
               display0 = 7'b0100011; display1 = 7'b0100011; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b1110111;
            end
            4'b0111: begin //7
               display0 = 7'b0100011; display1 = 7'b0100011; display2 = 7'b0100011; display3 = 7'b1110111; display4 = 7'b1110111;
            end
            4'b1000: begin //8
               display0 = 7'b0100011; display1 = 7'b0100011; display2 = 7'b1110111; display3 = 7'b1110111; display4 = 7'b1110111;
            end
            4'b1001: begin //9
               display0 = 7'b0100011; display1 = 7'b1110111; display2 = 7'b1110111; display3 = 7'b1110111; display4 = 7'b1110111;
            end
            4'b1010: begin //A
               display0 = 7'b1111111; display1 = 7'b1111111; display2 = 7'b1111111; display3 = 7'b1110111; display4 = 7'b0100011; 
            end
            4'b1011: begin //B
               display0 = 7'b1111111; display1 = 7'b0100011; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b1110111;
            end
            4'b1100: begin //C
               display0 = 7'b1111111; display1 = 7'b0100011; display2 = 7'b1110111; display3 = 7'b0100011; display4 = 7'b1110111;
            end
            4'b1101: begin //D
               display0 = 7'b1111111; display1 = 7'b1111111; display2 = 7'b0100011; display3 = 7'b0100011; display4 = 7'b1110111;
            end
            4'b1110: begin //E
               display0 = 7'b1111111; display1 = 7'b1111111; display2 = 7'b1111111; display3 = 7'b1111111; display4 = 7'b0100011;
            end
            4'b1111: begin //F
               display0 = 7'b1111111; display1 = 7'b1111111; display2 = 7'b1111111; display3 = 7'b1111111; display4 = 7'b1111111;
            end
            default: begin
               display0 = 7'b1111111; display1 = 7'b1111111; display2 = 7'b1111111; display3 = 7'b1111111; display4 = 7'b1111111;
            end
         endcase
      end
   end
endmodule 
