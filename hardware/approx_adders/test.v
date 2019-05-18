module adder_test;

	reg [15:0] A;
	reg [15:0] B;
//	reg cin;
	wire [15:0] Y_fba;
	wire [15:0] Y_cra;
	wire [15:0] Y_eta2;
	wire cout_fba;
	wire cout_cra;
	wire cout_eta2;
	
	
	initial begin
	
	A = 16'h0000;
	B = 16'h0000;
//	cin = 0;
	//Y = 16'h0000;
	#10
	B = 16'hFFFF;
//	cin = 1;
	//Y = 16'FFFF;
	#10
	A = 16'hAA55;
	//Y = 16'h A9FF;
	//cout = 1
	#10
	A = 16'hAA05;
	B = 16'hFF04;
	//Y = 16'h A9F7
	#10
	A = 16'hAAFF;
	B = 16'h5501;
	
	
	end
	
	fba_adder adder_appr1 (.A(A), .B(B), .cout(cout_fba), .Y(Y_fba));
	eta2_adder adder_appr2 (.A(A), .B(B), .cout(cout_eta2), .Y(Y_eta2));
	cra_adder adder_accu (.A(A), .B(B), .cout(cout_cra), .Y(Y_cra));
	
	
	
endmodule
