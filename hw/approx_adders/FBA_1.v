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
	
	reg [15:0] Y;
	reg cout;
	
	always @ (*)
	begin
	{cout, Y[15:8]} = {1'b0, A[15:8]} + {1'b0, B[15:8]};
	if (A[7] & B[7])
		Y[7:0] = 8'b11111111;
	else
		begin
		Y[7] = A[7] ^ B[7];
		if (A[6] & B[6])
			Y[6:0] = 7'b1111111;
		else
			begin
			Y[6] = A[6] ^ B[6];
			if (A[5] & B[5])
			Y[5:0] = 6'b111111;
		else
			begin
			Y[5] = A[5] ^ B[5];
			if (A[4] & B[4])
			Y[4:0] = 5'b11111;
		else
			begin
			Y[4] = A[4] ^ B[4];
			if (A[3] & B[3])
			Y[3:0] = 4'b1111;
		else
			begin
			Y[3] = A[3] ^ B[3];
			if (A[2] & B[2])
			Y[2:0] = 3'b111;
		else
			begin
			Y[2] = A[2] ^ B[2];
			if (A[1] & B[1])
			Y[1:0] = 2'b11;
		else
			begin
			Y[1] = A[1] ^ B[1];
			if ((A[0] & B[0] == 1) || (cin == 1))
			Y[0] = 1'b1;
			end
			end
			end
			end
			end
			end
			end
	end
endmodule

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			