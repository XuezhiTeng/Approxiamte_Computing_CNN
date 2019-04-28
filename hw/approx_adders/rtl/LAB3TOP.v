/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP4
// Date      : Wed Nov 28 18:23:38 2018
/////////////////////////////////////////////////////////////


module Master ( rst_i, clk_i, mem_req, memoryRead, memoryWrite, addressBus, 
        dat_i, ack_i, adr_o, dat_o, we_o, stb_o, cyc_o, taga_o, dataBus );
  input [25:0] addressBus;
  input [31:0] dat_i;
  output [25:0] adr_o;
  output [31:0] dat_o;
  inout [31:0] dataBus;
  input rst_i, clk_i, mem_req, memoryRead, memoryWrite, ack_i;
  output we_o, stb_o, cyc_o, taga_o;
  wire   mem_req, N44, N45, N59, N60, N77, n44, n2, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n39, n40, n41, n42, n43, n45, n46, n47, n58, n59, n60, n61, n62, n63,
         n64;
  wire   [31:0] dat_i_temp;
  wire   [1:0] state;
  wire   [1:0] next_state;
  tri   [31:0] dataBus;
  assign adr_o[25] = addressBus[25];
  assign adr_o[24] = addressBus[24];
  assign adr_o[23] = addressBus[23];
  assign adr_o[22] = addressBus[22];
  assign adr_o[21] = addressBus[21];
  assign adr_o[20] = addressBus[20];
  assign adr_o[19] = addressBus[19];
  assign adr_o[18] = addressBus[18];
  assign adr_o[17] = addressBus[17];
  assign adr_o[16] = addressBus[16];
  assign adr_o[15] = addressBus[15];
  assign adr_o[14] = addressBus[14];
  assign adr_o[13] = addressBus[13];
  assign adr_o[12] = addressBus[12];
  assign adr_o[11] = addressBus[11];
  assign adr_o[10] = addressBus[10];
  assign adr_o[9] = addressBus[9];
  assign adr_o[8] = addressBus[8];
  assign adr_o[7] = addressBus[7];
  assign adr_o[6] = addressBus[6];
  assign adr_o[5] = addressBus[5];
  assign adr_o[4] = addressBus[4];
  assign adr_o[3] = addressBus[3];
  assign adr_o[2] = addressBus[2];
  assign adr_o[1] = addressBus[1];
  assign adr_o[0] = addressBus[0];
  assign taga_o = mem_req;
  assign dat_o[31] = dataBus[31];
  assign dat_o[30] = dataBus[30];
  assign dat_o[29] = dataBus[29];
  assign dat_o[28] = dataBus[28];
  assign dat_o[27] = dataBus[27];
  assign dat_o[26] = dataBus[26];
  assign dat_o[25] = dataBus[25];
  assign dat_o[24] = dataBus[24];
  assign dat_o[23] = dataBus[23];
  assign dat_o[22] = dataBus[22];
  assign dat_o[21] = dataBus[21];
  assign dat_o[20] = dataBus[20];
  assign dat_o[19] = dataBus[19];
  assign dat_o[18] = dataBus[18];
  assign dat_o[17] = dataBus[17];
  assign dat_o[16] = dataBus[16];
  assign dat_o[15] = dataBus[15];
  assign dat_o[14] = dataBus[14];
  assign dat_o[13] = dataBus[13];
  assign dat_o[12] = dataBus[12];
  assign dat_o[11] = dataBus[11];
  assign dat_o[10] = dataBus[10];
  assign dat_o[9] = dataBus[9];
  assign dat_o[8] = dataBus[8];
  assign dat_o[7] = dataBus[7];
  assign dat_o[6] = dataBus[6];
  assign dat_o[5] = dataBus[5];
  assign dat_o[4] = dataBus[4];
  assign dat_o[3] = dataBus[3];
  assign dat_o[2] = dataBus[2];
  assign dat_o[1] = dataBus[1];
  assign dat_o[0] = dataBus[0];

  LATCH \next_state_reg[0]  ( .CLK(N59), .D(N60), .Q(next_state[0]) );
  DFFPOSX1 \state_reg[0]  ( .D(N44), .CLK(clk_i), .Q(state[0]) );
  LATCH \next_state_reg[1]  ( .CLK(N59), .D(n2), .Q(next_state[1]) );
  DFFPOSX1 \state_reg[1]  ( .D(N45), .CLK(clk_i), .Q(state[1]) );
  LATCH we_o_reg ( .CLK(n59), .D(n44), .Q(we_o) );
  LATCH stb_o_reg ( .CLK(n63), .D(n41), .Q(stb_o) );
  LATCH cyc_o_reg ( .CLK(n63), .D(n41), .Q(cyc_o) );
  LATCH \dat_i_temp_reg[31]  ( .CLK(n42), .D(dat_i[31]), .Q(dat_i_temp[31]) );
  LATCH \dat_i_temp_reg[30]  ( .CLK(n42), .D(dat_i[30]), .Q(dat_i_temp[30]) );
  LATCH \dat_i_temp_reg[29]  ( .CLK(n42), .D(dat_i[29]), .Q(dat_i_temp[29]) );
  LATCH \dat_i_temp_reg[28]  ( .CLK(n42), .D(dat_i[28]), .Q(dat_i_temp[28]) );
  LATCH \dat_i_temp_reg[27]  ( .CLK(n42), .D(dat_i[27]), .Q(dat_i_temp[27]) );
  LATCH \dat_i_temp_reg[26]  ( .CLK(n42), .D(dat_i[26]), .Q(dat_i_temp[26]) );
  LATCH \dat_i_temp_reg[25]  ( .CLK(n42), .D(dat_i[25]), .Q(dat_i_temp[25]) );
  LATCH \dat_i_temp_reg[24]  ( .CLK(n42), .D(dat_i[24]), .Q(dat_i_temp[24]) );
  LATCH \dat_i_temp_reg[23]  ( .CLK(n42), .D(dat_i[23]), .Q(dat_i_temp[23]) );
  LATCH \dat_i_temp_reg[22]  ( .CLK(n42), .D(dat_i[22]), .Q(dat_i_temp[22]) );
  LATCH \dat_i_temp_reg[21]  ( .CLK(n42), .D(dat_i[21]), .Q(dat_i_temp[21]) );
  LATCH \dat_i_temp_reg[20]  ( .CLK(n42), .D(dat_i[20]), .Q(dat_i_temp[20]) );
  LATCH \dat_i_temp_reg[19]  ( .CLK(n42), .D(dat_i[19]), .Q(dat_i_temp[19]) );
  LATCH \dat_i_temp_reg[18]  ( .CLK(n42), .D(dat_i[18]), .Q(dat_i_temp[18]) );
  LATCH \dat_i_temp_reg[17]  ( .CLK(n42), .D(dat_i[17]), .Q(dat_i_temp[17]) );
  LATCH \dat_i_temp_reg[16]  ( .CLK(n42), .D(dat_i[16]), .Q(dat_i_temp[16]) );
  LATCH \dat_i_temp_reg[15]  ( .CLK(n42), .D(dat_i[15]), .Q(dat_i_temp[15]) );
  LATCH \dat_i_temp_reg[14]  ( .CLK(n42), .D(dat_i[14]), .Q(dat_i_temp[14]) );
  LATCH \dat_i_temp_reg[13]  ( .CLK(n42), .D(dat_i[13]), .Q(dat_i_temp[13]) );
  LATCH \dat_i_temp_reg[12]  ( .CLK(n42), .D(dat_i[12]), .Q(dat_i_temp[12]) );
  LATCH \dat_i_temp_reg[11]  ( .CLK(n42), .D(dat_i[11]), .Q(dat_i_temp[11]) );
  LATCH \dat_i_temp_reg[10]  ( .CLK(n42), .D(dat_i[10]), .Q(dat_i_temp[10]) );
  LATCH \dat_i_temp_reg[9]  ( .CLK(n42), .D(dat_i[9]), .Q(dat_i_temp[9]) );
  LATCH \dat_i_temp_reg[8]  ( .CLK(n42), .D(dat_i[8]), .Q(dat_i_temp[8]) );
  LATCH \dat_i_temp_reg[7]  ( .CLK(n42), .D(dat_i[7]), .Q(dat_i_temp[7]) );
  LATCH \dat_i_temp_reg[6]  ( .CLK(n42), .D(dat_i[6]), .Q(dat_i_temp[6]) );
  LATCH \dat_i_temp_reg[5]  ( .CLK(n42), .D(dat_i[5]), .Q(dat_i_temp[5]) );
  LATCH \dat_i_temp_reg[4]  ( .CLK(n42), .D(dat_i[4]), .Q(dat_i_temp[4]) );
  LATCH \dat_i_temp_reg[3]  ( .CLK(n42), .D(dat_i[3]), .Q(dat_i_temp[3]) );
  LATCH \dat_i_temp_reg[2]  ( .CLK(n42), .D(dat_i[2]), .Q(dat_i_temp[2]) );
  LATCH \dat_i_temp_reg[1]  ( .CLK(n42), .D(dat_i[1]), .Q(dat_i_temp[1]) );
  LATCH \dat_i_temp_reg[0]  ( .CLK(n42), .D(dat_i[0]), .Q(dat_i_temp[0]) );
  TBUFX2 \dataBus_tri[0]  ( .A(n37), .EN(memoryRead), .Y(dataBus[0]) );
  TBUFX2 \dataBus_tri[1]  ( .A(n36), .EN(memoryRead), .Y(dataBus[1]) );
  TBUFX2 \dataBus_tri[2]  ( .A(n35), .EN(memoryRead), .Y(dataBus[2]) );
  TBUFX2 \dataBus_tri[3]  ( .A(n34), .EN(memoryRead), .Y(dataBus[3]) );
  TBUFX2 \dataBus_tri[4]  ( .A(n33), .EN(memoryRead), .Y(dataBus[4]) );
  TBUFX2 \dataBus_tri[5]  ( .A(n32), .EN(memoryRead), .Y(dataBus[5]) );
  TBUFX2 \dataBus_tri[6]  ( .A(n31), .EN(memoryRead), .Y(dataBus[6]) );
  TBUFX2 \dataBus_tri[7]  ( .A(n30), .EN(memoryRead), .Y(dataBus[7]) );
  TBUFX2 \dataBus_tri[8]  ( .A(n29), .EN(memoryRead), .Y(dataBus[8]) );
  TBUFX2 \dataBus_tri[9]  ( .A(n28), .EN(memoryRead), .Y(dataBus[9]) );
  TBUFX2 \dataBus_tri[10]  ( .A(n27), .EN(memoryRead), .Y(dataBus[10]) );
  TBUFX2 \dataBus_tri[11]  ( .A(n26), .EN(memoryRead), .Y(dataBus[11]) );
  TBUFX2 \dataBus_tri[12]  ( .A(n25), .EN(memoryRead), .Y(dataBus[12]) );
  TBUFX2 \dataBus_tri[13]  ( .A(n24), .EN(memoryRead), .Y(dataBus[13]) );
  TBUFX2 \dataBus_tri[14]  ( .A(n23), .EN(memoryRead), .Y(dataBus[14]) );
  TBUFX2 \dataBus_tri[15]  ( .A(n22), .EN(memoryRead), .Y(dataBus[15]) );
  TBUFX2 \dataBus_tri[16]  ( .A(n21), .EN(memoryRead), .Y(dataBus[16]) );
  TBUFX2 \dataBus_tri[17]  ( .A(n20), .EN(memoryRead), .Y(dataBus[17]) );
  TBUFX2 \dataBus_tri[18]  ( .A(n19), .EN(memoryRead), .Y(dataBus[18]) );
  TBUFX2 \dataBus_tri[19]  ( .A(n18), .EN(memoryRead), .Y(dataBus[19]) );
  TBUFX2 \dataBus_tri[20]  ( .A(n17), .EN(memoryRead), .Y(dataBus[20]) );
  TBUFX2 \dataBus_tri[21]  ( .A(n16), .EN(memoryRead), .Y(dataBus[21]) );
  TBUFX2 \dataBus_tri[22]  ( .A(n15), .EN(memoryRead), .Y(dataBus[22]) );
  TBUFX2 \dataBus_tri[23]  ( .A(n14), .EN(memoryRead), .Y(dataBus[23]) );
  TBUFX2 \dataBus_tri[24]  ( .A(n13), .EN(memoryRead), .Y(dataBus[24]) );
  TBUFX2 \dataBus_tri[25]  ( .A(n12), .EN(memoryRead), .Y(dataBus[25]) );
  TBUFX2 \dataBus_tri[26]  ( .A(n11), .EN(memoryRead), .Y(dataBus[26]) );
  TBUFX2 \dataBus_tri[27]  ( .A(n10), .EN(memoryRead), .Y(dataBus[27]) );
  TBUFX2 \dataBus_tri[28]  ( .A(n9), .EN(memoryRead), .Y(dataBus[28]) );
  TBUFX2 \dataBus_tri[29]  ( .A(n8), .EN(memoryRead), .Y(dataBus[29]) );
  TBUFX2 \dataBus_tri[30]  ( .A(n7), .EN(memoryRead), .Y(dataBus[30]) );
  TBUFX2 \dataBus_tri[31]  ( .A(n6), .EN(memoryRead), .Y(dataBus[31]) );
  NAND3X1 U46 ( .A(ack_i), .B(n41), .C(rst_i), .Y(n40) );
  NOR3X1 U47 ( .A(n39), .B(memoryRead), .C(n62), .Y(n44) );
  NAND3X1 U48 ( .A(n43), .B(n61), .C(n60), .Y(N77) );
  OAI21X1 U51 ( .A(addressBus[16]), .B(memoryRead), .C(state[0]), .Y(n43) );
  AOI21X1 U52 ( .A(n62), .B(n46), .C(n64), .Y(N60) );
  OR2X1 U3 ( .A(n64), .B(n63), .Y(N59) );
  BUFX2 U4 ( .A(n40), .Y(n58) );
  BUFX2 U5 ( .A(N77), .Y(n59) );
  AND2X1 U6 ( .A(n4), .B(n5), .Y(n45) );
  INVX1 U7 ( .A(n45), .Y(n60) );
  AND2X1 U8 ( .A(state[1]), .B(state[0]), .Y(n42) );
  INVX1 U9 ( .A(n42), .Y(n61) );
  AND2X1 U10 ( .A(state[0]), .B(n5), .Y(n41) );
  INVX1 U11 ( .A(n41), .Y(n62) );
  AND2X1 U12 ( .A(state[1]), .B(n4), .Y(n47) );
  INVX1 U13 ( .A(n47), .Y(n63) );
  INVX1 U14 ( .A(rst_i), .Y(n64) );
  INVX1 U15 ( .A(addressBus[16]), .Y(n39) );
  OR2X1 U16 ( .A(state[1]), .B(mem_req), .Y(n46) );
  INVX1 U17 ( .A(n58), .Y(n2) );
  INVX1 U18 ( .A(state[1]), .Y(n5) );
  INVX1 U19 ( .A(state[0]), .Y(n4) );
  INVX1 U20 ( .A(dat_i_temp[31]), .Y(n6) );
  INVX1 U21 ( .A(dat_i_temp[30]), .Y(n7) );
  INVX1 U22 ( .A(dat_i_temp[29]), .Y(n8) );
  INVX1 U23 ( .A(dat_i_temp[28]), .Y(n9) );
  INVX1 U24 ( .A(dat_i_temp[27]), .Y(n10) );
  INVX1 U25 ( .A(dat_i_temp[26]), .Y(n11) );
  INVX1 U26 ( .A(dat_i_temp[25]), .Y(n12) );
  INVX1 U27 ( .A(dat_i_temp[24]), .Y(n13) );
  INVX1 U28 ( .A(dat_i_temp[23]), .Y(n14) );
  INVX1 U29 ( .A(dat_i_temp[22]), .Y(n15) );
  INVX1 U30 ( .A(dat_i_temp[21]), .Y(n16) );
  INVX1 U31 ( .A(dat_i_temp[20]), .Y(n17) );
  INVX1 U32 ( .A(dat_i_temp[19]), .Y(n18) );
  INVX1 U33 ( .A(dat_i_temp[18]), .Y(n19) );
  INVX1 U34 ( .A(dat_i_temp[17]), .Y(n20) );
  INVX1 U35 ( .A(dat_i_temp[16]), .Y(n21) );
  INVX1 U36 ( .A(dat_i_temp[15]), .Y(n22) );
  INVX1 U37 ( .A(dat_i_temp[14]), .Y(n23) );
  INVX1 U38 ( .A(dat_i_temp[13]), .Y(n24) );
  INVX1 U39 ( .A(dat_i_temp[12]), .Y(n25) );
  INVX1 U40 ( .A(dat_i_temp[11]), .Y(n26) );
  INVX1 U41 ( .A(dat_i_temp[10]), .Y(n27) );
  INVX1 U42 ( .A(dat_i_temp[9]), .Y(n28) );
  INVX1 U43 ( .A(dat_i_temp[8]), .Y(n29) );
  INVX1 U44 ( .A(dat_i_temp[7]), .Y(n30) );
  INVX1 U45 ( .A(dat_i_temp[6]), .Y(n31) );
  INVX1 U49 ( .A(dat_i_temp[5]), .Y(n32) );
  INVX1 U50 ( .A(dat_i_temp[4]), .Y(n33) );
  INVX1 U53 ( .A(dat_i_temp[3]), .Y(n34) );
  INVX1 U54 ( .A(dat_i_temp[2]), .Y(n35) );
  INVX1 U55 ( .A(dat_i_temp[1]), .Y(n36) );
  INVX1 U56 ( .A(dat_i_temp[0]), .Y(n37) );
  AND2X1 U57 ( .A(next_state[1]), .B(rst_i), .Y(N45) );
  AND2X1 U58 ( .A(next_state[0]), .B(rst_i), .Y(N44) );
