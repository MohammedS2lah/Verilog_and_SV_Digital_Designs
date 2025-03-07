`timescale 1ns / 1ps

module Serializer_tb;

    // Parameters
    parameter WIDTH = 8;
    parameter LOG_WIDTH = 3;

    // Inputs
    reg clock_in;
    reg clock_out;
    reg reset_n;
    reg [WIDTH - 1:0] din;

    // Outputs
    wire dout;

    // Instantiate the Unit Under Test (UUT)
    Serializer uut (
        .clock_in(clock_in),
        .clock_out(clock_out),
        .reset_n(reset_n),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clock_in = ~clock_in; // clock_in with 10ns period

    // Testbench logic
    initial begin
        // Initialize inputs
        clock_in = 0;
        clock_out = 0;
        reset_n = 0;
        din = 0;

        // Apply reset
        #20 reset_n = 1;

        // Test case 1: Serialize 8-bit data (din = 8'b10101010)
        #10 din = 8'b10101010;
        clock_out = 1;
        #10 clock_out = 0;
        #(WIDTH * 10); // Wait for serialization to complete
		$display("");
		$display("Time = %0t: clock_in = %b, clock_out = %b, reset_n = %b, din = %b, dout = %b",
                 $time, clock_in, clock_out, reset_n, din, dout);
				 
		#50		 
        // Test case 2: Serialize 8-bit data (din = 8'b11110000)
        #10 din = 8'b11110000;
        clock_out = 1; 
        #10 clock_out = 0; 
        #(WIDTH * 10); 
		$display("");
		$display("Time = %0t: clock_in = %b, clock_out = %b, reset_n = %b, din = %b, dout = %b",
                 $time, clock_in, clock_out, reset_n, din, dout);
				 
		#50			 
        // Test case 3: Reset during serialization
        #10 din = 8'b11001100;
        clock_out = 1; 
        #10 clock_out = 0; 
        #50 reset_n = 0; 
        #20 reset_n = 1; 
        #(WIDTH * 10);
		$display("");
		$display("Time = %0t: clock_in = %b, clock_out = %b, reset_n = %b, din = %b, dout = %b",
                 $time, clock_in, clock_out, reset_n, din, dout);
				 
		#50			 
        // Test case 4: Serialize 8-bit data (din = 8'b00001111)
        #10 din = 8'b00001111;
        clock_out = 0; 
        #10 clock_out = 1; 
		#10 clock_out = 0; 
        #(WIDTH * 10); 
		$display("");
		$display("Time = %0t: clock_in = %b, clock_out = %b, reset_n = %b, din = %b, dout = %b",
                 $time, clock_in, clock_out, reset_n, din, dout);
				 
		#50			 
        // End simulation
        #10 $stop;
    end

endmodule
