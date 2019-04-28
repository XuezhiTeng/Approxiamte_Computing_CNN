module SSP(
    input PCLK,
    input CLEAR_B,
    input PSEL,
    input PWRITE,
    input [7:0] PWDATA,
    input SSPCLKIN,
    input SSPFSSIN,
    input SSPRXD,
    output [7:0] PRDATA,
    output SSPOE_B,
    output SSPTXD,
    output SSPCLKOUT,
    output SSPFSSOUT,
    output SSPTXINTR,
    output SSPRXINTR
    );
	wire [7:0] TxDATA;
	wire [7:0] RxDATA;
	wire valid1, valid2, SENT, RECV;
TxFIFO TxFIFO_tester (.PSEL(PSEL), .PWRITE(PWRITE), .PWDATA(PWDATA), .CLEAR_B(CLEAR_B), .PCLK(PCLK), .SENT(SENT), .TxDATA(TxDATA), .SSPTXINTR(SSPTXINTR), .VALID(valid1));
TxLogic TxLogic_tester (.PCLK(PCLK), .CLEAR_B(CLEAR_B), .VALID(valid1), .TxDATA(TxDATA), .SSPOE_B(SSPOE_B), .SSPTXD(SSPTXD), .SSPFSSOUT(SSPFSSOUT), .SSPCLKOUT(SSPCLKOUT),.SENT(SENT));
RxFIFO RxFIFO_tester (.PSEL(PSEL), .PWRITE(PWRITE), .RxDATA(RxDATA), .CLEAR_B(CLEAR_B), .PCLK(PCLK), .RECV(RECV), .PRDATA(PRDATA), .SSPRXINTR(SSPRXINTR), .VALID(valid2));
RxLogic RxLogic_tester (.PCLK(PCLK), .CLEAR_B(CLEAR_B), .VALID(valid2), .SSPRXD(SSPRXD), .SSPFSSIN(SSPFSSIN), .SSPCLKIN(SSPCLKIN), .RxDATA(RxDATA), .RECV(RECV));

endmodule