module mux4to1
#(parameter N = 32)
(
  input  logic [N-1:0] A,
  input  logic [N-1:0] B,
  input  logic [N-1:0] C,
  input  logic [N-1:0] D,  
  input  logic [1:0]   S,
  output logic [N-1:0] Y
);

  logic [N-1:0] mux1, mux2;
  
  mux2to1 #(.N(N)) mux2to1_i1
  (
  .S(S[0]),
  .Y(mux1),
  .*
  );

  mux2to1 #(.N(N)) mux2to1_i2
  (
  .S(S[0]),
  .Y(mux2),
  .A(C),
  .B(D)
  );

  mux2to1 #(.N(N)) mux2to1_i3
  (
  .S(S[1]),
  .Y(Y),
  .A(mux1),
  .B(mux2)
  );

endmodule
