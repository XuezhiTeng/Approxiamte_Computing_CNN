module wallace_16bit_tb;

	reg	[15:0]	A;
	reg	[15:0]	B;


	wire	[31:0]	Product_wall_16;
	
	initial
		begin
			A = 16'hFFFF;
			B = 16'hFFFF;
			#1500
			A = 16'h0000;
			B = 16'h0000;
			#1500
			A = 16'h5555;
			B = 16'h5555;
			#1500
			A = 16'h5555;
			B = 16'hAAAA;
			#1500
			B = 16'h5555;
			A = 16'hAAAA;
			#1500
			A = 16'h5555;
			B = 16'h5555;
			#1500
			A = 16'h00FF;
			B = 16'h00FF;
			#1500
			A = 16'hFF00;
			B = 16'h00FF;
			#1500
			A = 16'h00FF;
			B = 16'hFF00;
			#1500
			B = 16'hFF00;
			A = 16'hFF00;
		end

	// Run for 100ns
	//initial #300 $finish;
		
	//always #50 clk = ~clk; //clock cycle is 100ns

	// Dump ALL waveforms	
	initial
		begin
		$vcdplusfile("wallace_16bit.dump.vpd");
		$vcdpluson(0, wallace_16bit);
		end

	// Instantiate modules 
	wallace_16bit	wall_16		(.out(Product_wall_16),	.a(A),	.b(B));
	
endmodule