endmodule


module Slave ( rst_i, clk_i, dat_i, adr_i, taga_i, we_i, stb_i, cyc_i, 
        mem_adr_o, mem_r_o, mem_w_o, ssp_sel_o, ssp_w_o, dat_o, ack_o, tagd_o, 
        dataBus );
  input [31:0] dat_i;
  input [25:0] adr_i;
  output [25:0] mem_adr_o;
  output [31:0] dat_o;
  inout [31:0] dataBus;
  input rst_i, clk_i, taga_i, we_i, stb_i, cyc_i;
  output mem_r_o, mem_w_o, ssp_sel_o, ssp_w_o, ack_o, tagd_o;
  wire   N86, N87, N88, N93, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n49, n50, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112;
  wire   [31:0] dat_i_temp;
  wire   [31:8] dataBus_temp;
  wire   [1:0] state;
  tri   [31:0] dat_i;
  tri   [31:0] dataBus;
  assign mem_adr_o[25] = adr_i[25];
  assign mem_adr_o[24] = adr_i[24];
  assign mem_adr_o[23] = adr_i[23];
  assign mem_adr_o[22] = adr_i[22];
  assign mem_adr_o[21] = adr_i[21];
  assign mem_adr_o[20] = adr_i[20];
  assign mem_adr_o[19] = adr_i[19];
  assign mem_adr_o[18] = adr_i[18];
  assign mem_adr_o[17] = adr_i[17];
  assign mem_adr_o[16] = adr_i[16];
  assign mem_adr_o[15] = adr_i[15];
  assign mem_adr_o[14] = adr_i[14];
  assign mem_adr_o[13] = adr_i[13];
  assign mem_adr_o[12] = adr_i[12];
  assign mem_adr_o[11] = adr_i[11];
  assign mem_adr_o[10] = adr_i[10];
  assign mem_adr_o[9] = adr_i[9];
  assign mem_adr_o[8] = adr_i[8];
  assign mem_adr_o[7] = adr_i[7];
  assign mem_adr_o[6] = adr_i[6];
  assign mem_adr_o[5] = adr_i[5];
  assign mem_adr_o[4] = adr_i[4];
  assign mem_adr_o[3] = adr_i[3];
  assign mem_adr_o[2] = adr_i[2];
  assign mem_adr_o[1] = adr_i[1];
  assign mem_adr_o[0] = adr_i[0];
  assign mem_w_o = 1'b0;

  DFFPOSX1 \state_reg[0]  ( .D(n75), .CLK(clk_i), .Q(state[0]) );
  DFFPOSX1 \state_reg[1]  ( .D(n76), .CLK(clk_i), .Q(state[1]) );
  LATCH ssp_sel_o_reg ( .CLK(N88), .D(n49), .Q(ssp_sel_o) );
  LATCH ssp_w_o_reg ( .CLK(N88), .D(n95), .Q(ssp_w_o) );
  LATCH \dat_i_temp_reg[31]  ( .CLK(n95), .D(dat_i[31]), .Q(dat_i_temp[31]) );
  LATCH \dat_i_temp_reg[30]  ( .CLK(n95), .D(dat_i[30]), .Q(dat_i_temp[30]) );
  LATCH \dat_i_temp_reg[29]  ( .CLK(n95), .D(dat_i[29]), .Q(dat_i_temp[29]) );
  LATCH \dat_i_temp_reg[28]  ( .CLK(n95), .D(dat_i[28]), .Q(dat_i_temp[28]) );
  LATCH \dat_i_temp_reg[27]  ( .CLK(n95), .D(dat_i[27]), .Q(dat_i_temp[27]) );
  LATCH \dat_i_temp_reg[26]  ( .CLK(n95), .D(dat_i[26]), .Q(dat_i_temp[26]) );
  LATCH \dat_i_temp_reg[25]  ( .CLK(n95), .D(dat_i[25]), .Q(dat_i_temp[25]) );
  LATCH \dat_i_temp_reg[24]  ( .CLK(n95), .D(dat_i[24]), .Q(dat_i_temp[24]) );
  LATCH \dat_i_temp_reg[23]  ( .CLK(n95), .D(dat_i[23]), .Q(dat_i_temp[23]) );
  LATCH \dat_i_temp_reg[22]  ( .CLK(n95), .D(dat_i[22]), .Q(dat_i_temp[22]) );
  LATCH \dat_i_temp_reg[21]  ( .CLK(n95), .D(dat_i[21]), .Q(dat_i_temp[21]) );
  LATCH \dat_i_temp_reg[20]  ( .CLK(n95), .D(dat_i[20]), .Q(dat_i_temp[20]) );
  LATCH \dat_i_temp_reg[19]  ( .CLK(n95), .D(dat_i[19]), .Q(dat_i_temp[19]) );
  LATCH \dat_i_temp_reg[18]  ( .CLK(n95), .D(dat_i[18]), .Q(dat_i_temp[18]) );
  LATCH \dat_i_temp_reg[17]  ( .CLK(n95), .D(dat_i[17]), .Q(dat_i_temp[17]) );
  LATCH \dat_i_temp_reg[16]  ( .CLK(n95), .D(dat_i[16]), .Q(dat_i_temp[16]) );
  LATCH \dat_i_temp_reg[15]  ( .CLK(n95), .D(dat_i[15]), .Q(dat_i_temp[15]) );
  LATCH \dat_i_temp_reg[14]  ( .CLK(n95), .D(dat_i[14]), .Q(dat_i_temp[14]) );
  LATCH \dat_i_temp_reg[13]  ( .CLK(n95), .D(dat_i[13]), .Q(dat_i_temp[13]) );
  LATCH \dat_i_temp_reg[12]  ( .CLK(n95), .D(dat_i[12]), .Q(dat_i_temp[12]) );
  LATCH \dat_i_temp_reg[11]  ( .CLK(n95), .D(dat_i[11]), .Q(dat_i_temp[11]) );
  LATCH \dat_i_temp_reg[10]  ( .CLK(n95), .D(dat_i[10]), .Q(dat_i_temp[10]) );
  LATCH \dat_i_temp_reg[9]  ( .CLK(n95), .D(dat_i[9]), .Q(dat_i_temp[9]) );
  LATCH \dat_i_temp_reg[8]  ( .CLK(n95), .D(dat_i[8]), .Q(dat_i_temp[8]) );
  LATCH \dat_i_temp_reg[7]  ( .CLK(n95), .D(dat_i[7]), .Q(dat_i_temp[7]) );
  LATCH \dat_i_temp_reg[6]  ( .CLK(n95), .D(dat_i[6]), .Q(dat_i_temp[6]) );
  LATCH \dat_i_temp_reg[5]  ( .CLK(n95), .D(dat_i[5]), .Q(dat_i_temp[5]) );
  LATCH \dat_i_temp_reg[4]  ( .CLK(n95), .D(dat_i[4]), .Q(dat_i_temp[4]) );
  LATCH \dat_i_temp_reg[3]  ( .CLK(n95), .D(dat_i[3]), .Q(dat_i_temp[3]) );
  LATCH \dat_i_temp_reg[2]  ( .CLK(n95), .D(dat_i[2]), .Q(dat_i_temp[2]) );
  LATCH \dat_i_temp_reg[1]  ( .CLK(n95), .D(dat_i[1]), .Q(dat_i_temp[1]) );
  LATCH \dat_i_temp_reg[0]  ( .CLK(n95), .D(dat_i[0]), .Q(dat_i_temp[0]) );
  LATCH \dataBus_temp_reg[31]  ( .CLK(n105), .D(dataBus[31]), .Q(
        dataBus_temp[31]) );
  LATCH \dataBus_temp_reg[30]  ( .CLK(n105), .D(dataBus[30]), .Q(
        dataBus_temp[30]) );
  LATCH \dataBus_temp_reg[29]  ( .CLK(n105), .D(dataBus[29]), .Q(
        dataBus_temp[29]) );
  LATCH \dataBus_temp_reg[28]  ( .CLK(n105), .D(dataBus[28]), .Q(
        dataBus_temp[28]) );
  LATCH \dataBus_temp_reg[27]  ( .CLK(n105), .D(dataBus[27]), .Q(
        dataBus_temp[27]) );
  LATCH \dataBus_temp_reg[26]  ( .CLK(n105), .D(dataBus[26]), .Q(
        dataBus_temp[26]) );
  LATCH \dataBus_temp_reg[25]  ( .CLK(n105), .D(dataBus[25]), .Q(
        dataBus_temp[25]) );
  LATCH \dataBus_temp_reg[24]  ( .CLK(n105), .D(dataBus[24]), .Q(
        dataBus_temp[24]) );
  LATCH \dataBus_temp_reg[23]  ( .CLK(n105), .D(dataBus[23]), .Q(
        dataBus_temp[23]) );
  LATCH \dataBus_temp_reg[22]  ( .CLK(n96), .D(dataBus[22]), .Q(
        dataBus_temp[22]) );
  LATCH \dataBus_temp_reg[21]  ( .CLK(n105), .D(dataBus[21]), .Q(
        dataBus_temp[21]) );
  LATCH \dataBus_temp_reg[20]  ( .CLK(n105), .D(dataBus[20]), .Q(
        dataBus_temp[20]) );
  LATCH \dataBus_temp_reg[19]  ( .CLK(n105), .D(dataBus[19]), .Q(
        dataBus_temp[19]) );
  LATCH \dataBus_temp_reg[18]  ( .CLK(n105), .D(dataBus[18]), .Q(
        dataBus_temp[18]) );
  LATCH \dataBus_temp_reg[17]  ( .CLK(n105), .D(dataBus[17]), .Q(
        dataBus_temp[17]) );
  LATCH \dataBus_temp_reg[16]  ( .CLK(n96), .D(dataBus[16]), .Q(
        dataBus_temp[16]) );
  LATCH \dataBus_temp_reg[15]  ( .CLK(n105), .D(dataBus[15]), .Q(
        dataBus_temp[15]) );
  LATCH \dataBus_temp_reg[14]  ( .CLK(n96), .D(dataBus[14]), .Q(
        dataBus_temp[14]) );
  LATCH \dataBus_temp_reg[13]  ( .CLK(n105), .D(dataBus[13]), .Q(
        dataBus_temp[13]) );
  LATCH \dataBus_temp_reg[12]  ( .CLK(n96), .D(dataBus[12]), .Q(
        dataBus_temp[12]) );
  LATCH \dataBus_temp_reg[11]  ( .CLK(n96), .D(dataBus[11]), .Q(
        dataBus_temp[11]) );
  LATCH \dataBus_temp_reg[10]  ( .CLK(n96), .D(dataBus[10]), .Q(
        dataBus_temp[10]) );
  LATCH \dataBus_temp_reg[9]  ( .CLK(n96), .D(dataBus[9]), .Q(dataBus_temp[9])
         );
  LATCH \dataBus_temp_reg[8]  ( .CLK(n96), .D(dataBus[8]), .Q(dataBus_temp[8])
         );
  LATCH \dataBus_temp_reg[7]  ( .CLK(n96), .D(dataBus[7]), .Q(dat_o[7]) );
  LATCH \dataBus_temp_reg[6]  ( .CLK(n96), .D(dataBus[6]), .Q(dat_o[6]) );
  LATCH \dataBus_temp_reg[5]  ( .CLK(n96), .D(dataBus[5]), .Q(dat_o[5]) );
  LATCH \dataBus_temp_reg[4]  ( .CLK(n96), .D(dataBus[4]), .Q(dat_o[4]) );
  LATCH \dataBus_temp_reg[3]  ( .CLK(n96), .D(dataBus[3]), .Q(dat_o[3]) );
  LATCH \dataBus_temp_reg[2]  ( .CLK(n96), .D(dataBus[2]), .Q(dat_o[2]) );
  LATCH \dataBus_temp_reg[1]  ( .CLK(n96), .D(dataBus[1]), .Q(dat_o[1]) );
  LATCH \dataBus_temp_reg[0]  ( .CLK(n96), .D(dataBus[0]), .Q(dat_o[0]) );
  LATCH tagd_o_reg ( .CLK(N93), .D(n104), .Q(tagd_o) );
  LATCH ack_o_reg ( .CLK(n84), .D(n104), .Q(ack_o) );
  LATCH mem_r_o_reg ( .CLK(n83), .D(N87), .Q(mem_r_o) );
  TBUFX2 \dataBus_tri[0]  ( .A(n38), .EN(we_i), .Y(dataBus[0]) );
  TBUFX2 \dataBus_tri[1]  ( .A(n37), .EN(we_i), .Y(dataBus[1]) );
  TBUFX2 \dataBus_tri[2]  ( .A(n36), .EN(we_i), .Y(dataBus[2]) );
  TBUFX2 \dataBus_tri[3]  ( .A(n35), .EN(we_i), .Y(dataBus[3]) );
  TBUFX2 \dataBus_tri[4]  ( .A(n34), .EN(we_i), .Y(dataBus[4]) );
  TBUFX2 \dataBus_tri[5]  ( .A(n33), .EN(we_i), .Y(dataBus[5]) );
  TBUFX2 \dataBus_tri[6]  ( .A(n32), .EN(we_i), .Y(dataBus[6]) );
  TBUFX2 \dataBus_tri[7]  ( .A(n31), .EN(we_i), .Y(dataBus[7]) );
  TBUFX2 \dataBus_tri[8]  ( .A(n30), .EN(we_i), .Y(dataBus[8]) );
  TBUFX2 \dataBus_tri[9]  ( .A(n29), .EN(we_i), .Y(dataBus[9]) );
  TBUFX2 \dataBus_tri[10]  ( .A(n28), .EN(we_i), .Y(dataBus[10]) );
  TBUFX2 \dataBus_tri[11]  ( .A(n27), .EN(we_i), .Y(dataBus[11]) );
  TBUFX2 \dataBus_tri[12]  ( .A(n26), .EN(we_i), .Y(dataBus[12]) );
  TBUFX2 \dataBus_tri[13]  ( .A(n25), .EN(we_i), .Y(dataBus[13]) );
  TBUFX2 \dataBus_tri[14]  ( .A(n24), .EN(we_i), .Y(dataBus[14]) );
  TBUFX2 \dataBus_tri[15]  ( .A(n23), .EN(we_i), .Y(dataBus[15]) );
  TBUFX2 \dataBus_tri[16]  ( .A(n22), .EN(we_i), .Y(dataBus[16]) );
  TBUFX2 \dataBus_tri[17]  ( .A(n21), .EN(we_i), .Y(dataBus[17]) );
  TBUFX2 \dataBus_tri[18]  ( .A(n20), .EN(we_i), .Y(dataBus[18]) );
  TBUFX2 \dataBus_tri[19]  ( .A(n19), .EN(we_i), .Y(dataBus[19]) );
  TBUFX2 \dataBus_tri[20]  ( .A(n18), .EN(we_i), .Y(dataBus[20]) );
  TBUFX2 \dataBus_tri[21]  ( .A(n17), .EN(we_i), .Y(dataBus[21]) );
  TBUFX2 \dataBus_tri[22]  ( .A(n16), .EN(we_i), .Y(dataBus[22]) );
  TBUFX2 \dataBus_tri[23]  ( .A(n15), .EN(we_i), .Y(dataBus[23]) );
  TBUFX2 \dataBus_tri[24]  ( .A(n14), .EN(we_i), .Y(dataBus[24]) );
  TBUFX2 \dataBus_tri[25]  ( .A(n13), .EN(we_i), .Y(dataBus[25]) );
  TBUFX2 \dataBus_tri[26]  ( .A(n12), .EN(we_i), .Y(dataBus[26]) );
  TBUFX2 \dataBus_tri[27]  ( .A(n11), .EN(we_i), .Y(dataBus[27]) );
  TBUFX2 \dataBus_tri[28]  ( .A(n10), .EN(we_i), .Y(dataBus[28]) );
  TBUFX2 \dataBus_tri[29]  ( .A(n9), .EN(we_i), .Y(dataBus[29]) );
  TBUFX2 \dataBus_tri[30]  ( .A(n8), .EN(we_i), .Y(dataBus[30]) );
  TBUFX2 \dataBus_tri[31]  ( .A(n7), .EN(we_i), .Y(dataBus[31]) );
  NOR3X1 U3 ( .A(n91), .B(n74), .C(n77), .Y(n72) );
  INVX1 U4 ( .A(n72), .Y(n101) );
  INVX1 U5 ( .A(rst_i), .Y(n74) );
  NOR3X1 U6 ( .A(n74), .B(n93), .C(n79), .Y(n73) );
  INVX1 U7 ( .A(n73), .Y(n100) );
  INVX4 U8 ( .A(n108), .Y(n93) );
  BUFX2 U9 ( .A(n112), .Y(n75) );
  AND2X2 U10 ( .A(n100), .B(n101), .Y(n78) );
  INVX1 U11 ( .A(n78), .Y(n76) );
  INVX1 U12 ( .A(state[0]), .Y(n77) );
  INVX1 U13 ( .A(state[0]), .Y(n108) );
  INVX1 U14 ( .A(state[1]), .Y(n79) );
  AND2X1 U15 ( .A(n93), .B(n94), .Y(n102) );
  INVX1 U16 ( .A(n102), .Y(n80) );
  BUFX2 U17 ( .A(n107), .Y(n81) );
  AND2X1 U18 ( .A(adr_i[16]), .B(n98), .Y(n110) );
  INVX1 U19 ( .A(n110), .Y(n82) );
  BUFX2 U20 ( .A(N86), .Y(n83) );
  AND2X1 U21 ( .A(n89), .B(n86), .Y(n50) );
  INVX1 U22 ( .A(n50), .Y(n84) );
  BUFX2 U23 ( .A(n109), .Y(n85) );
  AND2X1 U24 ( .A(n90), .B(n88), .Y(n106) );
  INVX1 U25 ( .A(n106), .Y(n86) );
  AND2X2 U26 ( .A(rst_i), .B(n77), .Y(n99) );
  INVX1 U27 ( .A(n99), .Y(n87) );
  AND2X1 U28 ( .A(n94), .B(n92), .Y(n104) );
  INVX1 U29 ( .A(n104), .Y(n88) );
  AND2X1 U30 ( .A(n104), .B(n98), .Y(n105) );
  INVX1 U31 ( .A(n105), .Y(n89) );
  AND2X2 U32 ( .A(n93), .B(n103), .Y(n111) );
  INVX1 U33 ( .A(n111), .Y(n90) );
  INVX1 U34 ( .A(state[1]), .Y(n103) );
  INVX1 U35 ( .A(n79), .Y(n91) );
  INVX1 U36 ( .A(n93), .Y(n92) );
  BUFX2 U37 ( .A(n91), .Y(n94) );
  INVX1 U38 ( .A(n89), .Y(n96) );
  INVX1 U39 ( .A(n85), .Y(n95) );
  INVX1 U40 ( .A(adr_i[16]), .Y(n97) );
  INVX1 U41 ( .A(we_i), .Y(n98) );
  INVX1 U42 ( .A(dat_i_temp[31]), .Y(n7) );
  INVX1 U43 ( .A(dat_i_temp[30]), .Y(n8) );
  INVX1 U44 ( .A(dat_i_temp[29]), .Y(n9) );
  INVX1 U45 ( .A(dat_i_temp[28]), .Y(n10) );
  INVX1 U46 ( .A(dat_i_temp[27]), .Y(n11) );
  INVX1 U47 ( .A(dat_i_temp[26]), .Y(n12) );
  INVX1 U48 ( .A(dat_i_temp[25]), .Y(n13) );
  INVX1 U49 ( .A(dat_i_temp[24]), .Y(n14) );
  INVX1 U50 ( .A(dat_i_temp[23]), .Y(n15) );
  INVX1 U51 ( .A(dat_i_temp[22]), .Y(n16) );
  INVX1 U52 ( .A(dat_i_temp[21]), .Y(n17) );
  INVX1 U53 ( .A(dat_i_temp[20]), .Y(n18) );
  INVX1 U54 ( .A(dat_i_temp[19]), .Y(n19) );
  INVX1 U55 ( .A(dat_i_temp[18]), .Y(n20) );
  INVX1 U56 ( .A(dat_i_temp[17]), .Y(n21) );
  INVX1 U57 ( .A(dat_i_temp[16]), .Y(n22) );
  INVX1 U58 ( .A(dat_i_temp[15]), .Y(n23) );
  INVX1 U59 ( .A(dat_i_temp[14]), .Y(n24) );
  INVX1 U60 ( .A(dat_i_temp[13]), .Y(n25) );
  INVX1 U61 ( .A(dat_i_temp[12]), .Y(n26) );
  INVX1 U62 ( .A(dat_i_temp[11]), .Y(n27) );
  INVX1 U63 ( .A(dat_i_temp[10]), .Y(n28) );
  INVX1 U64 ( .A(dat_i_temp[9]), .Y(n29) );
  INVX1 U65 ( .A(dat_i_temp[8]), .Y(n30) );
  INVX1 U66 ( .A(dat_i_temp[7]), .Y(n31) );
  INVX1 U67 ( .A(dat_i_temp[6]), .Y(n32) );
  INVX1 U68 ( .A(dat_i_temp[5]), .Y(n33) );
  INVX1 U69 ( .A(dat_i_temp[4]), .Y(n34) );
  INVX1 U70 ( .A(dat_i_temp[3]), .Y(n35) );
  INVX1 U71 ( .A(dat_i_temp[2]), .Y(n36) );
  INVX1 U72 ( .A(dat_i_temp[1]), .Y(n37) );
  INVX1 U73 ( .A(dat_i_temp[0]), .Y(n38) );
  AND2X1 U74 ( .A(dataBus_temp[10]), .B(n97), .Y(dat_o[10]) );
  AND2X1 U75 ( .A(dataBus_temp[11]), .B(n97), .Y(dat_o[11]) );
  AND2X1 U76 ( .A(dataBus_temp[12]), .B(n97), .Y(dat_o[12]) );
  AND2X1 U77 ( .A(dataBus_temp[13]), .B(n97), .Y(dat_o[13]) );
  AND2X1 U78 ( .A(dataBus_temp[14]), .B(n97), .Y(dat_o[14]) );
  AND2X1 U79 ( .A(dataBus_temp[15]), .B(n97), .Y(dat_o[15]) );
  AND2X1 U80 ( .A(dataBus_temp[16]), .B(n97), .Y(dat_o[16]) );
  AND2X1 U81 ( .A(dataBus_temp[17]), .B(n97), .Y(dat_o[17]) );
  AND2X1 U82 ( .A(dataBus_temp[18]), .B(n97), .Y(dat_o[18]) );
  AND2X1 U84 ( .A(dataBus_temp[19]), .B(n97), .Y(dat_o[19]) );
  AND2X1 U85 ( .A(dataBus_temp[20]), .B(n97), .Y(dat_o[20]) );
  AND2X1 U86 ( .A(dataBus_temp[21]), .B(n97), .Y(dat_o[21]) );
  AND2X1 U87 ( .A(dataBus_temp[22]), .B(n97), .Y(dat_o[22]) );
  AND2X1 U88 ( .A(dataBus_temp[23]), .B(n97), .Y(dat_o[23]) );
  AND2X1 U89 ( .A(dataBus_temp[24]), .B(n97), .Y(dat_o[24]) );
  AND2X1 U90 ( .A(dataBus_temp[25]), .B(n97), .Y(dat_o[25]) );
  AND2X1 U91 ( .A(dataBus_temp[26]), .B(n97), .Y(dat_o[26]) );
  AND2X1 U92 ( .A(dataBus_temp[8]), .B(n97), .Y(dat_o[8]) );
  AND2X1 U93 ( .A(dataBus_temp[9]), .B(n97), .Y(dat_o[9]) );
  AND2X1 U94 ( .A(dataBus_temp[27]), .B(n97), .Y(dat_o[27]) );
  AND2X1 U95 ( .A(dataBus_temp[28]), .B(n97), .Y(dat_o[28]) );
  AND2X1 U96 ( .A(dataBus_temp[29]), .B(n97), .Y(dat_o[29]) );
  AND2X1 U97 ( .A(dataBus_temp[30]), .B(n97), .Y(dat_o[30]) );
  AND2X1 U98 ( .A(dataBus_temp[31]), .B(n97), .Y(dat_o[31]) );
  AOI21X1 U99 ( .A(taga_i), .B(n79), .C(n87), .Y(n112) );
  OAI21X1 U100 ( .A(n97), .B(n89), .C(n80), .Y(N93) );
  AOI21X1 U101 ( .A(n104), .B(adr_i[16]), .C(n106), .Y(n107) );
  OAI21X1 U102 ( .A(we_i), .B(n108), .C(n81), .Y(N88) );
  NAND3X1 U103 ( .A(adr_i[16]), .B(we_i), .C(n104), .Y(n109) );
  OAI21X1 U104 ( .A(n90), .B(n82), .C(n85), .Y(n49) );
  AOI21X1 U105 ( .A(n93), .B(we_i), .C(n94), .Y(N86) );
  NOR3X1 U106 ( .A(adr_i[16]), .B(we_i), .C(n90), .Y(N87) );
