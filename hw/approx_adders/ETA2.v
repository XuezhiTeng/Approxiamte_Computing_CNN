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
	wire c1, c2, c3;
	
	sum_generator sum1 (.A(A[3:0]), .B(B[3:0]), .cin(cin), .Y(Y[3:0]));
	sum_generator sum2 (.A(A[7:4]), .B(B[7:4]), .cin(c1), .Y(Y[7:4]));
	sum_generator sum3 (.A(A[11:8]), .B(B[11:8]), .cin(c2), .Y(Y[11:8]));
	sum_generator sum4 (.A(A[15:12]), .B(B[15:12]), .cin(c3), .Y(Y[15:12]));
	carry_generator carry1 (.A(A[3:0]), .B(B[3:0]), .cout(c1));
	carry_generator carry2 (.A(A[7:4]), .B(B[7:4]), .cout(c2));
	carry_generator carry3 (.A(A[11:8]), .B(B[11:8]), .cout(c3));
	carry_generator carry4 (.A(A[15:12]), .B(B[15:12]), .cout(cout));
	

endmodule

module sum_generator (

	//Inputs:
	input [3:0] A,
	input [3:0] B,
	input cin,
	output [3:0] Y
	);
	
	assign Y = A + B + cin;
	
endmodule

module carry_generator (

	//Inputs:
	input [3:0] A,
	input [3:0] B,
	output cout
	);
	
	wire [3:0] C;
	
	assign {cout, C} = A + B;
	
endmodule
	

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			