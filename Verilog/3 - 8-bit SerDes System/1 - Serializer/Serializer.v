module Serializer
#(parameter WIDTH = 8, LOG_WIDTH = 3)
(
	input  wire 					clock_in, reset_n,
	input  wire 					clock_out,	
	input  wire [WIDTH - 1: 0] 		din,
	
	output reg 						dout
);

	reg [WIDTH - 1: 0] 		data_reg;
	reg [LOG_WIDTH : 0] 	counter;
	wire					Done;
	
	assign Done = (counter == WIDTH);
	
	always@(posedge clock_in or negedge reset_n)
		begin
			if(~reset_n)
				data_reg <= 0;
			
			else if (clock_out)
				begin
					data_reg <= din;
					//counter <= 0;
				end
		end
	
	always@(posedge clock_in or negedge reset_n)
		begin
			if(~reset_n)
				begin
					dout <= 0;
					counter <= 0;
				end
			
			else if (clock_out) counter <= 0;
			
			else if (counter < WIDTH && ~Done)
				begin
					dout <= data_reg[counter];
					counter <= counter + 1'b1;
				end	
			
			else	dout <= 0; 
		end	
	
endmodule