endmodule


module TxFIFO ( PSEL, PWRITE, PWDATA, CLEAR_B, PCLK, SENT, TxDATA, SSPTXINTR, 
        VALID );
  input [7:0] PWDATA;
  output [7:0] TxDATA;
  input PSEL, PWRITE, CLEAR_B, PCLK, SENT;
  output SSPTXINTR, VALID;
  wire   flag3, flag2, flag1, flag0, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n293, n1, n2, n3, n4, n5, n6, n7, n8, n10, n13, n14, n17, n20, n21,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475;
  wire   [1:0] wp;
  wire   [7:0] mcell0;
  wire   [7:0] mcell1;
  wire   [7:0] mcell2;
  wire   [7:0] mcell3;
  wire   [1:0] rp;
  tri   [7:0] PWDATA;

  DFFPOSX1 flag0_reg ( .D(n198), .CLK(PCLK), .Q(flag0) );
  DFFPOSX1 \rp_reg[0]  ( .D(n197), .CLK(PCLK), .Q(rp[0]) );
  DFFPOSX1 \rp_reg[1]  ( .D(n196), .CLK(PCLK), .Q(rp[1]) );
  DFFPOSX1 flag1_reg ( .D(n159), .CLK(PCLK), .Q(flag1) );
  DFFPOSX1 \wp_reg[0]  ( .D(n445), .CLK(PCLK), .Q(wp[0]) );
  DFFPOSX1 \wp_reg[1]  ( .D(n193), .CLK(PCLK), .Q(wp[1]) );
  DFFPOSX1 \mcell1_reg[7]  ( .D(n177), .CLK(PCLK), .Q(mcell1[7]) );
  DFFPOSX1 \mcell1_reg[6]  ( .D(n178), .CLK(PCLK), .Q(mcell1[6]) );
  DFFPOSX1 \mcell1_reg[5]  ( .D(n179), .CLK(PCLK), .Q(mcell1[5]) );
  DFFPOSX1 \mcell1_reg[4]  ( .D(n180), .CLK(PCLK), .Q(mcell1[4]) );
  DFFPOSX1 \mcell1_reg[3]  ( .D(n181), .CLK(PCLK), .Q(mcell1[3]) );
  DFFPOSX1 \mcell1_reg[2]  ( .D(n182), .CLK(PCLK), .Q(mcell1[2]) );
  DFFPOSX1 \mcell1_reg[1]  ( .D(n183), .CLK(PCLK), .Q(mcell1[1]) );
  DFFPOSX1 \mcell1_reg[0]  ( .D(n184), .CLK(PCLK), .Q(mcell1[0]) );
  DFFPOSX1 flag3_reg ( .D(n160), .CLK(PCLK), .Q(flag3) );
  DFFPOSX1 \mcell3_reg[7]  ( .D(n161), .CLK(PCLK), .Q(mcell3[7]) );
  DFFPOSX1 \mcell3_reg[6]  ( .D(n162), .CLK(PCLK), .Q(mcell3[6]) );
  DFFPOSX1 \mcell3_reg[5]  ( .D(n163), .CLK(PCLK), .Q(mcell3[5]) );
  DFFPOSX1 \mcell3_reg[4]  ( .D(n164), .CLK(PCLK), .Q(mcell3[4]) );
  DFFPOSX1 \mcell3_reg[3]  ( .D(n165), .CLK(PCLK), .Q(mcell3[3]) );
  DFFPOSX1 \mcell3_reg[2]  ( .D(n166), .CLK(PCLK), .Q(mcell3[2]) );
  DFFPOSX1 \mcell3_reg[1]  ( .D(n167), .CLK(PCLK), .Q(mcell3[1]) );
  DFFPOSX1 \mcell3_reg[0]  ( .D(n168), .CLK(PCLK), .Q(mcell3[0]) );
  DFFPOSX1 \mcell2_reg[7]  ( .D(n169), .CLK(PCLK), .Q(mcell2[7]) );
  DFFPOSX1 \mcell2_reg[6]  ( .D(n170), .CLK(PCLK), .Q(mcell2[6]) );
  DFFPOSX1 \mcell2_reg[5]  ( .D(n171), .CLK(PCLK), .Q(mcell2[5]) );
  DFFPOSX1 \mcell2_reg[4]  ( .D(n172), .CLK(PCLK), .Q(mcell2[4]) );
  DFFPOSX1 \mcell2_reg[3]  ( .D(n173), .CLK(PCLK), .Q(mcell2[3]) );
  DFFPOSX1 \mcell2_reg[2]  ( .D(n174), .CLK(PCLK), .Q(mcell2[2]) );
  DFFPOSX1 \mcell2_reg[1]  ( .D(n175), .CLK(PCLK), .Q(mcell2[1]) );
  DFFPOSX1 \mcell2_reg[0]  ( .D(n176), .CLK(PCLK), .Q(mcell2[0]) );
  DFFPOSX1 flag2_reg ( .D(n195), .CLK(PCLK), .Q(flag2) );
  DFFPOSX1 \mcell0_reg[7]  ( .D(n185), .CLK(PCLK), .Q(mcell0[7]) );
  DFFPOSX1 \TxDATA_reg[7]  ( .D(n8), .CLK(PCLK), .Q(TxDATA[7]) );
  DFFPOSX1 \mcell0_reg[6]  ( .D(n186), .CLK(PCLK), .Q(mcell0[6]) );
  DFFPOSX1 \TxDATA_reg[6]  ( .D(n7), .CLK(PCLK), .Q(TxDATA[6]) );
  DFFPOSX1 \mcell0_reg[5]  ( .D(n187), .CLK(PCLK), .Q(mcell0[5]) );
  DFFPOSX1 \TxDATA_reg[5]  ( .D(n6), .CLK(PCLK), .Q(TxDATA[5]) );
  DFFPOSX1 \mcell0_reg[4]  ( .D(n188), .CLK(PCLK), .Q(mcell0[4]) );
  DFFPOSX1 \TxDATA_reg[4]  ( .D(n5), .CLK(PCLK), .Q(TxDATA[4]) );
  DFFPOSX1 \mcell0_reg[3]  ( .D(n189), .CLK(PCLK), .Q(mcell0[3]) );
  DFFPOSX1 \TxDATA_reg[3]  ( .D(n4), .CLK(PCLK), .Q(TxDATA[3]) );
  DFFPOSX1 \mcell0_reg[2]  ( .D(n190), .CLK(PCLK), .Q(mcell0[2]) );
  DFFPOSX1 \TxDATA_reg[2]  ( .D(n3), .CLK(PCLK), .Q(TxDATA[2]) );
  DFFPOSX1 \mcell0_reg[1]  ( .D(n191), .CLK(PCLK), .Q(mcell0[1]) );
  DFFPOSX1 \TxDATA_reg[1]  ( .D(n2), .CLK(PCLK), .Q(TxDATA[1]) );
  DFFPOSX1 \mcell0_reg[0]  ( .D(n192), .CLK(PCLK), .Q(mcell0[0]) );
  DFFPOSX1 \TxDATA_reg[0]  ( .D(n1), .CLK(PCLK), .Q(TxDATA[0]) );
  AOI22X1 U38 ( .A(n417), .B(n37), .C(TxDATA[7]), .D(n468), .Y(n35) );
  AOI22X1 U40 ( .A(mcell0[7]), .B(n75), .C(mcell3[7]), .D(n68), .Y(n39) );
  AOI22X1 U41 ( .A(mcell2[7]), .B(n70), .C(mcell1[7]), .D(n69), .Y(n38) );
  AOI22X1 U42 ( .A(n416), .B(n37), .C(TxDATA[6]), .D(n468), .Y(n40) );
  AOI22X1 U44 ( .A(mcell0[6]), .B(n75), .C(mcell3[6]), .D(n68), .Y(n43) );
  AOI22X1 U45 ( .A(mcell2[6]), .B(n70), .C(mcell1[6]), .D(n69), .Y(n42) );
  AOI22X1 U46 ( .A(n415), .B(n37), .C(TxDATA[5]), .D(n468), .Y(n44) );
  AOI22X1 U48 ( .A(mcell0[5]), .B(n75), .C(mcell3[5]), .D(n68), .Y(n47) );
  AOI22X1 U49 ( .A(mcell2[5]), .B(n70), .C(mcell1[5]), .D(n69), .Y(n46) );
  AOI22X1 U50 ( .A(n414), .B(n37), .C(TxDATA[4]), .D(n468), .Y(n48) );
  AOI22X1 U52 ( .A(mcell0[4]), .B(n75), .C(mcell3[4]), .D(n68), .Y(n51) );
  AOI22X1 U53 ( .A(mcell2[4]), .B(n70), .C(mcell1[4]), .D(n69), .Y(n50) );
  AOI22X1 U54 ( .A(n413), .B(n37), .C(TxDATA[3]), .D(n468), .Y(n52) );
  AOI22X1 U56 ( .A(mcell0[3]), .B(n75), .C(mcell3[3]), .D(n68), .Y(n55) );
  AOI22X1 U57 ( .A(mcell2[3]), .B(n70), .C(mcell1[3]), .D(n69), .Y(n54) );
  AOI22X1 U58 ( .A(n412), .B(n37), .C(TxDATA[2]), .D(n468), .Y(n56) );
  AOI22X1 U60 ( .A(mcell0[2]), .B(n75), .C(mcell3[2]), .D(n68), .Y(n59) );
  AOI22X1 U61 ( .A(mcell2[2]), .B(n70), .C(mcell1[2]), .D(n69), .Y(n58) );
  AOI22X1 U62 ( .A(n411), .B(n37), .C(TxDATA[1]), .D(n468), .Y(n60) );
  AOI22X1 U64 ( .A(mcell0[1]), .B(n75), .C(mcell3[1]), .D(n68), .Y(n63) );
  AOI22X1 U65 ( .A(mcell2[1]), .B(n70), .C(mcell1[1]), .D(n69), .Y(n62) );
  AOI22X1 U66 ( .A(n410), .B(n37), .C(TxDATA[0]), .D(n468), .Y(n64) );
  AOI22X1 U68 ( .A(mcell0[0]), .B(n75), .C(mcell3[0]), .D(n68), .Y(n67) );
  AOI22X1 U69 ( .A(mcell2[0]), .B(n70), .C(mcell1[0]), .D(n69), .Y(n66) );
  OAI21X1 U70 ( .A(n13), .B(n71), .C(n72), .Y(n198) );
  OAI21X1 U71 ( .A(n438), .B(n74), .C(n71), .Y(n72) );
  OAI21X1 U72 ( .A(n448), .B(n467), .C(n474), .Y(n71) );
  OAI21X1 U73 ( .A(n17), .B(n37), .C(n407), .Y(n197) );
  NAND3X1 U74 ( .A(n37), .B(n17), .C(CLEAR_B), .Y(n78) );
  OAI21X1 U75 ( .A(n468), .B(n14), .C(n409), .Y(n196) );
  OAI21X1 U77 ( .A(n24), .B(n80), .C(n81), .Y(n195) );
  OAI21X1 U78 ( .A(n74), .B(n82), .C(n80), .Y(n81) );
  OAI21X1 U79 ( .A(n475), .B(n455), .C(n439), .Y(n82) );
  OAI21X1 U80 ( .A(n462), .B(n467), .C(n473), .Y(n80) );
  AOI21X1 U81 ( .A(n87), .B(n446), .C(n475), .Y(n194) );
  OAI21X1 U83 ( .A(n88), .B(n461), .C(n440), .Y(n193) );
  OAI21X1 U85 ( .A(n474), .B(n32), .C(n453), .Y(n192) );
  OAI21X1 U87 ( .A(n474), .B(n31), .C(n444), .Y(n191) );
  OAI21X1 U89 ( .A(n474), .B(n30), .C(n437), .Y(n190) );
  OAI21X1 U91 ( .A(n474), .B(n29), .C(n431), .Y(n189) );
  OAI21X1 U93 ( .A(n474), .B(n28), .C(n428), .Y(n188) );
  OAI21X1 U95 ( .A(n474), .B(n27), .C(n424), .Y(n187) );
  OAI21X1 U97 ( .A(n474), .B(n26), .C(n420), .Y(n186) );
  OAI21X1 U99 ( .A(n474), .B(n25), .C(n408), .Y(n185) );
  OAI21X1 U101 ( .A(n466), .B(n475), .C(n461), .Y(n77) );
  OAI21X1 U102 ( .A(n32), .B(n470), .C(n441), .Y(n184) );
  OAI21X1 U104 ( .A(n31), .B(n469), .C(n463), .Y(n183) );
  OAI21X1 U106 ( .A(n30), .B(n469), .C(n456), .Y(n182) );
  OAI21X1 U108 ( .A(n29), .B(n469), .C(n450), .Y(n181) );
  OAI21X1 U110 ( .A(n28), .B(n469), .C(n421), .Y(n180) );
  OAI21X1 U112 ( .A(n27), .B(n469), .C(n434), .Y(n179) );
  OAI21X1 U114 ( .A(n26), .B(n469), .C(n429), .Y(n178) );
  OAI21X1 U116 ( .A(n25), .B(n469), .C(n425), .Y(n177) );
  OAI21X1 U118 ( .A(n32), .B(n473), .C(n458), .Y(n176) );
  OAI21X1 U120 ( .A(n31), .B(n473), .C(n452), .Y(n175) );
  OAI21X1 U122 ( .A(n30), .B(n473), .C(n443), .Y(n174) );
  OAI21X1 U124 ( .A(n29), .B(n473), .C(n436), .Y(n173) );
  OAI21X1 U126 ( .A(n28), .B(n473), .C(n430), .Y(n172) );
  OAI21X1 U128 ( .A(n27), .B(n473), .C(n427), .Y(n171) );
  OAI21X1 U130 ( .A(n26), .B(n473), .C(n423), .Y(n170) );
  OAI21X1 U132 ( .A(n25), .B(n473), .C(n419), .Y(n169) );
  OAI21X1 U134 ( .A(n466), .B(n475), .C(n91), .Y(n84) );
  OAI21X1 U136 ( .A(n32), .B(n472), .C(n464), .Y(n168) );
  OAI21X1 U138 ( .A(n31), .B(n471), .C(n457), .Y(n167) );
  OAI21X1 U140 ( .A(n30), .B(n471), .C(n451), .Y(n166) );
  OAI21X1 U142 ( .A(n29), .B(n471), .C(n442), .Y(n165) );
  OAI21X1 U144 ( .A(n28), .B(n471), .C(n435), .Y(n164) );
  OAI21X1 U146 ( .A(n27), .B(n471), .C(n418), .Y(n163) );
  OAI21X1 U148 ( .A(n26), .B(n471), .C(n426), .Y(n162) );
  OAI21X1 U150 ( .A(n25), .B(n471), .C(n422), .Y(n161) );
  OAI21X1 U152 ( .A(n23), .B(n126), .C(n432), .Y(n160) );
  NAND3X1 U154 ( .A(n439), .B(n37), .C(n14), .Y(n128) );
  AOI21X1 U155 ( .A(n462), .B(n455), .C(n475), .Y(n73) );
  OAI21X1 U156 ( .A(n449), .B(n467), .C(n472), .Y(n126) );
  OAI21X1 U157 ( .A(n88), .B(n475), .C(n91), .Y(n117) );
  OAI21X1 U159 ( .A(n21), .B(n129), .C(n130), .Y(n159) );
  OAI21X1 U160 ( .A(n74), .B(n131), .C(n129), .Y(n130) );
  OAI21X1 U161 ( .A(n475), .B(n462), .C(n439), .Y(n131) );
  OAI21X1 U165 ( .A(n475), .B(n449), .C(n37), .Y(n74) );
  OAI21X1 U168 ( .A(n455), .B(n467), .C(n470), .Y(n129) );
  OAI21X1 U169 ( .A(n88), .B(n475), .C(n461), .Y(n100) );
  NAND3X1 U171 ( .A(PSEL), .B(n459), .C(PWRITE), .Y(n86) );
  NAND3X1 U172 ( .A(flag3), .B(flag2), .C(n460), .Y(n34) );
  NAND3X1 U175 ( .A(n13), .B(n21), .C(n133), .Y(n293) );
  AND2X1 U3 ( .A(n391), .B(n399), .Y(n65) );
  AND2X1 U4 ( .A(n392), .B(n400), .Y(n61) );
  AND2X1 U5 ( .A(n393), .B(n401), .Y(n57) );
  AND2X1 U6 ( .A(n394), .B(n402), .Y(n53) );
  AND2X1 U7 ( .A(n395), .B(n403), .Y(n49) );
  AND2X1 U8 ( .A(n396), .B(n404), .Y(n45) );
  AND2X1 U9 ( .A(n397), .B(n405), .Y(n41) );
  AND2X1 U10 ( .A(n398), .B(n406), .Y(n36) );
  AND2X1 U11 ( .A(SENT), .B(VALID), .Y(n76) );
  AND2X1 U12 ( .A(n126), .B(n433), .Y(n127) );
  AND2X1 U13 ( .A(CLEAR_B), .B(n467), .Y(n468) );
  OR2X1 U14 ( .A(n454), .B(wp[0]), .Y(n87) );
  BUFX2 U15 ( .A(n64), .Y(n383) );
  BUFX2 U16 ( .A(n60), .Y(n384) );
  BUFX2 U17 ( .A(n56), .Y(n385) );
  BUFX2 U18 ( .A(n52), .Y(n386) );
  BUFX2 U19 ( .A(n48), .Y(n387) );
  BUFX2 U20 ( .A(n44), .Y(n388) );
  BUFX2 U21 ( .A(n40), .Y(n389) );
  BUFX2 U22 ( .A(n35), .Y(n390) );
  BUFX2 U23 ( .A(n66), .Y(n391) );
  BUFX2 U24 ( .A(n62), .Y(n392) );
  BUFX2 U25 ( .A(n58), .Y(n393) );
  BUFX2 U26 ( .A(n54), .Y(n394) );
  BUFX2 U27 ( .A(n50), .Y(n395) );
  BUFX2 U28 ( .A(n46), .Y(n396) );
  BUFX2 U29 ( .A(n42), .Y(n397) );
  BUFX2 U30 ( .A(n38), .Y(n398) );
  BUFX2 U31 ( .A(n67), .Y(n399) );
  BUFX2 U32 ( .A(n63), .Y(n400) );
  BUFX2 U33 ( .A(n59), .Y(n401) );
  BUFX2 U34 ( .A(n55), .Y(n402) );
  BUFX2 U35 ( .A(n51), .Y(n403) );
  BUFX2 U36 ( .A(n47), .Y(n404) );
  BUFX2 U37 ( .A(n43), .Y(n405) );
  BUFX2 U39 ( .A(n39), .Y(n406) );
  BUFX2 U43 ( .A(n78), .Y(n407) );
  AND2X1 U47 ( .A(mcell0[7]), .B(n474), .Y(n99) );
  INVX1 U51 ( .A(n99), .Y(n408) );
  AND2X1 U55 ( .A(n468), .B(rp[1]), .Y(n79) );
  INVX1 U59 ( .A(n79), .Y(n409) );
  INVX1 U63 ( .A(n65), .Y(n410) );
  INVX1 U67 ( .A(n61), .Y(n411) );
  INVX1 U76 ( .A(n57), .Y(n412) );
  INVX1 U82 ( .A(n53), .Y(n413) );
  INVX1 U84 ( .A(n49), .Y(n414) );
  INVX1 U86 ( .A(n45), .Y(n415) );
  INVX1 U88 ( .A(n41), .Y(n416) );
  INVX1 U90 ( .A(n36), .Y(n417) );
  AND2X1 U92 ( .A(mcell3[5]), .B(n472), .Y(n123) );
  INVX1 U94 ( .A(n123), .Y(n418) );
  AND2X1 U96 ( .A(mcell2[7]), .B(n473), .Y(n116) );
  INVX1 U98 ( .A(n116), .Y(n419) );
  AND2X1 U100 ( .A(mcell0[6]), .B(n474), .Y(n98) );
  INVX1 U103 ( .A(n98), .Y(n420) );
  AND2X1 U105 ( .A(mcell1[4]), .B(n470), .Y(n105) );
  INVX1 U107 ( .A(n105), .Y(n421) );
  AND2X1 U109 ( .A(mcell3[7]), .B(n472), .Y(n125) );
  INVX1 U111 ( .A(n125), .Y(n422) );
  AND2X1 U113 ( .A(mcell2[6]), .B(n473), .Y(n115) );
  INVX1 U115 ( .A(n115), .Y(n423) );
  AND2X1 U117 ( .A(mcell0[5]), .B(n474), .Y(n97) );
  INVX1 U119 ( .A(n97), .Y(n424) );
  AND2X1 U121 ( .A(mcell1[7]), .B(n470), .Y(n108) );
  INVX1 U123 ( .A(n108), .Y(n425) );
  AND2X1 U125 ( .A(mcell3[6]), .B(n472), .Y(n124) );
  INVX1 U127 ( .A(n124), .Y(n426) );
  AND2X1 U129 ( .A(mcell2[5]), .B(n473), .Y(n114) );
  INVX1 U131 ( .A(n114), .Y(n427) );
  AND2X1 U133 ( .A(mcell0[4]), .B(n474), .Y(n96) );
  INVX1 U135 ( .A(n96), .Y(n428) );
  AND2X1 U137 ( .A(mcell1[6]), .B(n470), .Y(n107) );
  INVX1 U139 ( .A(n107), .Y(n429) );
  AND2X1 U141 ( .A(mcell2[4]), .B(n473), .Y(n113) );
  INVX1 U143 ( .A(n113), .Y(n430) );
  AND2X1 U145 ( .A(mcell0[3]), .B(n474), .Y(n95) );
  INVX1 U147 ( .A(n95), .Y(n431) );
  INVX1 U149 ( .A(n127), .Y(n432) );
  BUFX2 U151 ( .A(n128), .Y(n433) );
  AND2X1 U153 ( .A(mcell1[5]), .B(n470), .Y(n106) );
  INVX1 U158 ( .A(n106), .Y(n434) );
  AND2X1 U162 ( .A(mcell3[4]), .B(n472), .Y(n122) );
  INVX1 U163 ( .A(n122), .Y(n435) );
  AND2X1 U164 ( .A(mcell2[3]), .B(n473), .Y(n112) );
  INVX1 U166 ( .A(n112), .Y(n436) );
  AND2X1 U167 ( .A(mcell0[2]), .B(n474), .Y(n94) );
  INVX1 U170 ( .A(n94), .Y(n437) );
  BUFX2 U173 ( .A(n73), .Y(n438) );
  AND2X1 U174 ( .A(n75), .B(CLEAR_B), .Y(n83) );
  INVX1 U176 ( .A(n83), .Y(n439) );
  AND2X1 U177 ( .A(n88), .B(n465), .Y(n90) );
  INVX1 U178 ( .A(n90), .Y(n440) );
  AND2X1 U179 ( .A(mcell1[0]), .B(n470), .Y(n101) );
  INVX1 U180 ( .A(n101), .Y(n441) );
  AND2X1 U181 ( .A(mcell3[3]), .B(n472), .Y(n121) );
  INVX1 U182 ( .A(n121), .Y(n442) );
  AND2X1 U183 ( .A(mcell2[2]), .B(n473), .Y(n111) );
  INVX1 U184 ( .A(n111), .Y(n443) );
  AND2X1 U185 ( .A(mcell0[1]), .B(n474), .Y(n93) );
  INVX1 U186 ( .A(n93), .Y(n444) );
  BUFX2 U187 ( .A(n194), .Y(n445) );
  AND2X1 U188 ( .A(wp[0]), .B(n454), .Y(n85) );
  INVX1 U189 ( .A(n85), .Y(n446) );
  BUFX2 U190 ( .A(n293), .Y(VALID) );
  AND2X1 U191 ( .A(n17), .B(n20), .Y(n75) );
  INVX1 U192 ( .A(n75), .Y(n448) );
  AND2X1 U193 ( .A(rp[1]), .B(rp[0]), .Y(n68) );
  INVX1 U194 ( .A(n68), .Y(n449) );
  AND2X1 U195 ( .A(mcell1[3]), .B(n470), .Y(n104) );
  INVX1 U196 ( .A(n104), .Y(n450) );
  AND2X1 U197 ( .A(mcell3[2]), .B(n472), .Y(n120) );
  INVX1 U198 ( .A(n120), .Y(n451) );
  AND2X1 U199 ( .A(mcell2[1]), .B(n473), .Y(n110) );
  INVX1 U200 ( .A(n110), .Y(n452) );
  AND2X1 U201 ( .A(mcell0[0]), .B(n474), .Y(n92) );
  INVX1 U202 ( .A(n92), .Y(n453) );
  BUFX2 U203 ( .A(n86), .Y(n454) );
  AND2X1 U204 ( .A(rp[0]), .B(n20), .Y(n69) );
  INVX1 U205 ( .A(n69), .Y(n455) );
  AND2X1 U206 ( .A(mcell1[2]), .B(n470), .Y(n103) );
  INVX1 U207 ( .A(n103), .Y(n456) );
  AND2X1 U208 ( .A(mcell3[1]), .B(n472), .Y(n119) );
  INVX1 U209 ( .A(n119), .Y(n457) );
  AND2X1 U210 ( .A(mcell2[0]), .B(n473), .Y(n109) );
  INVX1 U211 ( .A(n109), .Y(n458) );
  BUFX2 U212 ( .A(n34), .Y(n459) );
  OR2X1 U213 ( .A(n21), .B(n13), .Y(n132) );
  INVX1 U214 ( .A(n132), .Y(n460) );
  AND2X1 U215 ( .A(wp[1]), .B(CLEAR_B), .Y(n89) );
  INVX1 U216 ( .A(n89), .Y(n461) );
  AND2X1 U217 ( .A(rp[1]), .B(n17), .Y(n70) );
  INVX1 U218 ( .A(n70), .Y(n462) );
  AND2X1 U219 ( .A(mcell1[1]), .B(n470), .Y(n102) );
  INVX1 U220 ( .A(n102), .Y(n463) );
  AND2X1 U221 ( .A(mcell3[0]), .B(n472), .Y(n118) );
  INVX1 U222 ( .A(n118), .Y(n464) );
  OR2X1 U223 ( .A(n475), .B(wp[1]), .Y(n91) );
  INVX1 U224 ( .A(n91), .Y(n465) );
  INVX1 U225 ( .A(n87), .Y(n466) );
  INVX1 U226 ( .A(n76), .Y(n467) );
  BUFX2 U227 ( .A(n117), .Y(n472) );
  BUFX2 U228 ( .A(n100), .Y(n470) );
  BUFX2 U229 ( .A(n117), .Y(n471) );
  BUFX2 U230 ( .A(n100), .Y(n469) );
  INVX1 U231 ( .A(n438), .Y(n14) );
  INVX1 U232 ( .A(CLEAR_B), .Y(n475) );
  INVX1 U233 ( .A(n468), .Y(n37) );
  BUFX2 U234 ( .A(n84), .Y(n473) );
  BUFX2 U235 ( .A(n77), .Y(n474) );
  AND2X1 U236 ( .A(n23), .B(n24), .Y(n133) );
  INVX1 U237 ( .A(n459), .Y(SSPTXINTR) );
  AND2X1 U238 ( .A(wp[0]), .B(n10), .Y(n88) );
  INVX1 U239 ( .A(n454), .Y(n10) );
  INVX1 U240 ( .A(n383), .Y(n1) );
  INVX1 U241 ( .A(n384), .Y(n2) );
  INVX1 U242 ( .A(n385), .Y(n3) );
  INVX1 U243 ( .A(n386), .Y(n4) );
  INVX1 U244 ( .A(n387), .Y(n5) );
  INVX1 U245 ( .A(n388), .Y(n6) );
  INVX1 U246 ( .A(n389), .Y(n7) );
  INVX1 U247 ( .A(n390), .Y(n8) );
  INVX1 U248 ( .A(PWDATA[0]), .Y(n32) );
  INVX1 U249 ( .A(PWDATA[1]), .Y(n31) );
  INVX1 U250 ( .A(PWDATA[2]), .Y(n30) );
  INVX1 U251 ( .A(PWDATA[3]), .Y(n29) );
  INVX1 U252 ( .A(PWDATA[4]), .Y(n28) );
  INVX1 U253 ( .A(PWDATA[5]), .Y(n27) );
  INVX1 U254 ( .A(PWDATA[6]), .Y(n26) );
  INVX1 U255 ( .A(PWDATA[7]), .Y(n25) );
  INVX1 U256 ( .A(rp[0]), .Y(n17) );
  INVX1 U257 ( .A(flag1), .Y(n21) );
  INVX1 U258 ( .A(flag0), .Y(n13) );
  INVX1 U259 ( .A(flag2), .Y(n24) );
  INVX1 U260 ( .A(flag3), .Y(n23) );
  INVX1 U261 ( .A(rp[1]), .Y(n20) );
