module bfa_test;

	reg [15:0] A;
	reg [15:0] B;
	reg cin;
	wire [15:0] Y_fba;
	wire [15:0] Y_cra;;
	wire cout_fba;
	wire cout_cra;
	
	
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
	#10
	A = 16'hAA05;
	B = 16'hFF04;
	//Y = 16'h A9F7
	
	
	end
	
	fba_adder adder_appr (.A(A), .B(B), .cin(cin), .cout(cout_fba), .Y(Y_fba));
	cra_adder adder_accu (.A(A), .B(B), .cin(cin), .cout(cout_cra), .Y(Y_cra));
	
endmodule
