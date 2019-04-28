module carry_generator (A, B, cout);
	input [3:0] A;
	input [3:0] B;
	output cout;
	
	wire g0, g1, g2, p1, p2;
	wire m1, c2, m2 , c3, m3;

	xor2$ xor1(p1, A[1], B[1]);  //p1
	xor2$ xor2(p2, A[2], B[2]);  //p2
	xor2$ xor3(p3, A[3], B[3]);  //p3
	and2$ and1(g0, A[0], B[0]);  //g0
	and2$ and2(g1, A[1], B[1]);  //g1
	and2$ and3(g2, A[2], B[2]);  //g2
	and2$ and4(g3, A[3], B[3]);  //g3
	
	and2$ and5(m1, p1, g0);  //m1 = p1 & g0
	or2$ or1(c2, m1, g1);	//c2 = m1 + g1
	and2$ and6(m2, c2, p2); //m2 = c2 & p2
	or2$ or2(c3, m2, g2);  //c3 = g2 + m2
	and2$ and7(m3, c3, p3); //m3 = c3 & p3
	or2$ or3(cout, m3, g3);  //cout = g3 + m3
	
endmodule