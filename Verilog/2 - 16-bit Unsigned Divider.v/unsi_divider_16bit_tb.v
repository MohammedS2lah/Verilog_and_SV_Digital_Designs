module unsi_divider_16bit_tb;

    // Parameters
    parameter WIDTH = 16;
    parameter LOG_WIDTH = 4;

    // Inputs
    reg clock;
    reg reset_n;
    reg start_division;
    reg [WIDTH - 1:0] input_1; // Dividend
    reg [WIDTH - 1:0] input_2; // Divisor

    // Outputs
    wire [WIDTH - 1:0] output_Q; // Quotient
    wire [WIDTH - 1:0] remainder; // Remainder
    wire output_ready;
    wire error;

    // Instantiate the Unit Under Test (UUT)
    unsi_divider_16bit uut (
        .clock(clock),
        .reset_n(reset_n),
        .start_division(start_division),
        .input_1(input_1),
        .input_2(input_2),
        .output_Q(output_Q),
        .remainder(remainder),
        .output_ready(output_ready),
        .error(error)
    );

    // Clock generation
    always #5 clock = ~clock;

    initial begin
        // Initialize inputs
        clock = 0;
        reset_n = 0;
        start_division = 0;
        input_1 = 0;
        input_2 = 0;

        #10 reset_n = 1;

        // Test case 1: Normal division
        #10 input_1 = 16'd100; // Dividend = 100
        input_2 = 16'd5;       // Divisor = 5
        start_division = 1;
        #10 start_division = 0;

        // Wait for output_ready
        wait(output_ready);
        #10;
        $display("Test case 1: Quotient = %d, Remainder = %d", output_Q, remainder);

        // Test case 2: Division by zero (should trigger error)
        #10 input_1 = 16'd100; // Dividend = 100
        input_2 = 16'd0;       // Divisor = 0
        start_division = 1;
        #10 start_division = 0;

        wait(output_ready);
        #10;
        $display("Test case 2: Error = %b", error);

        // Test case 3: Dividend = 0
        #10 input_1 = 16'd0;   // Dividend = 0
        input_2 = 16'd5;       // Divisor = 5
        start_division = 1;
        #10 start_division = 0;

        wait(output_ready);
        #10;
        $display("Test case 3: Quotient = %d, Remainder = %d", output_Q, remainder);

        // Test case 4: Large numbers
        #10 input_1 = 16'hFFFF; // Dividend = 65535
        input_2 = 16'd256;      // Divisor = 256
        start_division = 1;
        #10 start_division = 0;

        wait(output_ready);
        #10;
        $display("Test case 4: Quotient = %d, Remainder = %d", output_Q, remainder);

        // Test case 5: Divisor > Dividend
        #10 input_1 = 16'd10;   // Dividend = 10
        input_2 = 16'd20;       // Divisor = 20
        start_division = 1;
        #10 start_division = 0;

        wait(output_ready);
        #10;
        $display("Test case 5: Quotient = %d, Remainder = %d", output_Q, remainder);

        // End simulation
        #10 $stop;
    end

endmodule
