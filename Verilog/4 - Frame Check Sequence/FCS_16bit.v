module FCS_16bit(
  input wire           clock, reset_n,
  input wire           data,
  input wire           start,

  output reg           FCS,
  output reg           valid,
  output wire [15 : 0] FCS_reg
);

  reg [15:0] r;
  reg [5:0]  counter;
	
  always@(posedge clock or negedge reset_n)
    begin
	  if(~reset_n)
	    begin
	      FCS <= 1'b0;
	      counter <= 6'b0;
	      r <= 16'b0;
	      valid <= 1'b0;
	    end
			
      else
	    begin 
		  if(start)
		    begin
			  counter <= 6'b0;
			
			  r <= {data ^ r[0], r[15:12], r[11] ^ data ^ r[0],
			        r[10:5], r[4] ^ data ^ r[0], r[3:1]};
			  /*
			  r[0] <= r[1];
			  r[1] <= r[2];
			  r[2] <= r[3];
			  r[3] <= r[4] ^ data ^ r[0];
			  r[4] <= r[5];
			  r[5] <= r[6];
			  r[6] <= r[7];
			  r[7] <= r[8];
			  r[8] <= r[9];
			  r[9] <= r[10];
			  r[10] <= r[11] ^ data ^ r[0];
			  r[11] <= r[12];
			  r[12] <= r[13];
			  r[13] <= r[14];
			  r[14] <= r[15];
			  r[15] <= data ^ r[0];	
			  */
			  valid <= 1'b0;
			end
					
          else if (counter < 6'd16)
		    begin
			  {r , FCS} <= {1'b0, r};
			  /*
			  FCS <= r[0];
			  r[0] <= r[1];
			  r[1] <= r[2];
			  r[2] <= r[3];
			  r[3] <= r[4];
			  r[4] <= r[5];
			  r[5] <= r[6];
			  r[6] <= r[7];
			  r[7] <= r[8];
			  r[8] <= r[9];
			  r[9] <= r[10];			  
			  r[10] <= r[11];
			  r[11] <= r[12];
			  r[12] <= r[13];
			  r[13] <= r[14];
			  r[14] <= r[15];
			  r[15] <= 1'b0;			  
			  */
			  counter <= counter + 1'b1;
			  
			  valid <= 1'b1;
            end
          else
            begin
			  valid <= 1'b0;
			  FCS <= 1'b0;
            end
          end
		end

  assign FCS_reg = r;
	
endmodule
