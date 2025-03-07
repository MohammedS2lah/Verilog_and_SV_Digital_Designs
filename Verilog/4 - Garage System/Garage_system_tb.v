module Garage_system_tb;

    // Parameters
    parameter MAX_NUM = 10;
    parameter LOG_MAX_NUM = 4;

    // Inputs
    reg clock;
    reg reset_n;
    reg car_entry_request;
    reg car_exit_request;

    // Outputs
    wire open_entry_door;
    wire open_exit_door;
    wire garage_is_complete;

    // Instantiate the Unit Under Test (UUT)
    Garage_system uut (
        .clock(clock),
        .reset_n(reset_n),
        .car_entry_request(car_entry_request),
        .car_exit_request(car_exit_request),
        .open_entry_door(open_entry_door),
        .open_exit_door(open_exit_door),
        .garage_is_complete(garage_is_complete)
    );

    // Clock generation
    always #5 clock = ~clock;

    // Testbench logic
    initial begin
        // Initialize inputs
        clock = 0;
        reset_n = 0;
        car_entry_request = 0;
        car_exit_request = 0;

        #10 reset_n = 1;

        // Test case 1: Single car entry
        #10 car_entry_request = 1;
        #10 car_entry_request = 0;

        // Test case 2: Multiple car entries until garage is full
        repeat (MAX_NUM) begin
            #10 car_entry_request = 1;
            #10 car_entry_request = 0;
        end

        // Test case 3: Attempt to enter when garage is full
        #10 car_entry_request = 1;
        #10 car_entry_request = 0;

        // Test case 4: Single car exit
        #10 car_exit_request = 1;
        #10 car_exit_request = 0;

        // Test case 5: Multiple car exits until garage is empty
        repeat (MAX_NUM - 1) begin
            #10 car_exit_request = 1;
            #10 car_exit_request = 0;
        end

        // Test case 6: Attempt to exit when garage is empty
        #10 car_exit_request = 1;
        #10 car_exit_request = 0;

        // Test case 7: Reset the system
        #10 reset_n = 0;
        #10 reset_n = 1;

        // End simulation
        #10 $stop;
    end
	
	    // Display results at the negative edge of the clock
    always @(negedge clock) begin
        $display("");
		$display("Time = %0t: Counter = %d, Garage Complete = %b, Open Entry Door = %b, Open Exit Door = %b", 
                 $time, uut.counter, garage_is_complete, open_entry_door, open_exit_door);
        $display("---------------------------------------------------------------------"); 
    end

endmodule
