module TOP;

	reg [15:0] A;
	reg [15:0] B;
	reg cin;
	wire [15:0] S;
	wire cout;	
	
	csa_16b csa(A,B,cin,S,cout);
	initial begin
	
	A = 16'h0000;
	B = 16'h0000;
	cin = 0;
	#20
	B = 16'hFFFF;
	cin = 1;
	#20
	A = 16'hAA55;
	#20
	A = 16'hAA05;
	B = 16'hFF04;

	end
	
	initial #100 $finish;

	//Dump all waveforms to csa_16b.dump
	initial begin
		$dumpfile ("csa.dump");
		$dumpvars (0, TOP);
	end
	
endmodule
