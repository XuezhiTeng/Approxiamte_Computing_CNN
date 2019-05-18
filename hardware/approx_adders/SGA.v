//*********************************************
//   This is a Error Tolerant Adder 2         *
//   This is a design of Xuezhi Teng          *
//*********************************************

module eta2_adder (
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
	
//	reg gnd = 1'b0;
//	reg c1, c2, c3;
	assign Y[3:0] = A[3:0] + B[3:0] + cin;
	assign Y[7:4] = A[7:4] + B[7:4] ;
	assign Y[11:8] = A[11:8] + B[11:8];
	assign {cout, Y[15:12]} = A[15:12] + B[15:12];
	

endmodule

	

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			