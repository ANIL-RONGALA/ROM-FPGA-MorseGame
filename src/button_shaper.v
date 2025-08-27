module button_shaper(Button_in, Button_out, clk, rst);
   input Button_in; 
   output Button_out;
   input clk, rst; 
   reg Button_out;
   parameter INIT = 0, PULSE = 1, WAIT = 2;
   reg [1:0] State, StateNext; 

   always @ (State, Button_in) begin
      case(State)
         INIT: 
            begin
               Button_out = 1'b0;
               if (Button_in == 1'b0)
                  StateNext = PULSE;
               else
                  StateNext = INIT; 
            end

         PULSE: 
            begin
               Button_out = 1'b1; 
               StateNext = WAIT; 
            end

         WAIT: 
            begin
               Button_out = 1'b0; 
               if (Button_in == 1'b1)
                  StateNext = INIT; 
               else 
                  StateNext = WAIT; 
            end

         default: 
            begin 
               Button_out = 1'b0;
               StateNext = INIT; 
            end
      endcase
   end

   always @ (posedge clk) begin
      if (rst == 1'b0)
         State <= INIT; 
      else
         State <= StateNext; 
   end
endmodule