endmodule


module TxLogic ( PCLK, CLEAR_B, VALID, TxDATA, SSPOE_B, SSPTXD, SSPFSSOUT, 
        SSPCLKOUT, SENT );
  input [7:0] TxDATA;
  input PCLK, CLEAR_B, VALID;
  output SSPOE_B, SSPTXD, SSPFSSOUT, SSPCLKOUT, SENT;
  wire   n99, \TxDATA_temp[0] , cnt, N24, counter, state_e, n74, n75, n76, n77,
         n78, n79, n80, n1, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n174;
  wire   [3:0] state;

  DFFPOSX1 SSPCLKOUT_reg ( .D(n168), .CLK(PCLK), .Q(n99) );
  DFFPOSX1 \TxDATA_temp_reg[0]  ( .D(TxDATA[0]), .CLK(SSPCLKOUT), .Q(
        \TxDATA_temp[0] ) );
  DFFPOSX1 counter_reg ( .D(n170), .CLK(PCLK), .Q(counter) );
  DFFPOSX1 state_e_reg ( .D(n80), .CLK(PCLK), .Q(state_e) );
  DFFPOSX1 \state_reg[0]  ( .D(n79), .CLK(SSPCLKOUT), .Q(state[0]) );
  DFFPOSX1 \state_reg[3]  ( .D(n142), .CLK(SSPCLKOUT), .Q(state[3]) );
  DFFPOSX1 \state_reg[1]  ( .D(n77), .CLK(SSPCLKOUT), .Q(state[1]) );
  DFFPOSX1 \state_reg[2]  ( .D(n76), .CLK(SSPCLKOUT), .Q(state[2]) );
  DFFPOSX1 cnt_reg ( .D(N24), .CLK(PCLK), .Q(cnt) );
  DFFPOSX1 SENT_reg ( .D(N24), .CLK(PCLK), .Q(SENT) );
  DFFPOSX1 SSPFSSOUT_reg ( .D(n75), .CLK(SSPCLKOUT), .Q(SSPFSSOUT) );
  DFFPOSX1 SSPTXD_reg ( .D(n1), .CLK(SSPCLKOUT), .Q(SSPTXD) );
  DFFPOSX1 SSPOE_B_reg ( .D(n74), .CLK(PCLK), .Q(SSPOE_B) );
  AOI22X1 U30 ( .A(n23), .B(n150), .C(SSPTXD), .D(n155), .Y(n21) );
  NAND3X1 U31 ( .A(n147), .B(n151), .C(n26), .Y(n22) );
  AOI22X1 U32 ( .A(TxDATA[4]), .B(n6), .C(TxDATA[5]), .D(n12), .Y(n28) );
  AOI22X1 U33 ( .A(TxDATA[1]), .B(n13), .C(TxDATA[3]), .D(n11), .Y(n27) );
  AOI22X1 U34 ( .A(TxDATA[6]), .B(n8), .C(TxDATA[2]), .D(n7), .Y(n25) );
  AOI22X1 U35 ( .A(TxDATA[7]), .B(n10), .C(\TxDATA_temp[0] ), .D(n15), .Y(n24)
         );
  OAI21X1 U38 ( .A(counter), .B(n4), .C(CLEAR_B), .Y(n80) );
  OAI21X1 U39 ( .A(n14), .B(n157), .C(n145), .Y(n79) );
  NAND3X1 U40 ( .A(n14), .B(n4), .C(n156), .Y(n34) );
  NAND3X1 U41 ( .A(n157), .B(n4), .C(n152), .Y(n78) );
  AOI22X1 U42 ( .A(n15), .B(n156), .C(n9), .D(n20), .Y(n36) );
  NAND3X1 U43 ( .A(n148), .B(n172), .C(n38), .Y(n35) );
  NOR3X1 U44 ( .A(n10), .B(n13), .C(n12), .Y(n38) );
  OAI21X1 U46 ( .A(state[1]), .B(n154), .C(n146), .Y(n77) );
  OAI21X1 U48 ( .A(n149), .B(n18), .C(n144), .Y(n76) );
  NAND3X1 U49 ( .A(state[1]), .B(n18), .C(n153), .Y(n44) );
  NAND3X1 U50 ( .A(n157), .B(n4), .C(state[0]), .Y(n40) );
  AOI21X1 U51 ( .A(n17), .B(n4), .C(n42), .Y(n43) );
  OAI21X1 U52 ( .A(state_e), .B(state[0]), .C(n157), .Y(n42) );
  NAND3X1 U53 ( .A(n169), .B(n4), .C(n32), .Y(n33) );
  NOR3X1 U55 ( .A(n159), .B(n15), .C(n13), .Y(n47) );
  NAND3X1 U56 ( .A(n50), .B(n14), .C(state[2]), .Y(n49) );
  NAND3X1 U58 ( .A(n14), .B(n18), .C(n50), .Y(n39) );
  NAND3X1 U59 ( .A(n50), .B(n18), .C(state[0]), .Y(n29) );
  NOR3X1 U60 ( .A(n161), .B(n10), .C(n7), .Y(n46) );
  NAND3X1 U61 ( .A(state[2]), .B(state[0]), .C(n54), .Y(n53) );
  NAND3X1 U63 ( .A(state[0]), .B(n18), .C(n54), .Y(n31) );
  NAND3X1 U64 ( .A(state[2]), .B(n14), .C(n54), .Y(n30) );
  OAI21X1 U65 ( .A(n56), .B(n167), .C(n166), .Y(n75) );
  OAI21X1 U68 ( .A(n56), .B(n20), .C(n163), .Y(n59) );
  NAND3X1 U69 ( .A(n14), .B(n18), .C(n54), .Y(n55) );
  OAI21X1 U70 ( .A(n60), .B(n16), .C(n160), .Y(n74) );
  NOR3X1 U72 ( .A(n174), .B(cnt), .C(n56), .Y(N24) );
  NAND3X1 U73 ( .A(n17), .B(n18), .C(n62), .Y(n45) );
  NAND3X1 U74 ( .A(state[0]), .B(n50), .C(state[2]), .Y(n51) );
  AND2X1 U3 ( .A(n162), .B(n169), .Y(n56) );
  AND2X1 U4 ( .A(SSPFSSOUT), .B(n167), .Y(n58) );
  AND2X1 U5 ( .A(n141), .B(n143), .Y(n26) );
  BUFX2 U6 ( .A(n21), .Y(n138) );
  BUFX2 U7 ( .A(n53), .Y(n139) );
  BUFX2 U8 ( .A(n49), .Y(n140) );
  BUFX2 U9 ( .A(n27), .Y(n141) );
  BUFX2 U10 ( .A(n78), .Y(n142) );
  BUFX2 U11 ( .A(n28), .Y(n143) );
  BUFX2 U12 ( .A(n44), .Y(n144) );
  BUFX2 U13 ( .A(n34), .Y(n145) );
  AND2X1 U14 ( .A(state[1]), .B(n42), .Y(n41) );
  INVX1 U15 ( .A(n41), .Y(n146) );
  BUFX2 U16 ( .A(n24), .Y(n147) );
  AND2X1 U17 ( .A(n15), .B(n20), .Y(n37) );
  INVX1 U18 ( .A(n37), .Y(n148) );
  BUFX2 U19 ( .A(n43), .Y(n149) );
  BUFX2 U20 ( .A(n22), .Y(n150) );
  BUFX2 U21 ( .A(n25), .Y(n151) );
  BUFX2 U22 ( .A(n36), .Y(n152) );
  INVX1 U23 ( .A(n154), .Y(n153) );
  BUFX2 U24 ( .A(n40), .Y(n154) );
  AND2X1 U25 ( .A(n4), .B(n158), .Y(n23) );
  INVX1 U26 ( .A(n23), .Y(n155) );
  BUFX2 U27 ( .A(n35), .Y(n156) );
  BUFX2 U28 ( .A(n33), .Y(n157) );
  AND2X1 U29 ( .A(n46), .B(n47), .Y(n32) );
  INVX1 U36 ( .A(n32), .Y(n158) );
  AND2X1 U37 ( .A(n171), .B(n165), .Y(n48) );
  INVX1 U45 ( .A(n48), .Y(n159) );
  AND2X1 U47 ( .A(SSPOE_B), .B(n60), .Y(n61) );
  INVX1 U54 ( .A(n61), .Y(n160) );
  AND2X1 U57 ( .A(n172), .B(n164), .Y(n52) );
  INVX1 U62 ( .A(n52), .Y(n161) );
  BUFX2 U66 ( .A(n51), .Y(n162) );
  BUFX2 U67 ( .A(n55), .Y(n163) );
  BUFX2 U71 ( .A(n31), .Y(n164) );
  BUFX2 U75 ( .A(n39), .Y(n165) );
  INVX1 U76 ( .A(n58), .Y(n166) );
  AND2X1 U77 ( .A(n59), .B(n4), .Y(n57) );
  INVX1 U78 ( .A(n57), .Y(n167) );
  OR2X1 U79 ( .A(SSPCLKOUT), .B(n174), .Y(n63) );
  INVX1 U80 ( .A(n63), .Y(n168) );
  BUFX2 U81 ( .A(n45), .Y(n169) );
  OR2X1 U82 ( .A(n174), .B(counter), .Y(n64) );
  INVX1 U83 ( .A(n64), .Y(n170) );
  BUFX2 U84 ( .A(n29), .Y(n171) );
  BUFX2 U85 ( .A(n30), .Y(n172) );
  INVX1 U86 ( .A(VALID), .Y(n20) );
  INVX1 U87 ( .A(n163), .Y(n10) );
  INVX1 U88 ( .A(n165), .Y(n12) );
  INVX1 U89 ( .A(CLEAR_B), .Y(n174) );
  AND2X1 U90 ( .A(n16), .B(n17), .Y(n54) );
  INVX1 U91 ( .A(n162), .Y(n15) );
  INVX1 U92 ( .A(n169), .Y(n9) );
  INVX1 U93 ( .A(n171), .Y(n6) );
  BUFX2 U94 ( .A(n99), .Y(SSPCLKOUT) );
  AND2X1 U95 ( .A(n14), .B(state[3]), .Y(n62) );
  INVX1 U96 ( .A(n164), .Y(n8) );
  INVX1 U97 ( .A(state[2]), .Y(n18) );
  INVX1 U98 ( .A(state[0]), .Y(n14) );
  AND2X1 U99 ( .A(n9), .B(n20), .Y(n60) );
  INVX1 U100 ( .A(state_e), .Y(n4) );
  AND2X1 U101 ( .A(state[1]), .B(n16), .Y(n50) );
  INVX1 U102 ( .A(n140), .Y(n13) );
  INVX1 U103 ( .A(n139), .Y(n7) );
  INVX1 U104 ( .A(state[1]), .Y(n17) );
  INVX1 U105 ( .A(n138), .Y(n1) );
  INVX1 U106 ( .A(n172), .Y(n11) );
  INVX1 U107 ( .A(state[3]), .Y(n16) );
