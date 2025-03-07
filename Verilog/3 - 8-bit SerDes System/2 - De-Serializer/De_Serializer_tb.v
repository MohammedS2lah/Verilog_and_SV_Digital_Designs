`timescale 1ns / 1ps

module De_Serializer_tb;
  // Parameters
  parameter WIDTH = 8;
  parameter LOG_WIDTH = 3;

  // Signals
  reg clock_in;
  reg reset_n;
  reg din;
  wire [WIDTH - 1:0] dout;
  wire clock_out;

  // DUT (Device Under Test) Instantiation
  De_Serializer #(WIDTH, LOG_WIDTH) uut (
    .clock_in(clock_in),
    .reset_n(reset_n),
    .din(din),
    .dout(dout),
    .clock_out(clock_out)
  );

  // Clock generation
  initial begin
    clock_in = 0;
    forever #5 clock_in = ~clock_in; // 10ns clock period
  end

  // Test procedure
  initial begin
    // Initialize signals
    reset_n = 0;
    din = 0;

    // Apply reset
    #10 reset_n = 1;

    // Test multiple serial data inputs
    send_serial_data(8'b11010101); // First data set
    send_serial_data(8'b10101010); // Second data set
    send_serial_data(8'b11110000); // Third data set

    // Allow some time to observe outputs
    #50 $stop;
  end

  // Task to send serial data
  task send_serial_data(input [WIDTH-1:0] serial_data);
    integer i;
    begin
      for (i = WIDTH-1; i >= 0; i = i - 1) 
        begin
          if(clock_out) 
            begin
              #10;
              din = serial_data[i];
              #10;
            end
			
          else
            begin
              din = serial_data[i];
              #10; // Wait for one clock cycle
            end
      end
    end
  endtask

  // Monitor outputs
  always @(posedge clock_out) begin
    $display("At time %t, dout = %b, clock_out = %b", $time, dout, clock_out);
  end

endmodule
