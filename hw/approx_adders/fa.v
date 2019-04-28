module fa(a,b,ci,s,co);
  input a,b,ci;
  output s,co;
  
  wire w1,w2,w3,w4,w5;

  XOR2X1 xor1(a,w1,b);
  XOR2X1 xor2(w1,s,ci);

  AND2X1 and1(a,b,w2);
  AND2X1 and2(b,ci,w3);
  AND2X1 and3(ci,a,w4);
  NOR3X1 or1(w2,w3,w4,w5);
  INVX1 inv1(w5,co);
endmodule 