endmodule


module RxFIFO ( PSEL, PWRITE, RxDATA, CLEAR_B, PCLK, RECV, PRDATA, SSPRXINTR, 
        VALID );
  input [7:0] RxDATA;
  output [7:0] PRDATA;
  input PSEL, PWRITE, CLEAR_B, PCLK, RECV;
  output SSPRXINTR, VALID;
  wire   flag3, flag2, flag1, flag0, N98, N99, N101, N102, N104, N105, N107,
         N108, N110, N111, N113, N114, N116, N117, N119, N120, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n227, n318, n2, n3, n4, n5,
         n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514;
  wire   [1:0] wp;
  wire   [7:0] mcell0;
  wire   [7:0] mcell1;
  wire   [7:0] mcell2;
  wire   [7:0] mcell3;
  wire   [1:0] rp;
  tri   [7:0] PRDATA;

  DFFPOSX1 flag0_reg ( .D(n227), .CLK(PCLK), .Q(flag0) );
  DFFPOSX1 \wp_reg[0]  ( .D(n179), .CLK(PCLK), .Q(wp[0]) );
  DFFPOSX1 \wp_reg[1]  ( .D(n215), .CLK(PCLK), .Q(wp[1]) );
  DFFPOSX1 \mcell1_reg[7]  ( .D(n199), .CLK(PCLK), .Q(mcell1[7]) );
  DFFPOSX1 \mcell1_reg[6]  ( .D(n200), .CLK(PCLK), .Q(mcell1[6]) );
  DFFPOSX1 \mcell1_reg[5]  ( .D(n201), .CLK(PCLK), .Q(mcell1[5]) );
  DFFPOSX1 \mcell1_reg[4]  ( .D(n202), .CLK(PCLK), .Q(mcell1[4]) );
  DFFPOSX1 \mcell1_reg[3]  ( .D(n203), .CLK(PCLK), .Q(mcell1[3]) );
  DFFPOSX1 \mcell1_reg[2]  ( .D(n204), .CLK(PCLK), .Q(mcell1[2]) );
  DFFPOSX1 \mcell1_reg[1]  ( .D(n205), .CLK(PCLK), .Q(mcell1[1]) );
  DFFPOSX1 \mcell1_reg[0]  ( .D(n206), .CLK(PCLK), .Q(mcell1[0]) );
  DFFPOSX1 \mcell3_reg[7]  ( .D(n183), .CLK(PCLK), .Q(mcell3[7]) );
  DFFPOSX1 \mcell3_reg[6]  ( .D(n184), .CLK(PCLK), .Q(mcell3[6]) );
  DFFPOSX1 \mcell3_reg[5]  ( .D(n185), .CLK(PCLK), .Q(mcell3[5]) );
  DFFPOSX1 \mcell3_reg[4]  ( .D(n186), .CLK(PCLK), .Q(mcell3[4]) );
  DFFPOSX1 \mcell3_reg[3]  ( .D(n187), .CLK(PCLK), .Q(mcell3[3]) );
  DFFPOSX1 \mcell3_reg[2]  ( .D(n188), .CLK(PCLK), .Q(mcell3[2]) );
  DFFPOSX1 \mcell3_reg[1]  ( .D(n189), .CLK(PCLK), .Q(mcell3[1]) );
  DFFPOSX1 \mcell3_reg[0]  ( .D(n190), .CLK(PCLK), .Q(mcell3[0]) );
  DFFPOSX1 flag2_reg ( .D(n2), .CLK(PCLK), .Q(flag2) );
  DFFPOSX1 \PRDATA_tri_enable_reg[1]  ( .D(n217), .CLK(PCLK), .Q(N117) );
  DFFPOSX1 \PRDATA_tri_enable_reg[2]  ( .D(n218), .CLK(PCLK), .Q(N114) );
  DFFPOSX1 \PRDATA_tri_enable_reg[3]  ( .D(n219), .CLK(PCLK), .Q(N111) );
  DFFPOSX1 \PRDATA_tri_enable_reg[4]  ( .D(n220), .CLK(PCLK), .Q(N108) );
  DFFPOSX1 \PRDATA_tri_enable_reg[5]  ( .D(n221), .CLK(PCLK), .Q(N105) );
  DFFPOSX1 \PRDATA_tri_enable_reg[6]  ( .D(n222), .CLK(PCLK), .Q(N102) );
  DFFPOSX1 \PRDATA_tri_enable_reg[7]  ( .D(n223), .CLK(PCLK), .Q(N99) );
  DFFPOSX1 \PRDATA_tri_enable_reg[0]  ( .D(n224), .CLK(PCLK), .Q(N120) );
  DFFPOSX1 \rp_reg[0]  ( .D(n225), .CLK(PCLK), .Q(rp[0]) );
  DFFPOSX1 \rp_reg[1]  ( .D(n170), .CLK(PCLK), .Q(rp[1]) );
  DFFPOSX1 flag1_reg ( .D(n181), .CLK(PCLK), .Q(flag1) );
  DFFPOSX1 flag3_reg ( .D(n182), .CLK(PCLK), .Q(flag3) );
  DFFPOSX1 \mcell2_reg[7]  ( .D(n191), .CLK(PCLK), .Q(mcell2[7]) );
  DFFPOSX1 \mcell2_reg[6]  ( .D(n192), .CLK(PCLK), .Q(mcell2[6]) );
  DFFPOSX1 \mcell2_reg[5]  ( .D(n193), .CLK(PCLK), .Q(mcell2[5]) );
  DFFPOSX1 \mcell2_reg[4]  ( .D(n194), .CLK(PCLK), .Q(mcell2[4]) );
  DFFPOSX1 \mcell2_reg[3]  ( .D(n195), .CLK(PCLK), .Q(mcell2[3]) );
  DFFPOSX1 \mcell2_reg[2]  ( .D(n196), .CLK(PCLK), .Q(mcell2[2]) );
  DFFPOSX1 \mcell2_reg[1]  ( .D(n197), .CLK(PCLK), .Q(mcell2[1]) );
  DFFPOSX1 \mcell2_reg[0]  ( .D(n198), .CLK(PCLK), .Q(mcell2[0]) );
  DFFPOSX1 \mcell0_reg[7]  ( .D(n207), .CLK(PCLK), .Q(mcell0[7]) );
  DFFPOSX1 \PRDATA_reg[7]  ( .D(n171), .CLK(PCLK), .Q(N98) );
  DFFPOSX1 \mcell0_reg[6]  ( .D(n208), .CLK(PCLK), .Q(mcell0[6]) );
  DFFPOSX1 \PRDATA_reg[6]  ( .D(n172), .CLK(PCLK), .Q(N101) );
  DFFPOSX1 \mcell0_reg[5]  ( .D(n209), .CLK(PCLK), .Q(mcell0[5]) );
  DFFPOSX1 \PRDATA_reg[5]  ( .D(n173), .CLK(PCLK), .Q(N104) );
  DFFPOSX1 \mcell0_reg[4]  ( .D(n210), .CLK(PCLK), .Q(mcell0[4]) );
  DFFPOSX1 \PRDATA_reg[4]  ( .D(n174), .CLK(PCLK), .Q(N107) );
  DFFPOSX1 \mcell0_reg[3]  ( .D(n211), .CLK(PCLK), .Q(mcell0[3]) );
  DFFPOSX1 \PRDATA_reg[3]  ( .D(n175), .CLK(PCLK), .Q(N110) );
  DFFPOSX1 \mcell0_reg[2]  ( .D(n212), .CLK(PCLK), .Q(mcell0[2]) );
  DFFPOSX1 \PRDATA_reg[2]  ( .D(n176), .CLK(PCLK), .Q(N113) );
  DFFPOSX1 \mcell0_reg[1]  ( .D(n213), .CLK(PCLK), .Q(mcell0[1]) );
  DFFPOSX1 \PRDATA_reg[1]  ( .D(n177), .CLK(PCLK), .Q(N116) );
  DFFPOSX1 \mcell0_reg[0]  ( .D(n214), .CLK(PCLK), .Q(mcell0[0]) );
  DFFPOSX1 \PRDATA_reg[0]  ( .D(n178), .CLK(PCLK), .Q(N119) );
  TBUFX2 \PRDATA_tri[0]  ( .A(n56), .EN(n26), .Y(PRDATA[0]) );
  TBUFX2 \PRDATA_tri[1]  ( .A(n54), .EN(n19), .Y(PRDATA[1]) );
  TBUFX2 \PRDATA_tri[2]  ( .A(n52), .EN(n20), .Y(PRDATA[2]) );
  TBUFX2 \PRDATA_tri[3]  ( .A(n50), .EN(n21), .Y(PRDATA[3]) );
  TBUFX2 \PRDATA_tri[4]  ( .A(n48), .EN(n22), .Y(PRDATA[4]) );
  TBUFX2 \PRDATA_tri[5]  ( .A(n46), .EN(n23), .Y(PRDATA[5]) );
  TBUFX2 \PRDATA_tri[6]  ( .A(n44), .EN(n24), .Y(PRDATA[6]) );
  TBUFX2 \PRDATA_tri[7]  ( .A(n42), .EN(n25), .Y(PRDATA[7]) );
  OAI21X1 U73 ( .A(n492), .B(n505), .C(n430), .Y(n170) );
  NAND3X1 U74 ( .A(CLEAR_B), .B(n505), .C(rp[1]), .Y(n69) );
  OAI21X1 U75 ( .A(n512), .B(n71), .C(n429), .Y(n227) );
  NAND3X1 U76 ( .A(n73), .B(n511), .C(CLEAR_B), .Y(n72) );
  OAI21X1 U77 ( .A(n494), .B(n480), .C(flag0), .Y(n71) );
  OAI21X1 U78 ( .A(rp[0]), .B(n505), .C(n428), .Y(n225) );
  NAND3X1 U79 ( .A(CLEAR_B), .B(n505), .C(rp[0]), .Y(n78) );
  OAI21X1 U80 ( .A(n26), .B(n513), .C(n80), .Y(n224) );
  OAI21X1 U81 ( .A(n25), .B(n513), .C(n80), .Y(n223) );
  OAI21X1 U82 ( .A(n24), .B(n513), .C(n80), .Y(n222) );
  OAI21X1 U83 ( .A(n23), .B(n513), .C(n80), .Y(n221) );
  OAI21X1 U84 ( .A(n22), .B(n513), .C(n80), .Y(n220) );
  OAI21X1 U85 ( .A(n21), .B(n513), .C(n80), .Y(n219) );
  OAI21X1 U86 ( .A(n20), .B(n513), .C(n80), .Y(n218) );
  OAI21X1 U87 ( .A(n19), .B(n513), .C(n80), .Y(n217) );
  AOI21X1 U88 ( .A(flag2), .B(n436), .C(n3), .Y(n81) );
  NAND3X1 U89 ( .A(CLEAR_B), .B(n437), .C(n510), .Y(n83) );
  AOI21X1 U91 ( .A(n6), .B(n132), .C(n510), .Y(n82) );
  OAI21X1 U92 ( .A(n488), .B(n10), .C(n427), .Y(n215) );
  NAND3X1 U93 ( .A(n115), .B(n4), .C(wp[0]), .Y(n89) );
  OAI21X1 U94 ( .A(n512), .B(n55), .C(n491), .Y(n214) );
  OAI21X1 U96 ( .A(n511), .B(n53), .C(n499), .Y(n213) );
  OAI21X1 U98 ( .A(n511), .B(n51), .C(n484), .Y(n212) );
  OAI21X1 U100 ( .A(n511), .B(n49), .C(n473), .Y(n211) );
  OAI21X1 U102 ( .A(n511), .B(n47), .C(n462), .Y(n210) );
  OAI21X1 U104 ( .A(n511), .B(n45), .C(n468), .Y(n209) );
  OAI21X1 U106 ( .A(n511), .B(n43), .C(n448), .Y(n208) );
  OAI21X1 U108 ( .A(n511), .B(n41), .C(n455), .Y(n207) );
  OAI21X1 U110 ( .A(wp[1]), .B(n493), .C(CLEAR_B), .Y(n70) );
  OAI21X1 U111 ( .A(n5), .B(n18), .C(n466), .Y(n206) );
  OAI21X1 U113 ( .A(n5), .B(n17), .C(n481), .Y(n205) );
  OAI21X1 U115 ( .A(n5), .B(n16), .C(n489), .Y(n204) );
  OAI21X1 U117 ( .A(n5), .B(n15), .C(n452), .Y(n203) );
  OAI21X1 U119 ( .A(n5), .B(n14), .C(n496), .Y(n202) );
  OAI21X1 U121 ( .A(n5), .B(n13), .C(n440), .Y(n201) );
  OAI21X1 U123 ( .A(n5), .B(n12), .C(n433), .Y(n200) );
  OAI21X1 U125 ( .A(n5), .B(n11), .C(n459), .Y(n199) );
  OAI21X1 U127 ( .A(n510), .B(n40), .C(n483), .Y(n198) );
  OAI21X1 U129 ( .A(n510), .B(n39), .C(n467), .Y(n197) );
  OAI21X1 U131 ( .A(n510), .B(n38), .C(n498), .Y(n196) );
  OAI21X1 U133 ( .A(n510), .B(n37), .C(n461), .Y(n195) );
  OAI21X1 U135 ( .A(n510), .B(n36), .C(n472), .Y(n194) );
  OAI21X1 U137 ( .A(n510), .B(n35), .C(n454), .Y(n193) );
  OAI21X1 U139 ( .A(n510), .B(n34), .C(n442), .Y(n192) );
  OAI21X1 U141 ( .A(n510), .B(n33), .C(n447), .Y(n191) );
  AOI21X1 U143 ( .A(n493), .B(CLEAR_B), .C(n115), .Y(n85) );
  OAI21X1 U144 ( .A(n65), .B(n508), .C(n471), .Y(n190) );
  OAI21X1 U146 ( .A(n64), .B(n508), .C(n490), .Y(n189) );
  OAI21X1 U148 ( .A(n63), .B(n508), .C(n453), .Y(n188) );
  OAI21X1 U150 ( .A(n62), .B(n508), .C(n497), .Y(n187) );
  OAI21X1 U152 ( .A(n61), .B(n508), .C(n482), .Y(n186) );
  OAI21X1 U154 ( .A(n60), .B(n508), .C(n446), .Y(n185) );
  OAI21X1 U156 ( .A(n59), .B(n508), .C(n460), .Y(n184) );
  OAI21X1 U158 ( .A(n58), .B(n508), .C(n441), .Y(n183) );
  OAI21X1 U160 ( .A(n509), .B(n125), .C(n469), .Y(n182) );
  NAND3X1 U161 ( .A(n470), .B(n509), .C(flag3), .Y(n126) );
  OAI21X1 U163 ( .A(n77), .B(n487), .C(CLEAR_B), .Y(n125) );
  OAI21X1 U168 ( .A(n32), .B(n128), .C(n477), .Y(n181) );
  NAND3X1 U169 ( .A(CLEAR_B), .B(n478), .C(n5), .Y(n129) );
  NOR3X1 U171 ( .A(n75), .B(n77), .C(n494), .Y(n86) );
  OAI21X1 U172 ( .A(n494), .B(n503), .C(n131), .Y(n128) );
  OAI21X1 U173 ( .A(n514), .B(n10), .C(n488), .Y(n131) );
  AOI21X1 U174 ( .A(n8), .B(CLEAR_B), .C(n479), .Y(n88) );
  OAI21X1 U175 ( .A(n8), .B(n4), .C(n134), .Y(n179) );
  NAND3X1 U176 ( .A(VALID), .B(n8), .C(RECV), .Y(n98) );
  AOI21X1 U177 ( .A(VALID), .B(RECV), .C(n514), .Y(n133) );
  NAND3X1 U178 ( .A(flag3), .B(flag2), .C(n135), .Y(n318) );
  OAI21X1 U179 ( .A(n56), .B(n513), .C(n500), .Y(n178) );
  AOI22X1 U182 ( .A(mcell2[0]), .B(n132), .C(n75), .D(mcell3[0]), .Y(n139) );
  AOI22X1 U183 ( .A(mcell0[0]), .B(n77), .C(n87), .D(mcell1[0]), .Y(n138) );
  OAI21X1 U184 ( .A(n54), .B(n513), .C(n474), .Y(n177) );
  AOI22X1 U187 ( .A(mcell2[1]), .B(n132), .C(n75), .D(mcell3[1]), .Y(n143) );
  AOI22X1 U188 ( .A(mcell0[1]), .B(n77), .C(n87), .D(mcell1[1]), .Y(n142) );
  OAI21X1 U189 ( .A(n52), .B(n513), .C(n463), .Y(n176) );
  AOI22X1 U192 ( .A(mcell2[2]), .B(n132), .C(n75), .D(mcell3[2]), .Y(n147) );
  AOI22X1 U193 ( .A(mcell0[2]), .B(n77), .C(n87), .D(mcell1[2]), .Y(n146) );
  OAI21X1 U194 ( .A(n50), .B(n513), .C(n456), .Y(n175) );
  AOI22X1 U197 ( .A(mcell2[3]), .B(n132), .C(n75), .D(mcell3[3]), .Y(n151) );
  AOI22X1 U198 ( .A(mcell0[3]), .B(n77), .C(n87), .D(mcell1[3]), .Y(n150) );
  OAI21X1 U199 ( .A(n48), .B(n513), .C(n449), .Y(n174) );
  AOI22X1 U202 ( .A(mcell2[4]), .B(n132), .C(n75), .D(mcell3[4]), .Y(n155) );
  AOI22X1 U203 ( .A(mcell0[4]), .B(n77), .C(n87), .D(mcell1[4]), .Y(n154) );
  OAI21X1 U204 ( .A(n46), .B(n513), .C(n443), .Y(n173) );
  AOI22X1 U207 ( .A(mcell2[5]), .B(n132), .C(n75), .D(mcell3[5]), .Y(n159) );
  AOI22X1 U208 ( .A(mcell0[5]), .B(n77), .C(n87), .D(mcell1[5]), .Y(n158) );
  OAI21X1 U209 ( .A(n44), .B(n513), .C(n432), .Y(n172) );
  AOI22X1 U212 ( .A(mcell2[6]), .B(n132), .C(n75), .D(mcell3[6]), .Y(n163) );
  AOI22X1 U213 ( .A(mcell0[6]), .B(n77), .C(n87), .D(mcell1[6]), .Y(n162) );
  OAI21X1 U214 ( .A(n42), .B(n513), .C(n431), .Y(n171) );
  AOI22X1 U217 ( .A(mcell2[7]), .B(n132), .C(n75), .D(mcell3[7]), .Y(n167) );
  AOI22X1 U219 ( .A(mcell0[7]), .B(n77), .C(n87), .D(mcell1[7]), .Y(n166) );
  NAND3X1 U224 ( .A(n495), .B(n57), .C(PSEL), .Y(n76) );
  NAND3X1 U225 ( .A(n7), .B(n32), .C(n485), .Y(n168) );
  AND2X1 U3 ( .A(n424), .B(n502), .Y(n137) );
  AND2X1 U4 ( .A(n423), .B(n476), .Y(n141) );
  AND2X1 U5 ( .A(n422), .B(n465), .Y(n145) );
  AND2X1 U6 ( .A(n421), .B(n458), .Y(n149) );
  AND2X1 U7 ( .A(n420), .B(n451), .Y(n153) );
  AND2X1 U8 ( .A(n419), .B(n445), .Y(n157) );
  AND2X1 U9 ( .A(n418), .B(n426), .Y(n161) );
  AND2X1 U10 ( .A(n417), .B(n425), .Y(n165) );
  AND2X1 U11 ( .A(n501), .B(n513), .Y(n136) );
  AND2X1 U12 ( .A(n475), .B(n513), .Y(n140) );
  AND2X1 U13 ( .A(n464), .B(n513), .Y(n144) );
  AND2X1 U14 ( .A(n457), .B(n513), .Y(n148) );
  AND2X1 U15 ( .A(n450), .B(n513), .Y(n152) );
  AND2X1 U16 ( .A(n444), .B(n513), .Y(n156) );
  OR2X1 U17 ( .A(n493), .B(n514), .Y(n134) );
  AND2X1 U18 ( .A(n80), .B(n505), .Y(n506) );
  OR2X1 U19 ( .A(n487), .B(n75), .Y(n73) );
  BUFX2 U20 ( .A(n83), .Y(n415) );
  BUFX2 U21 ( .A(n81), .Y(n416) );
  BUFX2 U22 ( .A(n166), .Y(n417) );
  BUFX2 U23 ( .A(n162), .Y(n418) );
  BUFX2 U24 ( .A(n158), .Y(n419) );
  BUFX2 U25 ( .A(n154), .Y(n420) );
  BUFX2 U26 ( .A(n150), .Y(n421) );
  BUFX2 U27 ( .A(n146), .Y(n422) );
  BUFX2 U28 ( .A(n142), .Y(n423) );
  BUFX2 U29 ( .A(n138), .Y(n424) );
  BUFX2 U30 ( .A(n167), .Y(n425) );
  BUFX2 U31 ( .A(n163), .Y(n426) );
  BUFX2 U32 ( .A(n89), .Y(n427) );
  BUFX2 U33 ( .A(n78), .Y(n428) );
  BUFX2 U34 ( .A(n72), .Y(n429) );
  BUFX2 U35 ( .A(n69), .Y(n430) );
  AND2X1 U36 ( .A(n434), .B(n513), .Y(n164) );
  INVX1 U37 ( .A(n164), .Y(n431) );
  AND2X1 U38 ( .A(n435), .B(n513), .Y(n160) );
  INVX1 U39 ( .A(n160), .Y(n432) );
  AND2X1 U40 ( .A(n5), .B(RxDATA[6]), .Y(n105) );
  INVX1 U41 ( .A(n105), .Y(n433) );
  INVX1 U42 ( .A(n165), .Y(n434) );
  INVX1 U43 ( .A(n161), .Y(n435) );
  BUFX2 U44 ( .A(n82), .Y(n436) );
  AND2X1 U45 ( .A(n86), .B(n503), .Y(n84) );
  INVX1 U46 ( .A(n84), .Y(n437) );
  AND2X1 U47 ( .A(n488), .B(n439), .Y(n116) );
  INVX1 U48 ( .A(n116), .Y(n438) );
  AND2X1 U49 ( .A(CLEAR_B), .B(n10), .Y(n115) );
  INVX1 U50 ( .A(n115), .Y(n439) );
  AND2X1 U51 ( .A(n5), .B(RxDATA[5]), .Y(n104) );
  INVX1 U52 ( .A(n104), .Y(n440) );
  AND2X1 U53 ( .A(mcell3[7]), .B(n509), .Y(n124) );
  INVX1 U54 ( .A(n124), .Y(n441) );
  AND2X1 U55 ( .A(RxDATA[6]), .B(n510), .Y(n113) );
  INVX1 U56 ( .A(n113), .Y(n442) );
  INVX1 U57 ( .A(n156), .Y(n443) );
  INVX1 U58 ( .A(n157), .Y(n444) );
  BUFX2 U59 ( .A(n159), .Y(n445) );
  AND2X1 U60 ( .A(mcell3[5]), .B(n509), .Y(n122) );
  INVX1 U61 ( .A(n122), .Y(n446) );
  AND2X1 U62 ( .A(RxDATA[7]), .B(n510), .Y(n114) );
  INVX1 U63 ( .A(n114), .Y(n447) );
  AND2X1 U64 ( .A(RxDATA[6]), .B(n512), .Y(n96) );
  INVX1 U65 ( .A(n96), .Y(n448) );
  INVX1 U66 ( .A(n152), .Y(n449) );
  INVX1 U67 ( .A(n153), .Y(n450) );
  BUFX2 U68 ( .A(n155), .Y(n451) );
  AND2X1 U69 ( .A(n5), .B(RxDATA[3]), .Y(n102) );
  INVX1 U70 ( .A(n102), .Y(n452) );
  AND2X1 U71 ( .A(mcell3[2]), .B(n509), .Y(n119) );
  INVX1 U72 ( .A(n119), .Y(n453) );
  AND2X1 U90 ( .A(RxDATA[5]), .B(n510), .Y(n112) );
  INVX1 U95 ( .A(n112), .Y(n454) );
  AND2X1 U97 ( .A(RxDATA[7]), .B(n512), .Y(n97) );
  INVX1 U99 ( .A(n97), .Y(n455) );
  INVX1 U101 ( .A(n148), .Y(n456) );
  INVX1 U103 ( .A(n149), .Y(n457) );
  BUFX2 U105 ( .A(n151), .Y(n458) );
  AND2X1 U107 ( .A(n5), .B(RxDATA[7]), .Y(n106) );
  INVX1 U109 ( .A(n106), .Y(n459) );
  AND2X1 U112 ( .A(mcell3[6]), .B(n509), .Y(n123) );
  INVX1 U114 ( .A(n123), .Y(n460) );
  AND2X1 U116 ( .A(RxDATA[3]), .B(n510), .Y(n110) );
  INVX1 U118 ( .A(n110), .Y(n461) );
  AND2X1 U120 ( .A(RxDATA[4]), .B(n512), .Y(n94) );
  INVX1 U122 ( .A(n94), .Y(n462) );
  INVX1 U124 ( .A(n144), .Y(n463) );
  INVX1 U126 ( .A(n145), .Y(n464) );
  BUFX2 U128 ( .A(n147), .Y(n465) );
  AND2X1 U130 ( .A(n5), .B(RxDATA[0]), .Y(n99) );
  INVX1 U132 ( .A(n99), .Y(n466) );
  AND2X1 U134 ( .A(RxDATA[1]), .B(n510), .Y(n108) );
  INVX1 U136 ( .A(n108), .Y(n467) );
  AND2X1 U138 ( .A(RxDATA[5]), .B(n512), .Y(n95) );
  INVX1 U140 ( .A(n95), .Y(n468) );
  BUFX2 U142 ( .A(n126), .Y(n469) );
  AND2X1 U145 ( .A(n75), .B(n6), .Y(n127) );
  INVX1 U147 ( .A(n127), .Y(n470) );
  AND2X1 U149 ( .A(mcell3[0]), .B(n509), .Y(n117) );
  INVX1 U151 ( .A(n117), .Y(n471) );
  AND2X1 U153 ( .A(RxDATA[4]), .B(n510), .Y(n111) );
  INVX1 U155 ( .A(n111), .Y(n472) );
  AND2X1 U157 ( .A(RxDATA[3]), .B(n512), .Y(n93) );
  INVX1 U159 ( .A(n93), .Y(n473) );
  INVX1 U162 ( .A(n140), .Y(n474) );
  INVX1 U164 ( .A(n141), .Y(n475) );
  BUFX2 U165 ( .A(n143), .Y(n476) );
  BUFX2 U166 ( .A(n129), .Y(n477) );
  AND2X1 U167 ( .A(n86), .B(n486), .Y(n130) );
  INVX1 U170 ( .A(n130), .Y(n478) );
  BUFX2 U180 ( .A(n133), .Y(n479) );
  AND2X1 U181 ( .A(n30), .B(n31), .Y(n77) );
  INVX1 U185 ( .A(n77), .Y(n480) );
  AND2X1 U186 ( .A(n5), .B(RxDATA[1]), .Y(n100) );
  INVX1 U190 ( .A(n100), .Y(n481) );
  AND2X1 U191 ( .A(mcell3[4]), .B(n509), .Y(n121) );
  INVX1 U195 ( .A(n121), .Y(n482) );
  AND2X1 U196 ( .A(RxDATA[0]), .B(n510), .Y(n107) );
  INVX1 U200 ( .A(n107), .Y(n483) );
  AND2X1 U201 ( .A(RxDATA[2]), .B(n512), .Y(n92) );
  INVX1 U205 ( .A(n92), .Y(n484) );
  OR2X1 U206 ( .A(flag3), .B(flag2), .Y(n169) );
  INVX1 U210 ( .A(n169), .Y(n485) );
  AND2X1 U211 ( .A(rp[1]), .B(n30), .Y(n132) );
  INVX1 U215 ( .A(n132), .Y(n486) );
  AND2X1 U216 ( .A(n492), .B(n6), .Y(n74) );
  INVX1 U218 ( .A(n74), .Y(n487) );
  BUFX2 U220 ( .A(n88), .Y(n488) );
  AND2X1 U221 ( .A(n5), .B(RxDATA[2]), .Y(n101) );
  INVX1 U222 ( .A(n101), .Y(n489) );
  AND2X1 U223 ( .A(mcell3[1]), .B(n509), .Y(n118) );
  INVX1 U226 ( .A(n118), .Y(n490) );
  AND2X1 U227 ( .A(RxDATA[0]), .B(n512), .Y(n90) );
  INVX1 U228 ( .A(n90), .Y(n491) );
  OR2X1 U229 ( .A(n87), .B(n132), .Y(n67) );
  INVX1 U230 ( .A(n67), .Y(n492) );
  BUFX2 U231 ( .A(n98), .Y(n493) );
  BUFX2 U232 ( .A(n76), .Y(n494) );
  BUFX2 U233 ( .A(n168), .Y(n495) );
  AND2X1 U234 ( .A(n5), .B(RxDATA[4]), .Y(n103) );
  INVX1 U235 ( .A(n103), .Y(n496) );
  AND2X1 U236 ( .A(mcell3[3]), .B(n509), .Y(n120) );
  INVX1 U237 ( .A(n120), .Y(n497) );
  AND2X1 U238 ( .A(RxDATA[2]), .B(n510), .Y(n109) );
  INVX1 U239 ( .A(n109), .Y(n498) );
  AND2X1 U240 ( .A(RxDATA[1]), .B(n512), .Y(n91) );
  INVX1 U241 ( .A(n91), .Y(n499) );
  INVX1 U242 ( .A(n136), .Y(n500) );
  INVX1 U243 ( .A(n137), .Y(n501) );
  BUFX2 U244 ( .A(n139), .Y(n502) );
  AND2X1 U245 ( .A(rp[0]), .B(n31), .Y(n87) );
  INVX1 U246 ( .A(n87), .Y(n503) );
  BUFX2 U247 ( .A(n318), .Y(VALID) );
  AND2X1 U248 ( .A(n80), .B(n6), .Y(n68) );
  INVX1 U249 ( .A(n68), .Y(n505) );
  BUFX2 U250 ( .A(n438), .Y(n508) );
  BUFX2 U251 ( .A(n438), .Y(n509) );
  INVX1 U252 ( .A(n131), .Y(n5) );
  INVX1 U253 ( .A(n506), .Y(n513) );
  INVX1 U254 ( .A(CLEAR_B), .Y(n514) );
  BUFX2 U255 ( .A(n85), .Y(n510) );
  INVX1 U256 ( .A(n494), .Y(n6) );
  BUFX2 U257 ( .A(n70), .Y(n511) );
  BUFX2 U258 ( .A(n70), .Y(n512) );
  INVX1 U259 ( .A(VALID), .Y(SSPRXINTR) );
  INVX1 U260 ( .A(n479), .Y(n4) );
  INVX1 U261 ( .A(PWRITE), .Y(n57) );
  INVX1 U262 ( .A(flag0), .Y(n7) );
  AND2X1 U263 ( .A(flag1), .B(flag0), .Y(n135) );
  AND2X1 U264 ( .A(rp[0]), .B(rp[1]), .Y(n75) );
  INVX1 U265 ( .A(mcell0[1]), .Y(n53) );
  INVX1 U266 ( .A(mcell0[2]), .Y(n51) );
  INVX1 U267 ( .A(mcell0[3]), .Y(n49) );
  INVX1 U268 ( .A(mcell0[4]), .Y(n47) );
  INVX1 U269 ( .A(mcell0[5]), .Y(n45) );
  INVX1 U270 ( .A(mcell0[6]), .Y(n43) );
  INVX1 U271 ( .A(mcell0[7]), .Y(n41) );
  INVX1 U272 ( .A(mcell0[0]), .Y(n55) );
  INVX1 U273 ( .A(RxDATA[0]), .Y(n65) );
  INVX1 U274 ( .A(RxDATA[1]), .Y(n64) );
  INVX1 U275 ( .A(RxDATA[2]), .Y(n63) );
  INVX1 U276 ( .A(RxDATA[3]), .Y(n62) );
  INVX1 U277 ( .A(RxDATA[4]), .Y(n61) );
  INVX1 U278 ( .A(RxDATA[5]), .Y(n60) );
  INVX1 U279 ( .A(RxDATA[6]), .Y(n59) );
  INVX1 U280 ( .A(RxDATA[7]), .Y(n58) );
  INVX1 U281 ( .A(mcell2[0]), .Y(n40) );
  INVX1 U282 ( .A(mcell2[1]), .Y(n39) );
  INVX1 U283 ( .A(mcell2[2]), .Y(n38) );
  INVX1 U284 ( .A(mcell2[3]), .Y(n37) );
  INVX1 U285 ( .A(mcell2[4]), .Y(n36) );
  INVX1 U286 ( .A(mcell2[5]), .Y(n35) );
  INVX1 U287 ( .A(mcell2[6]), .Y(n34) );
  INVX1 U288 ( .A(mcell2[7]), .Y(n33) );
  INVX1 U289 ( .A(mcell1[0]), .Y(n18) );
  INVX1 U290 ( .A(mcell1[1]), .Y(n17) );
  INVX1 U291 ( .A(mcell1[2]), .Y(n16) );
  INVX1 U292 ( .A(mcell1[3]), .Y(n15) );
  INVX1 U293 ( .A(mcell1[4]), .Y(n14) );
  INVX1 U294 ( .A(mcell1[5]), .Y(n13) );
  INVX1 U295 ( .A(mcell1[6]), .Y(n12) );
  INVX1 U296 ( .A(mcell1[7]), .Y(n11) );
  OR2X1 U297 ( .A(n514), .B(PWRITE), .Y(n507) );
  INVX1 U298 ( .A(n507), .Y(n80) );
  INVX1 U299 ( .A(n416), .Y(n2) );
  INVX1 U300 ( .A(n415), .Y(n3) );
  INVX1 U301 ( .A(N98), .Y(n42) );
  INVX1 U302 ( .A(N101), .Y(n44) );
  INVX1 U303 ( .A(N104), .Y(n46) );
  INVX1 U304 ( .A(N107), .Y(n48) );
  INVX1 U305 ( .A(N110), .Y(n50) );
  INVX1 U306 ( .A(N113), .Y(n52) );
  INVX1 U307 ( .A(N116), .Y(n54) );
  INVX1 U308 ( .A(N119), .Y(n56) );
  INVX1 U309 ( .A(wp[0]), .Y(n8) );
  INVX1 U310 ( .A(wp[1]), .Y(n10) );
  INVX1 U311 ( .A(N99), .Y(n25) );
  INVX1 U312 ( .A(N102), .Y(n24) );
  INVX1 U313 ( .A(N105), .Y(n23) );
  INVX1 U314 ( .A(N108), .Y(n22) );
  INVX1 U315 ( .A(N111), .Y(n21) );
  INVX1 U316 ( .A(N114), .Y(n20) );
  INVX1 U317 ( .A(N117), .Y(n19) );
  INVX1 U318 ( .A(N120), .Y(n26) );
  INVX1 U319 ( .A(flag1), .Y(n32) );
  INVX1 U320 ( .A(rp[1]), .Y(n31) );
  INVX1 U321 ( .A(rp[0]), .Y(n30) );
