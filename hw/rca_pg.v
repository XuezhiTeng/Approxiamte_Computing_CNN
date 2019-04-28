module rca_pg_3b(a,b,ci,s,p,g);
  input [2:0] a,b;
  input ci;
  output [2:0] s;
  output p,g;

  wire w1,w2,w3,w4,w5,w6,w7,w8;
  wire p0,p1,p2,g0,g1,g2;

  //3-bit ripple carry
  fa fa0(a[0],b[0],ci,s[0],w1);
  fa fa1(a[1],b[1],w1,s[1],w2);
  fa fa2(a[2],b[2],w2,s[2],w3);

  //generate p and g
  XOR2X1 xor1(a[0],p0,b[0]);
  XOR2X1 xor2(a[1],p1,b[1]);
  XOR2X1 xor3(a[2],p2,b[2]);

  AND2X1 and1(a[0],b[0],g0);
  AND2X1 and2(a[1],b[1],g1);
  AND2X1 and3(a[2],b[2],g2);

  //generate group g
  NAND3X1 and4(p1,p2,g0,w4);
  INVX1 inv1(w4,w5);
  AND2X1 and5(p2,g1,w6);
  NOR3X1 or1(g2,w5,w6,w7);
  INVX1(w7,g);

  //generate group p
  NAND3X1 and6(p0,p1,p2,w8);
  INVX1 inv2(w8,p);
endmodule
