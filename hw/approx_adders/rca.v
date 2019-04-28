module rca_3b(a,b,ci,s,co);
  input [2:0] a,b;
  input ci;
  output [2:0] s;
  output co;

  wire w1,w2;
  fa fa0(a[0],b[0],ci,s[0],w1);
  fa fa1(a[1],b[1],w1,s[1],w2);
  fa fa2(a[2],b[2],w2,s[2],co);

endmodule
