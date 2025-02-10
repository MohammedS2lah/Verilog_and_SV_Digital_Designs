module mux2to1_tb;

  // Parameters
  localparam N = 32;

  // Testbench signals
  logic [N-1:0] A, B;
  logic S;
  logic [N-1:0] Y;

  /*
  // Instantiate the DUT
  mux2to1 #(.N(N)) dut (
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
  );
  */
  // Instantiate the DUT
  mux2to1 #(.N(N)) dut (.*);  
  
  // Test stimulus
  initial begin
    // Test case 1
    A = 32'hAAAA_AAAA;
    B = 32'h5555_5555;
    S = 1'b0;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, A);

    // Test case 2
    S = 1'b1;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, B);

    // Test case 3
    A = 32'h1234_5678;
    B = 32'h8765_4321;
    S = 1'b0;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, A);

    S = 1'b1;
    #10;
    $display("S=%b, Y=%h (Expected: %h)", S, Y, B);

    $stop;
  end
endmodule
