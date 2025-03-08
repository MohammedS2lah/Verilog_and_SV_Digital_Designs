module absolute_subtraction_tb;

    // Inputs
    reg signed [3:0] i_absolute_subtraction_A;
    reg signed [3:0] i_absolute_subtraction_B;

    // Outputs
    wire [3:0] o_absolute_subtraction_value;

    // Instantiate the Unit Under Test (UUT)
    absolute_subtraction u_absolute_subtraction (
        .i_absolute_subtraction_A(i_absolute_subtraction_A),
        .i_absolute_subtraction_B(i_absolute_subtraction_B),
        .o_absolute_subtraction_value(o_absolute_subtraction_value)
    );

    // Testbench logic
    initial begin
        // Test case 1: A = 5, B = 3 (A - B = 2)
        i_absolute_subtraction_A = 4'b0101; // 5
        i_absolute_subtraction_B = 4'b0011; // 3
        #10;
        $display("A = %d, B = %d, |A - B| = %d", i_absolute_subtraction_A, i_absolute_subtraction_B, o_absolute_subtraction_value);

        // Test case 2: A = 3, B = 5 (A - B = -2, |A - B| = 2)
        i_absolute_subtraction_A = 4'b0011; // 3
        i_absolute_subtraction_B = 4'b0101; // 5
        #10;
        $display("A = %d, B = %d, |A - B| = %d", i_absolute_subtraction_A, i_absolute_subtraction_B, o_absolute_subtraction_value);

        // Test case 3: A = -4, B = -2 (A - B = -2, |A - B| = 2)
        i_absolute_subtraction_A = 4'b1100; // -4
        i_absolute_subtraction_B = 4'b1110; // -2
        #10;
        $display("A = %d, B = %d, |A - B| = %d", i_absolute_subtraction_A, i_absolute_subtraction_B, o_absolute_subtraction_value);

        // Test case 4: A = -3, B = 2 (A - B = -5, |A - B| = 5)
        i_absolute_subtraction_A = 4'b1101; // -3
        i_absolute_subtraction_B = 4'b0010; // 2
        #10;
        $display("A = %d, B = %d, |A - B| = %d", i_absolute_subtraction_A, i_absolute_subtraction_B, o_absolute_subtraction_value);

        // Test case 5: A = 7, B = -1 (A - B = 8, |A - B| = 8)
        i_absolute_subtraction_A = 4'b0111; // 7
        i_absolute_subtraction_B = 4'b1111; // -1
        #10;
        $display("A = %d, B = %d, |A - B| = %d", i_absolute_subtraction_A, i_absolute_subtraction_B, o_absolute_subtraction_value);
			
        // End simulation
        #10 $stop;
    end

endmodule
