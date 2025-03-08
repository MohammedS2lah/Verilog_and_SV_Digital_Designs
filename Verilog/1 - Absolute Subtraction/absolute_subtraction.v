module absolute_subtraction(
  input wire signed [3:0] i_absolute_subtraction_A, 
  input wire signed [3:0] i_absolute_subtraction_B, 

  output reg signed [3:0] o_absolute_subtraction_value
);

  reg  [3:0] res;

  always @(*)
    begin
      res = i_absolute_subtraction_A - i_absolute_subtraction_B;
      
      if(res[3])
        o_absolute_subtraction_value = i_absolute_subtraction_B - i_absolute_subtraction_A;
      else
        o_absolute_subtraction_value = res;
    end

endmodule
