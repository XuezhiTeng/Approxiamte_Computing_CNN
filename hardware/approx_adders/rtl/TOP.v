module TOP (clear,clock,armadr,dataBus,memread,memwrite,memwr,memreqb,phi1,phi2,dataBus_slave,memadr,memr,memw,sspclki,sspfssi,ssprx,sspclko,sspfsso,ssptx,sspoe);

input clear;
input clock;

input [25:0] armadr;
inout [31:0] dataBus;
input memread;
input memwrite;
input memwr;
input memreqb;

output phi1;
output phi2;

inout [31:0] dataBus_slave;
output [25:0] memadr;
output memr;
output memw;

input sspclki;
input sspfssi;
input ssprx;
output sspclko;
output sspfsso;
output ssptx;
output sspoe;

wire	clr;
wire	clk;

wire [25:0] adr;
wire [31:0] dat1;
wire [31:0] dat2;
wire we;
wire stb;
wire ack;
wire cyc;
wire tag1;
wire tag2;

wire sspclk;
wire sspsel;
wire sspw;
wire [1:0] sspintr;
wire ssptxintr;
wire ssprxintr;
wire [7:0]pwdata, prdata;

assign sspintr[1]=ssptxintr;
assign sspintr[0]=ssprxintr;
assign dataBus_slave[7:0] = (tag2 && !sspw)? prdata:32'hz;
assign pwdata = dataBus_slave [7:0];


Master wishmaster (.rst_i(clr), .clk_i(clk), .mem_req(memreqb), .memoryRead(memread), .memoryWrite(memwrite), .addressBus(armadr), .dat_i(dat1), .ack_i(ack), .adr_o(adr), .dat_o(dat2), .we_o(we), .stb_o(stb), .cyc_o(cyc), .taga_o(tag1), .dataBus(dataBus));

Slave wishslave (.rst_i(clr), .clk_i(clk), .dat_i(dat2), .adr_i(adr), .taga_i(tag1), .we_i(we), .stb_i(stb), .cyc_i(cyc), .mem_adr_o(memadr), .mem_r_o(memr), .mem_w_o(memw), .ssp_sel_o(sspsel), .ssp_w_o(sspw), .dat_o(dat1), .tagd_o(tag2), .ack_o(ack), .dataBus(dataBus_slave));

SSP ssp2 (.PCLK(sspclk), .CLEAR_B(clr), .PSEL(sspsel), .PWRITE(sspw), .SSPCLKIN(sspclki), .SSPFSSIN(sspfssi), .SSPRXD(ssprx), .PWDATA(pwdata), .PRDATA(prdata), .SSPCLKOUT(sspclko), .SSPFSSOUT(sspfsso), .SSPTXD(ssptx), .SSPOE_B(sspoe), .SSPTXINTR(ssptxintr), .SSPRXINTR(ssprxintr));

Clock cmu(.clk_i(clock), .clear_i(clear), .ssp_intr_i(sspintr), .phi1(phi1), .phi2(phi2), .clk_o(clk), .clear_o(clr));


endmodule