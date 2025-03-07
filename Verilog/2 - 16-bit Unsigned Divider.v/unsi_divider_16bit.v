module unsi_divider_16bit  
#(parameter WIDTH = 16, LOG_WIDTH = 4)
(
  input wire                   clock,
  input wire                   reset_n,
  input wire                   start_division,
  input wire   [WIDTH - 1:0]   input_1,     // Dividend
  input wire   [WIDTH - 1:0]   input_2,     // Divisor
  output reg   [WIDTH - 1:0]   output_Q,    // Quotient
  output reg   [WIDTH - 1:0]   remainder,   // Remainder
  output reg                   output_ready,
  output wire                  error
);

  // Internal signals
  reg [WIDTH:0]       	acc, acc_next;           // Accumulator (1 bit wider)
  reg [WIDTH-1:0]     	quo, quo_next;           // Intermediate quotient
  reg [LOG_WIDTH - 1:0] 	counter;       			 // Counter to track the number of iterations
  reg [WIDTH-1:0]     	div;            		 // Copy of divisor

  // Error check
  assign error = (input_2 == 0);

  always @(posedge clock or negedge reset_n) begin
    if (!reset_n) 
      begin
        acc <= 0;
        acc_next <= 0;
        quo <= 0;
        quo_next <= 0;
        counter <= 0;
        div <= 0;
        output_Q <= 0;
        remainder <= 0;
        output_ready <= 0;
      end
		
    else if (start_division && ~error) 
      begin
        // Initialize the division process
        {acc, quo} <= {{WIDTH{1'b0}}, input_1, 1'b0};
        div <= input_2;         // Load divisor
        counter <= 0;       // Set counter to number of bits in dividend
        output_ready <= 0;      // Clear output ready
      end 
         
    else if (counter == WIDTH - 1) 
      begin
        output_Q <= quo_next; 
        remainder <= acc_next[WIDTH : 1];
        output_ready <= 1'b1 && ~error;
        counter <= 0;
      end 
        
    else 
      begin
        counter <= counter +1;
        acc <= acc_next;
	quo <= quo_next;
      end
    end
	
  always@(*)
    begin
      if (acc >= {1'b0, div}) 
        begin
          acc_next = acc - div;
          {acc_next, quo_next} = {acc_next[WIDTH-1:0], quo, 1'b1};
	end 
      else 
        begin
	  {acc_next, quo_next} = {acc, quo} << 1;
	end	
    end
		
endmodule
