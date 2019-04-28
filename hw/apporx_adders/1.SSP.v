//************************************************
//		Synchronous Serial-Parallel Port		 *
//		Designer: Xuezhi Teng					 *
//		Date:     04/13/2019					 *
//************************************************

module SSP (
	clk,    				//Clock signal
 	rst,					//Reset signal
	din_valid,				//Input data valid
	din,					//Input data
	dout_valid,				//Output data valid
	dout					//Output data
	);

//Parameters:
parameter 	DIN_WIDTH  = 8;
parameter	FIFO_DEPTH = 2;
parameter   DOUT_WIDTH = (2**FIFO_DEPTH)*DIN_WIDTH;
integer i;
//Ports:
input	clk;
input 	rst;
input	din_valid;
input   [DIN_WIDTH-1:0]	din;
output	[DOUT_WIDTH-1:0] dout;
output	dout_valid;

//Internal Variables:
reg	[DIN_WIDTH-1:0] out[2**FIFO_DEPTH-1:0];
reg [DOUT_WIDTH-1:0] dout;
reg [FIFO_DEPTH-1:0] state_counter;
reg dout_valid;

//Behivoir modeling
always @ (posedge clk)
begin
	if (!rst)
	begin
		state_counter <= 0;
		dout_valid	<= 0;
	end
	else if (din_valid == 1)
		begin
			if (state_counter != ((2**FIFO_DEPTH)-1))
			begin
				out[state_counter] <= din;
				state_counter <= state_counter + 1;
				dout_valid <= 0;
			end
			else 
			begin
				out[state_counter] <= din;
				state_counter <= 0;
				dout_valid <= 1;
			end
		end
end

always @ (!rst or dout_valid)
begin
if (!rst)
dout = 0;
else if (dout_valid)
	begin
		dout = 0;
		for (i=0; i<(2**FIFO_DEPTH); i=i+1) 
		begin
		dout = dout + (out[i] << (8*i));
		end
	end
end

endmodule

		

	