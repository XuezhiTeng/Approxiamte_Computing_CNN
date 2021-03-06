module fullAdder (s, cout, a, b, cin);
	
	input a;
	input b;
	input cin;
	output s;
	output cout;
	
	wire t1, t2, t3, t4;
	
	xor2$ xor1(t1, a, b);
	xor2$ xor2(s, t1, cin);
	and2$ and1(t2, a, b);
	and2$ and2(t3, a, cin);
	and2$ and3(t4, b, cin);
	or3$ or1(cout, t2, t3 ,t4);
	
endmodule

module halfAdder (s, cout, a, b);

	input a;
	input b;
	output s;
	output cout;

	xor2$ xor1(s, a, b);
	and2$ and1(cout, a, b);

endmodule
