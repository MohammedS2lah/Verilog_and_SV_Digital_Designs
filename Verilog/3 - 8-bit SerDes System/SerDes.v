module SerDes
#(parameter WIDTH = 8, LOG_WIDTH = 3)
(
	input  wire 					clock_in, reset_n,	
	input  wire 			 		din_de,
	input  wire 					clock_out_ser,	
	input  wire [WIDTH - 1: 0] 		din_ser,
	
	output wire 					dout_ser,	
	output wire [WIDTH - 1: 0]		dout_de,
	output wire 					clock_out_de
);

	Serializer #(.WIDTH(WIDTH), .LOG_WIDTH(LOG_WIDTH))
	Serializer
	(
		.clock_in(clock_in), 		.reset_n(reset_n),
		.clock_out(clock_out_ser), 	.din(din_ser),
		.dout(dout_ser)
	);

	De_Serializer #(.WIDTH(WIDTH), .LOG_WIDTH(LOG_WIDTH))
	De_Serializer
	(
	.clock_in(clock_in), 	.reset_n(reset_n),	
	.din(din_de),			.dout(dout_de),
	.clock_out(clock_out_de)
	);
		
endmodule
