module eta2_adder (A, B, Y, cout);

	input [15:0] A;
	input [15:0] B;
//	input cin;
	output [15:0] Y;
	output cout;
	
	wire cin1, cin2, cin3;
	
	carry_generator cg0 (A[3:0], B[3:0], cin1);
	carry_generator cg1 (A[7:4], B[7:4], cin2);
	carry_generator cg2 (A[11:8], B[11:8], cin3);
	carry_generator cg3 (A[15:12], B[15:12], cout);
	
	sum_generator sg0 (A[3:0], B[3:0], 1'b0, Y[3:0]);
	sum_generator sg1 (A[7:4], B[7:4], cin1, Y[7:4]);
	sum_generator sg2 (A[11:8], B[11:8], cin2, Y[11:8]);
	sum_generator sg3 (A[15:12], B[15:12], cin3, Y[15:12]);
	
endmodule


	