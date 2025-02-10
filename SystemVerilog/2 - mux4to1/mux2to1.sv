module mux2to1
#(parameter N = 32)
(
  input  logic [N-1:0] A,
  input  logic [N-1:0] B,
  input  logic         S,
  output logic [N-1:0] Y
);
  
  always_comb
    begin
      if(S)
	    Y = B;
      else
	    Y = A;
    end
  
endmodule