endmodule


module RxLogic ( PCLK, CLEAR_B, VALID, SSPRXD, SSPFSSIN, SSPCLKIN, RxDATA, 
        RECV );
  output [7:0] RxDATA;
  input PCLK, CLEAR_B, VALID, SSPRXD, SSPFSSIN, SSPCLKIN;
  output RECV;
  wire   cnt, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n93, n94, n68, n69, n3, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202;
  wire   [3:0] state;
  wire   [7:0] RxDATA_temp;

  DFFPOSX1 \state_reg[0]  ( .D(n94), .CLK(SSPCLKIN), .Q(state[0]) );
  DFFPOSX1 \state_reg[1]  ( .D(n194), .CLK(SSPCLKIN), .Q(state[1]) );
  DFFPOSX1 \state_reg[2]  ( .D(n182), .CLK(SSPCLKIN), .Q(state[2]) );
  DFFPOSX1 \state_reg[3]  ( .D(n93), .CLK(SSPCLKIN), .Q(state[3]) );
  DFFPOSX1 cnt_reg ( .D(n175), .CLK(PCLK), .Q(cnt) );
  DFFPOSX1 RECV_reg ( .D(n180), .CLK(PCLK), .Q(RECV) );
  DFFPOSX1 \RxDATA_temp_reg[7]  ( .D(n88), .CLK(SSPCLKIN), .Q(RxDATA_temp[7])
         );
  DFFPOSX1 \RxDATA_reg[7]  ( .D(n87), .CLK(SSPCLKIN), .Q(RxDATA[7]) );
  DFFPOSX1 \RxDATA_temp_reg[6]  ( .D(n86), .CLK(SSPCLKIN), .Q(RxDATA_temp[6])
         );
  DFFPOSX1 \RxDATA_reg[6]  ( .D(n85), .CLK(SSPCLKIN), .Q(RxDATA[6]) );
  DFFPOSX1 \RxDATA_temp_reg[5]  ( .D(n84), .CLK(SSPCLKIN), .Q(RxDATA_temp[5])
         );
  DFFPOSX1 \RxDATA_reg[5]  ( .D(n83), .CLK(SSPCLKIN), .Q(RxDATA[5]) );
  DFFPOSX1 \RxDATA_temp_reg[4]  ( .D(n82), .CLK(SSPCLKIN), .Q(RxDATA_temp[4])
         );
  DFFPOSX1 \RxDATA_reg[4]  ( .D(n81), .CLK(SSPCLKIN), .Q(RxDATA[4]) );
  DFFPOSX1 \RxDATA_temp_reg[3]  ( .D(n80), .CLK(SSPCLKIN), .Q(RxDATA_temp[3])
         );
  DFFPOSX1 \RxDATA_reg[3]  ( .D(n79), .CLK(SSPCLKIN), .Q(RxDATA[3]) );
  DFFPOSX1 \RxDATA_temp_reg[2]  ( .D(n78), .CLK(SSPCLKIN), .Q(RxDATA_temp[2])
         );
  DFFPOSX1 \RxDATA_reg[2]  ( .D(n77), .CLK(SSPCLKIN), .Q(RxDATA[2]) );
  DFFPOSX1 \RxDATA_temp_reg[1]  ( .D(n76), .CLK(SSPCLKIN), .Q(RxDATA_temp[1])
         );
  DFFPOSX1 \RxDATA_reg[1]  ( .D(n75), .CLK(SSPCLKIN), .Q(RxDATA[1]) );
  DFFPOSX1 \RxDATA_temp_reg[0]  ( .D(n74), .CLK(SSPCLKIN), .Q(RxDATA_temp[0])
         );
  DFFPOSX1 \RxDATA_reg[0]  ( .D(n73), .CLK(SSPCLKIN), .Q(RxDATA[0]) );
  AOI22X1 U28 ( .A(cnt), .B(n184), .C(RECV), .D(n18), .Y(n20) );
  XOR2X1 U30 ( .A(n21), .B(cnt), .Y(n22) );
  OAI21X1 U31 ( .A(state[0]), .B(n23), .C(n24), .Y(n94) );
  OAI21X1 U32 ( .A(n23), .B(n201), .C(n178), .Y(n93) );
  OAI21X1 U34 ( .A(n24), .B(n19), .C(n195), .Y(n88) );
  OAI21X1 U36 ( .A(n21), .B(n9), .C(n185), .Y(n87) );
  OAI21X1 U38 ( .A(n30), .B(n10), .C(n196), .Y(n86) );
  OAI21X1 U40 ( .A(n21), .B(n10), .C(n176), .Y(n85) );
  OAI21X1 U42 ( .A(n33), .B(n11), .C(n197), .Y(n84) );
  OAI21X1 U44 ( .A(n21), .B(n11), .C(n177), .Y(n83) );
  OAI21X1 U46 ( .A(n36), .B(n12), .C(n186), .Y(n82) );
  OAI21X1 U48 ( .A(n21), .B(n12), .C(n179), .Y(n81) );
  OAI21X1 U50 ( .A(n19), .B(n188), .C(n183), .Y(n80) );
  OAI21X1 U52 ( .A(n21), .B(n13), .C(n190), .Y(n79) );
  OAI21X1 U54 ( .A(n42), .B(n14), .C(n198), .Y(n78) );
  OAI21X1 U56 ( .A(n21), .B(n14), .C(n174), .Y(n77) );
  OAI21X1 U58 ( .A(n46), .B(n15), .C(n199), .Y(n76) );
  OAI21X1 U60 ( .A(n21), .B(n15), .C(n173), .Y(n75) );
  OAI21X1 U62 ( .A(n201), .B(n19), .C(n187), .Y(n74) );
  OAI21X1 U64 ( .A(n21), .B(n16), .C(n200), .Y(n73) );
  NAND3X1 U67 ( .A(n6), .B(n7), .C(n5), .Y(n27) );
  XOR2X1 U69 ( .A(n5), .B(state[1]), .Y(n50) );
  XOR2X1 U71 ( .A(n193), .B(state[2]), .Y(n51) );
  NOR3X1 U72 ( .A(n55), .B(n33), .C(n36), .Y(n54) );
  NOR3X1 U73 ( .A(state[2]), .B(state[3]), .C(n193), .Y(n36) );
  OAI21X1 U74 ( .A(SSPFSSIN), .B(n201), .C(n191), .Y(n55) );
  NOR3X1 U76 ( .A(state[0]), .B(state[3]), .C(n6), .Y(n56) );
  NAND3X1 U77 ( .A(n52), .B(n8), .C(state[2]), .Y(n25) );
  NOR3X1 U79 ( .A(n42), .B(n30), .C(n3), .Y(n53) );
  NAND3X1 U80 ( .A(state[2]), .B(n5), .C(n189), .Y(n39) );
  NOR3X1 U82 ( .A(state[1]), .B(state[3]), .C(n5), .Y(n58) );
  OR2X1 U3 ( .A(n181), .B(n202), .Y(n59) );
  AND2X1 U4 ( .A(RxDATA[1]), .B(n21), .Y(n47) );
  INVX1 U5 ( .A(n47), .Y(n173) );
  AND2X1 U6 ( .A(RxDATA[2]), .B(n21), .Y(n44) );
  INVX1 U7 ( .A(n44), .Y(n174) );
  OR2X1 U8 ( .A(n22), .B(n202), .Y(n60) );
  INVX1 U9 ( .A(n60), .Y(n175) );
  AND2X1 U10 ( .A(RxDATA[6]), .B(n21), .Y(n32) );
  INVX1 U11 ( .A(n32), .Y(n176) );
  AND2X1 U12 ( .A(RxDATA[5]), .B(n21), .Y(n35) );
  INVX1 U13 ( .A(n35), .Y(n177) );
  AND2X1 U14 ( .A(state[3]), .B(n192), .Y(n26) );
  INVX1 U15 ( .A(n26), .Y(n178) );
  AND2X1 U16 ( .A(RxDATA[4]), .B(n21), .Y(n38) );
  INVX1 U17 ( .A(n38), .Y(n179) );
  INVX1 U18 ( .A(n59), .Y(n180) );
  BUFX2 U19 ( .A(n20), .Y(n181) );
  OR2X1 U20 ( .A(n23), .B(n51), .Y(n68) );
  INVX1 U21 ( .A(n68), .Y(n182) );
  AND2X1 U22 ( .A(RxDATA_temp[3]), .B(n188), .Y(n40) );
  INVX1 U23 ( .A(n40), .Y(n183) );
  OR2X1 U24 ( .A(n24), .B(state[3]), .Y(n21) );
  INVX1 U25 ( .A(n21), .Y(n184) );
  OR2X1 U26 ( .A(n18), .B(n192), .Y(n24) );
  AND2X1 U27 ( .A(RxDATA[7]), .B(n21), .Y(n29) );
  INVX1 U29 ( .A(n29), .Y(n185) );
  AND2X1 U33 ( .A(n36), .B(SSPRXD), .Y(n37) );
  INVX1 U35 ( .A(n37), .Y(n186) );
  AND2X1 U37 ( .A(RxDATA_temp[0]), .B(n201), .Y(n48) );
  INVX1 U39 ( .A(n48), .Y(n187) );
  BUFX2 U41 ( .A(n39), .Y(n188) );
  OR2X1 U43 ( .A(state[3]), .B(state[1]), .Y(n57) );
  INVX1 U45 ( .A(n57), .Y(n189) );
  AND2X1 U47 ( .A(RxDATA[3]), .B(n21), .Y(n41) );
  INVX1 U49 ( .A(n41), .Y(n190) );
  AND2X1 U51 ( .A(state[2]), .B(n56), .Y(n46) );
  INVX1 U53 ( .A(n46), .Y(n191) );
  BUFX2 U55 ( .A(n27), .Y(n192) );
  AND2X1 U57 ( .A(state[0]), .B(state[1]), .Y(n52) );
  INVX1 U59 ( .A(n52), .Y(n193) );
  OR2X1 U61 ( .A(n23), .B(n50), .Y(n69) );
  INVX1 U63 ( .A(n69), .Y(n194) );
  AND2X1 U65 ( .A(RxDATA_temp[7]), .B(n24), .Y(n28) );
  INVX1 U66 ( .A(n28), .Y(n195) );
  AND2X1 U68 ( .A(n30), .B(SSPRXD), .Y(n31) );
  INVX1 U70 ( .A(n31), .Y(n196) );
  AND2X1 U75 ( .A(n33), .B(SSPRXD), .Y(n34) );
  INVX1 U78 ( .A(n34), .Y(n197) );
  AND2X1 U81 ( .A(n42), .B(SSPRXD), .Y(n43) );
  INVX1 U83 ( .A(n43), .Y(n198) );
  AND2X1 U84 ( .A(n46), .B(SSPRXD), .Y(n45) );
  INVX1 U85 ( .A(n45), .Y(n199) );
  AND2X1 U86 ( .A(RxDATA[0]), .B(n21), .Y(n49) );
  INVX1 U87 ( .A(n49), .Y(n200) );
  BUFX2 U88 ( .A(n25), .Y(n201) );
  INVX1 U89 ( .A(CLEAR_B), .Y(n202) );
  INVX1 U90 ( .A(VALID), .Y(n18) );
  AND2X1 U91 ( .A(n53), .B(n54), .Y(n23) );
  INVX1 U92 ( .A(n188), .Y(n3) );
  AND2X1 U93 ( .A(n56), .B(n7), .Y(n33) );
  AND2X1 U94 ( .A(n58), .B(n7), .Y(n30) );
  INVX1 U95 ( .A(state[3]), .Y(n8) );
  INVX1 U96 ( .A(RxDATA_temp[0]), .Y(n16) );
  INVX1 U97 ( .A(RxDATA_temp[3]), .Y(n13) );
  INVX1 U98 ( .A(RxDATA_temp[7]), .Y(n9) );
  INVX1 U99 ( .A(state[0]), .Y(n5) );
  AND2X1 U100 ( .A(n58), .B(state[2]), .Y(n42) );
  INVX1 U101 ( .A(state[2]), .Y(n7) );
  INVX1 U102 ( .A(state[1]), .Y(n6) );
  INVX1 U103 ( .A(RxDATA_temp[1]), .Y(n15) );
  INVX1 U104 ( .A(RxDATA_temp[2]), .Y(n14) );
  INVX1 U105 ( .A(RxDATA_temp[4]), .Y(n12) );
  INVX1 U106 ( .A(RxDATA_temp[5]), .Y(n11) );
  INVX1 U107 ( .A(RxDATA_temp[6]), .Y(n10) );
  INVX1 U108 ( .A(SSPRXD), .Y(n19) );
