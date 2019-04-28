//*********************************************
//   This is a Fixed Bounding Adder           *
//   This is a design of Xuezhi Teng          *
//*********************************************

module fba_adder (
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
	
	
	wire co1, co2, co3, co4, co5, co6, co7;
//	assign {cout, Y[15:8]} = A[15:8] + B[15:8];
	full_adder fa0 (A[8], B[8], Y[8], co1, 1'b0);
	full_adder fa1 (A[9], B[9], Y[9], co2, co1);
	full_adder fa2 (A[10], B[10], Y[10], co3, co2);
	full_adder fa3 (A[11], B[11], Y[11], co4, co3);
	full_adder fa4 (A[12], B[12], Y[12], co5, co4);
	full_adder fa5 (A[13], B[13], Y[13], co6, co5);
	full_adder fa6 (A[14], B[14], Y[14], co7, co6);
	full_adder fa7 (A[15], B[15], Y[15], cout, co7);
	
	
	
	assign Y[7:0] = (A[7] & B[7]) ? 8'b11111111 : 
					(A[6] & B[6]) ? {(A[7]   | B[7]  ),7'b1111111} :
					(A[5] & B[5]) ? {(A[7:6] | B[7:6]),6'b111111} :
					(A[4] & B[4]) ? {(A[7:5] | B[7:5]),5'b11111} :
					(A[3] & B[3]) ? {(A[7:4] | B[7:4]),4'b1111} :
					(A[2] & B[2]) ? {(A[7:3] | B[7:3]),3'b111} :
					(A[1] & B[1]) ? {(A[7:2] | B[7:2]),2'b11} :
					(A[0] & B[0]) ? {(A[7:1] | B[7:1]),1'b1} :
					A[7:0] | B[7:0];

	

endmodule

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			