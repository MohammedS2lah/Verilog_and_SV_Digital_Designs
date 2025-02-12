module Garage_system
#(parameter MAX_NUM = 10, LOG_MAX_NUM = 4)
(
  input  wire    clock, reset_n,
  input  wire    car_entry_request,
  input  wire    car_exit_request,
	
  output reg     open_entry_door,
  output reg     open_exit_door,
  output wire    garage_is_complete
);

  reg [LOG_MAX_NUM - 1: 0] counter;
	
  always @(posedge clock or negedge reset_n)
    begin	
      if(~reset_n)
        begin
          counter <= 0;
          open_entry_door <= 1'b0;
          open_exit_door <= 1'b0;
        end
			
      else if(car_entry_request && ~garage_is_complete)
        begin	
	  counter <= counter + 1'b1;
          open_entry_door <= 1'b1;
          open_exit_door <= 1'b0;
        end
				
      else if(car_exit_request && counter != 0)	
        begin
          counter <= counter - 1'b1;
          open_exit_door <= 1'b1;
          open_entry_door <= 1'b0;
        end
      
      else
        begin
          open_entry_door <= 1'b0;
          open_exit_door <= 1'b0;					
        end
    end

  assign garage_is_complete = (counter == MAX_NUM);

endmodule
