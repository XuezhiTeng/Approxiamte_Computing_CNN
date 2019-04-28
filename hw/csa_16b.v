module csa_16b(a,b,ci,s,co);
  input [15:0] a,b;
  input ci;
  output [15:0] s;
  output co;

  wire c3,c6,c9,c12,c15;
  wire p53,g53,p86,g86,p119,g119,p1412,g1412;
  wire w1,w2,w3,w4;

  rca_3b rca0(a[2:0],b[2:0],ci,s[2:0],c3);

  rca_pg_3b rca1(a[5:3],b[5:3],c3,s[5:3],p53,g53);
  AND2X1 and1(p53,c3,w1);
  OR2X1 or1(w1,g53,c6);

  rca_pg_3b rca2(a[8:6],b[8:6],c6,s[8:6],p86,g86);
  AND2X1 and2(p86,c6,w2);
  OR2X1 or2(w2,g86,c9);

  rca_pg_3b rca3(a[11:9],b[11:9],c9,s[11:9],p119,g119);
  AND2X1 and3(p119,c9,w3);
  OR2X1 or3(w3,g119,c12);

  rca_pg_3b rca4(a[14:12],b[14:12],c12,s[14:12],p1412,g1412);
  AND2X1 and4(p1412,c12,w4);
  OR2X1 or4(w4,g1412,c15);

  fa fa0(a[15],b[15],c15,s[15],co);
endmodule
