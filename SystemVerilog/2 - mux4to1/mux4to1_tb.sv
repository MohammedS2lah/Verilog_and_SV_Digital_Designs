module mux4to1_tb;

  // Parameters
  localparam N = 32;

  // Testbench signals
  logic [N-1:0] A, B, C, D;
  logic [1:0]   S;
  logic [N-1:0] Y;

  // Instantiate the DUT
  mux4to1 #(.N(N)) dut (.*);

  // Test stimulus
  initial begin
    // Test case 1
    A = 32'hAAAA_AAAA;
    B = 32'hBBBB_BBBB;
    C = 32'hCCCC_CCCC;
    D = 32'hDDDD_DDDD;
    S = 2'b00;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, A);

    // Test case 2
    S = 2'b01;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, B);

    // Test case 3
    S = 2'b10;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, C);

    // Test case 4
    S = 2'b11;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, D);

    $stop;
  end
endmodule
