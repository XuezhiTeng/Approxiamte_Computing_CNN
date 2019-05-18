module TOP;

   reg d, we;
   wire q, qb;   

   initial
      begin
         
         d = 0;
         we = 0;
         
         #1
            we = 1;
         #1
            we = 0;
         
         #1
            d = 1;
         #1
            we = 1;
         
         #1
            d = 0;
         #1
            d = 1;
         #1
            d = 0;
         #0.8
            we = 0;
         
      end
   
   // Run simulation for 15 ns.  
   initial #15 $finish;
   
   // Dump all waveforms to d_latch.dump
   initial
      begin
         $dumpfile ("d_latch.dump");
         $dumpvars (0, TOP);
      end // initial begin
   
   always @(posedge d)
      $strobe ("at time %0d, wen = %b", $time, we);
   
   d_latch latch1 (d, q, qb, we);
   
endmodule

//-----------------------------------------------------

// GATED D LATCH

//-----------------------------------------------------
// Functionality:
// pass d when wen is 1
// hold d when wen is 0
//
module d_latch (d, q, qbar, wen);
   input d, wen;
   output q, qbar;
   
   wire   dbar, r, s;
   
   inv1$ inv1 (dbar, d);
   nand2$ nand1 (s, d, wen),
          nand2 (r, dbar, wen),
   
          nand3 (q, s, qbar),
          nand4 (qbar, r, q);
   
endmodule


