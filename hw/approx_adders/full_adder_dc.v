module full_adder (a, b, s, cout, cin);
	
	input a;
	input b;
	input cin;
	output s;
	output cout;
	
	wire t1, t2, t3, t4, t5;
	
	XOR2X1 xor1(.A(a), .Y(t1), .B(b));
	XOR2X1 xor2(.A(t1), .Y(s), .B(cin));
	AND2X1 and1(.A(a), .B(b), .Y(t2));
	AND2X1 and2(.A(a), .B(cin), .Y(t3));
	AND2X1 and3(.A(b), .B(cin), .Y(t4));
	NOR3X1 nor1(.A(t2), .B(t3) , .C(t4), .Y(t5));
	INVX1 inv1(.A(t5), .Y(cout));
	
endmodule