endmodule


module SSP ( PCLK, CLEAR_B, PSEL, PWRITE, PWDATA, SSPCLKIN, SSPFSSIN, SSPRXD, 
        PRDATA, SSPOE_B, SSPTXD, SSPCLKOUT, SSPFSSOUT, SSPTXINTR, SSPRXINTR );
  input [7:0] PWDATA;
  output [7:0] PRDATA;
  input PCLK, CLEAR_B, PSEL, PWRITE, SSPCLKIN, SSPFSSIN, SSPRXD;
  output SSPOE_B, SSPTXD, SSPCLKOUT, SSPFSSOUT, SSPTXINTR, SSPRXINTR;
  wire   valid1, valid2, SENT, RECV;
  wire   [7:0] TxDATA;
  wire   [7:0] RxDATA;
  tri   [7:0] PWDATA;
  tri   [7:0] PRDATA;

  TxFIFO TxFIFO_tester ( .PSEL(PSEL), .PWRITE(PWRITE), .PWDATA(PWDATA), 
        .CLEAR_B(CLEAR_B), .PCLK(PCLK), .SENT(SENT), .TxDATA(TxDATA), 
        .SSPTXINTR(SSPTXINTR), .VALID(valid1) );
  TxLogic TxLogic_tester ( .PCLK(PCLK), .CLEAR_B(CLEAR_B), .VALID(valid1), 
        .TxDATA(TxDATA), .SSPOE_B(SSPOE_B), .SSPTXD(SSPTXD), .SSPFSSOUT(
        SSPFSSOUT), .SSPCLKOUT(SSPCLKOUT), .SENT(SENT) );
  RxFIFO RxFIFO_tester ( .PSEL(PSEL), .PWRITE(PWRITE), .RxDATA(RxDATA), 
        .CLEAR_B(CLEAR_B), .PCLK(PCLK), .RECV(RECV), .PRDATA(PRDATA), 
        .SSPRXINTR(SSPRXINTR), .VALID(valid2) );
  RxLogic RxLogic_tester ( .PCLK(PCLK), .CLEAR_B(CLEAR_B), .VALID(valid2), 
        .SSPRXD(SSPRXD), .SSPFSSIN(SSPFSSIN), .SSPCLKIN(SSPCLKIN), .RxDATA(
        RxDATA), .RECV(RECV) );
