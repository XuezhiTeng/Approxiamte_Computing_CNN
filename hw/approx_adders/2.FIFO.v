//************************************************
//		Synchronous FIFO						 *
//		Designer: Xuezhi Teng					 *
//		Date:     04/13/2019					 *
//************************************************

module FIFO (
	clk,    				//Clock signal
 	rst,					//Reset signal
	din,				    //Input data
	dout,					//Output data
	empty,
	full,
	write,
	read
	);

//Parameters:
parameter 	DATA_WIDTH = 8;
parameter   ADDR_WIDTH = 2;
parameter	FIFO_DEPTH = 2**ADDR_WIDTH;

//Ports:
input	clk;
input 	rst;
input	write;
input   read;
input   [DATA_WIDTH-1:0]	din;
output	[DATA_WIDTH-1:0]    dout;
output  full, empty;

//Internal Variables:
reg	[DATA_WIDTH-1:0] array[FIFO_DEPTH-1:0];
reg [DATA_WIDTH-1:0] dout;
reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
reg [ADDR_WIDTH:0] state_counter;
wire full, empty;
wire wr_en, rd_en;

assign full = (state_counter == FIFO_DEPTH);
assign empty = (state_counter == 0);
assign wr_en = write && !full;
assign rd_en = read && !empty;

//Behivoir modeling
always @ (posedge clk)
begin
	if (!rst)
		wr_ptr <= 0;
	else if (wr_en)
		wr_ptr <= wr_ptr + 1;
end

always @ (posedge clk)
begin
	if (!rst)
		rd_ptr <= 0;
	else if (rd_en)
		rd_ptr <= rd_ptr + 1;
end

always @ (posedge clk)
begin
	if (!rst)
		dout <= 0;
	else if (rd_en)
		dout <= array[rd_ptr];
end

always @ (posedge clk)
begin
	if (wr_en || (write && read))
	array[wr_ptr] <= din;
end

always @ (posedge clk)
begin
	if (!rst)
		state_counter <= 0;
	else if (read && !write && (state_counter != 0))
		state_counter <= state_counter - 1;
		else if (!read && write && (state_counter != FIFO_DEPTH))
		state_counter <= state_counter + 1;
end


endmodule
