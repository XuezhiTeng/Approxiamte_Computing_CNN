module carry_generator (A, B, cout);
	input [3:0] A;
	input [3:0] B;
	output cout;
	
	wire g0, g1, g2, g3, p1, p2, p3;
	wire m1, c2, m2 , c3, m3;

	XOR2X1 xor1(.Y(p1), .A(A[1]), .B(B[1]));  //p1
	XOR2X1 xor2(.Y(p2), .A(A[2]), .B(B[2]));  //p2
	XOR2X1 xor3(.Y(p3), .A(A[3]), .B(B[3]));  //p3
	AND2X1 and1(.Y(g0), .A(A[0]), .B(B[0]));  //g0
	AND2X1 and2(.Y(g1), .A(A[1]), .B(B[1]));  //g1
	AND2X1 and3(.Y(g2), .A(A[2]), .B(B[2]));  //g2
	AND2X1 and4(.Y(g3), .A(A[3]), .B(B[3]));  //g3
	
	AND2X1 and5(.Y(m1), .A(p1), .B(g0));  //m1 = p1 & g0
	AND2X1 or1(.Y(c2), .A(m1), .B(g1));	//c2 = m1 + g1
	AND2X1 and6(.Y(m2), .A(c2), .B(p2)); //m2 = c2 & p2
	OR2X1 or2(.Y(c3), .A(m2), .B(g2));  //c3 = g2 + m2
	AND2X1 and7(.Y(m3), .A(c3), .B(p3)); //m3 = c3 & p3
	OR2X1 or3(.Y(cout), .A(m3), .B(g3));  //cout = g3 + m3
	
endmodule