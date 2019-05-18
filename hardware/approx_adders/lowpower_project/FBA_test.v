module bfa_test;

	reg [15:0] A;
	reg [15:0] B;
	reg cin;
	wire [15:0] Y;
	wire cout;
	
	
	initial begin
	
	A = 16'h0000;
	B = 16'h0000;
	cin = 0;
	//Y = 16'h0000;
	#10
	B = 16'hFFFF;
	//Y = 16'FFFF;
	#10
	A = 16'hAA55;
	//Y = 16'h A9FF;
	//cout = 1
	
	
	end
	
	fba_adder adder (.A(A), .B(B), .cin(cin), .cout(cout), .Y(Y));
	
endmodule