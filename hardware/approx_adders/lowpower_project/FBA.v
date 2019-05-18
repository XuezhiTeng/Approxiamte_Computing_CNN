//*********************************************
//   This is a Fixed Bounding Adder           *
//   This is a design of Xuezhi Teng          *
//*********************************************

module fba_adder (
	//Inputs	
	A,
	B,
	cin,
	//Outputs
	Y,
	cout
	);
	
	//Listing all the ports
	input [15:0] A;
	input [15:0] B;
	input cin;
	output [15:0] Y;
	output cout;
	
	assign {cout, Y[15:8]} = A[15:8] + B[15:8];
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

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			