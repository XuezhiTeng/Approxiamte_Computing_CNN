

module sum_generator (A, B, cin, Y);

	input [3:0] A;
	input [3:0] B;
	input cin;
	output [3:0] Y;
	
	wire co1, co2, co3;
	wire cout;
	
	full_adder fa0 (A[0], B[0], Y[0], co1, cin);
	full_adder fa1 (A[1], B[1], Y[1], co2, co1);
	full_adder fa2 (A[2], B[2], Y[2], co3, co2);
	full_adder fa3 (A[3], B[3], Y[3], cout, co3);
endmodule