endmodule


module Clock ( clk_i, clear_i, ssp_intr_i, phi1, phi2, clk_o, clear_o );
  input [1:0] ssp_intr_i;
  input clk_i, clear_i;
  output phi1, phi2, clk_o, clear_o;
  wire   clk_i, clear_i, n18, n15, n17, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66;
  wire   [1:0] cnt;
  assign clk_o = clk_i;
  assign clear_o = clear_i;

  DFFPOSX1 \cnt_reg[0]  ( .D(n17), .CLK(clk_i), .Q(cnt[0]) );
  DFFPOSX1 \cnt_reg[1]  ( .D(n45), .CLK(clk_i), .Q(cnt[1]) );
  DFFPOSX1 phi2_reg ( .D(n44), .CLK(clk_i), .Q(phi2) );
  DFFPOSX1 phi1_reg ( .D(n15), .CLK(clk_i), .Q(phi1) );
  INVX1 U3 ( .A(cnt[0]), .Y(n35) );
  INVX1 U4 ( .A(cnt[0]), .Y(n36) );
  INVX1 U5 ( .A(cnt[0]), .Y(n63) );
  INVX1 U6 ( .A(cnt[1]), .Y(n64) );
  OAI21X1 U7 ( .A(ssp_intr_i[1]), .B(cnt[1]), .C(clear_i), .Y(n37) );
  INVX1 U8 ( .A(cnt[1]), .Y(n49) );
  INVX1 U9 ( .A(n63), .Y(n42) );
  INVX1 U10 ( .A(n64), .Y(n39) );
  NOR3X1 U11 ( .A(n51), .B(n39), .C(n36), .Y(n38) );
  INVX1 U12 ( .A(n38), .Y(n56) );
  OAI21X1 U13 ( .A(n59), .B(n58), .C(phi2), .Y(n40) );
  INVX1 U14 ( .A(n40), .Y(n60) );
  NOR3X1 U15 ( .A(n42), .B(n49), .C(n51), .Y(n41) );
  INVX1 U16 ( .A(n41), .Y(n62) );
  NOR3X1 U17 ( .A(n48), .B(n49), .C(n55), .Y(n43) );
  INVX1 U18 ( .A(n43), .Y(n57) );
  INVX1 U19 ( .A(clear_i), .Y(n48) );
  AND2X2 U20 ( .A(cnt[0]), .B(n54), .Y(n55) );
  AND2X2 U21 ( .A(n61), .B(n62), .Y(n47) );
  INVX1 U22 ( .A(n47), .Y(n44) );
  AND2X2 U23 ( .A(n56), .B(n57), .Y(n18) );
  INVX1 U24 ( .A(n18), .Y(n45) );
  BUFX2 U25 ( .A(n65), .Y(n46) );
  AND2X2 U26 ( .A(n58), .B(n36), .Y(n53) );
  INVX1 U27 ( .A(n53), .Y(n50) );
  AND2X1 U28 ( .A(clear_i), .B(n54), .Y(n58) );
  INVX1 U29 ( .A(n58), .Y(n51) );
  AND2X1 U30 ( .A(ssp_intr_i[1]), .B(clear_i), .Y(n59) );
  INVX1 U31 ( .A(n59), .Y(n52) );
  INVX1 U32 ( .A(ssp_intr_i[1]), .Y(n54) );
  INVX1 U33 ( .A(phi1), .Y(n66) );
  OAI21X1 U34 ( .A(n35), .B(n52), .C(n50), .Y(n17) );
  OAI21X1 U35 ( .A(n59), .B(n64), .C(n60), .Y(n61) );
  NAND3X1 U36 ( .A(n64), .B(n58), .C(n35), .Y(n65) );
  OAI21X1 U37 ( .A(n66), .B(n37), .C(n46), .Y(n15) );
endmodule


module TOP ( clear, clock, armadr, dataBus, memread, memwrite, memwr, memreqb, 
        phi1, phi2, dataBus_slave, memadr, memr, memw, sspclki, sspfssi, ssprx, 
        sspclko, sspfsso, ssptx, sspoe );
  input [25:0] armadr;
  inout [31:0] dataBus;
  inout [31:0] dataBus_slave;
  output [25:0] memadr;
  input clear, clock, memread, memwrite, memwr, memreqb, sspclki, sspfssi,
         ssprx;
  output phi1, phi2, memr, memw, sspclko, sspfsso, ssptx, sspoe;
  wire   tag2, sspw, clr, clk, ack, we, stb, cyc, tag1, sspsel, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [1:0] sspintr;
  wire   [31:0] dat1;
  wire   [25:0] adr;
  tri   [31:0] dataBus;
  tri   [31:0] dataBus_slave;
  tri   [7:0] prdata;
  tri   [31:0] dat2;
  assign memw = 1'b0;

  Master wishmaster ( .rst_i(clr), .clk_i(clk), .mem_req(memreqb), 
        .memoryRead(memread), .memoryWrite(memwrite), .addressBus(armadr), 
        .dat_i(dat1), .ack_i(ack), .adr_o(adr), .dat_o(dat2), .we_o(we), 
        .stb_o(stb), .cyc_o(cyc), .taga_o(tag1), .dataBus(dataBus) );
  Slave wishslave ( .rst_i(clr), .clk_i(clk), .dat_i(dat2), .adr_i(adr), 
        .taga_i(tag1), .we_i(we), .stb_i(stb), .cyc_i(cyc), .mem_adr_o(memadr), 
        .mem_r_o(memr), .ssp_sel_o(sspsel), .ssp_w_o(sspw), .dat_o(dat1), 
        .ack_o(ack), .tagd_o(tag2), .dataBus(dataBus_slave) );
  SSP ssp2 ( .PCLK(1'b0), .CLEAR_B(clr), .PSEL(sspsel), .PWRITE(sspw), 
        .PWDATA(dataBus_slave[7:0]), .SSPCLKIN(sspclki), .SSPFSSIN(sspfssi), 
        .SSPRXD(ssprx), .PRDATA(prdata), .SSPOE_B(sspoe), .SSPTXD(ssptx), 
        .SSPCLKOUT(sspclko), .SSPFSSOUT(sspfsso), .SSPTXINTR(sspintr[1]), 
        .SSPRXINTR(sspintr[0]) );
  Clock cmu ( .clk_i(clock), .clear_i(clear), .ssp_intr_i(sspintr), .phi1(phi1), .phi2(phi2), .clk_o(clk), .clear_o(clr) );
  TBUFX2 \dataBus_slave_tri[0]  ( .A(n24), .EN(n33), .Y(dataBus_slave[0]) );
  TBUFX2 \dataBus_slave_tri[1]  ( .A(n25), .EN(n33), .Y(dataBus_slave[1]) );
  TBUFX2 \dataBus_slave_tri[2]  ( .A(n26), .EN(n33), .Y(dataBus_slave[2]) );
  TBUFX2 \dataBus_slave_tri[3]  ( .A(n27), .EN(n33), .Y(dataBus_slave[3]) );
  TBUFX2 \dataBus_slave_tri[4]  ( .A(n28), .EN(n33), .Y(dataBus_slave[4]) );
  TBUFX2 \dataBus_slave_tri[5]  ( .A(n29), .EN(n33), .Y(dataBus_slave[5]) );
  TBUFX2 \dataBus_slave_tri[6]  ( .A(n30), .EN(n33), .Y(dataBus_slave[6]) );
  TBUFX2 \dataBus_slave_tri[7]  ( .A(n31), .EN(n33), .Y(dataBus_slave[7]) );
  OR2X1 U32 ( .A(sspw), .B(n23), .Y(n32) );
  INVX1 U33 ( .A(n32), .Y(n33) );
  INVX1 U34 ( .A(tag2), .Y(n23) );
  INVX1 U35 ( .A(prdata[7]), .Y(n31) );
  INVX1 U36 ( .A(prdata[6]), .Y(n30) );
  INVX1 U37 ( .A(prdata[5]), .Y(n29) );
  INVX1 U38 ( .A(prdata[4]), .Y(n28) );
  INVX1 U39 ( .A(prdata[3]), .Y(n27) );
  INVX1 U40 ( .A(prdata[2]), .Y(n26) );
  INVX1 U41 ( .A(prdata[1]), .Y(n25) );
  INVX1 U42 ( .A(prdata[0]), .Y(n24) );
endmodule

