module DRUM_tb;

	reg	[15:0]	A;
	reg	[15:0]	B;


	wire	[31:0]	out;
	
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
		//$vcdplusfile("drum_16bit.dump.vpd");
		$vcdplusfile("drumk_M_N_s.dump.vpd");
		//$vcdpluson(0, DRUM4_16_u);
		$vcdpluson(0, DRUMk_M_N_s);
		end

	// Instantiate modules 
	//DRUM4_16_u drum4_16 (.r(out),.a(A),.b(B));
	DRUMk_M_N_s drum_kMN (.r(out),.a(A),.b(B));
endmodule
