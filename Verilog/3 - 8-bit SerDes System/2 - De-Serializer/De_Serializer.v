module De_Serializer
#(parameter WIDTH = 8, LOG_WIDTH = 3)
(
  input  wire                   clock_in, reset_n,	
  input  wire                   din,
	
  output reg 	[WIDTH - 1: 0]	dout,
  output reg                    clock_out
);

  reg [WIDTH - 1: 0]   data_reg;
  reg [LOG_WIDTH : 0]  counter;

  always@(posedge clock_in or negedge reset_n)
    begin
      if(~reset_n)	
        begin
          data_reg <= 0;
          counter <= 0;
          dout <= 0;
          clock_out <= 0;
        end
      else
        begin
          data_reg <= {data_reg[WIDTH - 2 : 0], din};
          counter <= counter + 1'b1;
					
          if (counter == WIDTH)
            begin
              dout <= data_reg;
              clock_out <= 1'b1;
              counter <= 0;
            end
					
          else
            clock_out <= 1'b0;
			
        end
    end
		
endmodule
