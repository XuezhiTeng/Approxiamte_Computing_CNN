module fifo_test;

reg clk, rst, write, read;
reg [7:0] din;
wire [7:0] dout;
wire empty, full;

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		read = 1'b0;
		write = 1'b0;
		@(posedge clk);
		#1;
		@(posedge clk);
		#1;
		rst = 1'b1;
		write = 1'b1;
		#15
		din = 8'b10010100; //8'h94
		#40
		din = 8'b00001111; //8'h0F
		#40
		din = 8'b01010001; //8'h51
		#40
//		din_valid = 1'b0;
		din = 8'b00100100; //8'h24
		#40
//		read = 1'b1;
		din = 8'b01100111; //8'h67
		#40
		read = 1'b1;
		din = 8'b11110011; //8'hF3
		#40
		write = 1'b0;
	end
	
	always 
	#20 clk = ~clk;

	FIFO fifo1 (.clk(clk), .rst(rst), .din(din), .dout(dout), .write(write), .read(read), .empty(empty), .full(full));
endmodule