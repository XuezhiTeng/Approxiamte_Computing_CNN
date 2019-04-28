module full_adder (a, b, s, cout, cin);
	
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
