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
	
	assign {cout, Y[15:0]} = A[15:0] + B[15:0];

	

endmodule

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			