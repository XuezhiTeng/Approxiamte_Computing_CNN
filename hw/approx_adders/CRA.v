//*********************************************
//   This is a Fixed Bounding Adder           *
//   This is a design of Xuezhi Teng          *
//*********************************************

module cra_adder (
	//Inputs	
	A,
	B,
//	cin,
	//Outputs
	Y,
	cout
	);
	
	//Listing all the ports
	input [15:0] A;
	input [15:0] B;
//	input cin;
	output [15:0] Y;
	output cout;
	
	wire co1, co2, co3, co4, co5, co6, co7, co8, co9, co10, co11, co12, co13, co14, co15;
	
	full_adder fa0 (A[0], B[0], Y[0], co1, 1'b0);
	full_adder fa1 (A[1], B[1], Y[1], co2, co1);
	full_adder fa2 (A[2], B[2], Y[2], co3, co2);
	full_adder fa3 (A[3], B[3], Y[3], co4, co3);
	full_adder fa4 (A[4], B[4], Y[4], co5, co4);
	full_adder fa5 (A[5], B[5], Y[5], co6, co5);
	full_adder fa6 (A[6], B[6], Y[6], co7, co6);
	full_adder fa7 (A[7], B[7], Y[7], co8, co7);
	full_adder fa8 (A[8], B[8], Y[8], co9, co8);
	full_adder fa9 (A[9], B[9], Y[9], co10, co9);
	full_adder fa10 (A[10], B[10], Y[10], co11, co10);
	full_adder fa11 (A[11], B[11], Y[11], co12, co11);
	full_adder fa12 (A[12], B[12], Y[12], co13, co12);
	full_adder fa13 (A[13], B[13], Y[13], co14, co13);
	full_adder fa14 (A[14], B[14], Y[14], co15, co14);
	full_adder fa15 (A[15], B[15], Y[15], cout, co15);

	

endmodule

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			