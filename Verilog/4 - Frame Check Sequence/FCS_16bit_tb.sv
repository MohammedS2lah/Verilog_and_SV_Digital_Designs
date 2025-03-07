module FCS_16bit_tb;

  // Parameters
  parameter CLOCK_PERIOD = 31.25; // 32 MHz clock = 31.25 ns period
  parameter DATA_WIDTH = 24;

  // Signals
  reg clock;
  reg reset_n;
  reg data;
  reg start;
  wire FCS;
  wire valid;
  wire [15:0] FCS_reg;

  // DUT (Device Under Test) Instantiation
  FCS_16bit uut (
    .clock(clock),
    .reset_n(reset_n),
    .data(data),
    .start(start),
    .FCS(FCS),
    .valid(valid),
    .FCS_reg(FCS_reg)
  );

  reg [DATA_WIDTH-1:0] MHR;
  reg [15:0] pre_calc_crc;

  // Clock generation (32 MHz)
  initial begin
    clock = 0;
    forever #(CLOCK_PERIOD / 2) clock = ~clock;
  end	
	
  integer i;

  initial begin

    clock = 0; reset_n = 0; start = 0; data = 0;
    MHR = 24'b0110_1010_0000_0000_0000_0010;
    pre_calc_crc = 16'b0111_1001_1110_0100;

    $display("### Your input is %b\n### Your pre crc is %b", MHR, pre_calc_crc);

    repeat (3) @(posedge clock);
    reset_n = 1;

    #(CLOCK_PERIOD/2);
    start = 1;

    @(posedge clock);
    for (i=0; i<DATA_WIDTH; i=i+1) begin
      data = MHR[i];
      @(posedge clock);		
    end
   
	start = 0;	

    $display ("### FCS output is %b", FCS_reg);
	
    if (FCS_reg==pre_calc_crc)
      $display ("#### Correct!!");
    else
      $display ("#### Error!");

    #(CLOCK_PERIOD*16) $stop;

  end

endmodule
