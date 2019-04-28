module ssp_test;
	reg clock, clear_b, pwrite, psel, sspclkin, sspfssin, ssprxd;
	reg [7:0] data_in;
	
	wire sspoe_b, ssptxd, sspfssout, sspclkout, ssptxintr, ssprxintr;
	wire [7:0] data_out;

	initial begin
		clock = 1'b0;
		clear_b = 1'b0;
		psel = 1'b0;
		sspclkin = 1'b0;
    sspfssin = 1'b0;
    ssprxd = 1'b0;
		@(posedge clock);
		#1;
		@(posedge clock);
    data_in = 8'b11111111; //8'hFF, dummy data. should not enter into SSP.
		#1;
		clear_b = 1'b1;
		#50 
		psel = 1'b1;
		pwrite = 1'b1;
		data_in = 8'b00110101; //8'h35
		#40
		data_in = 8'b10101110; //8'hAE
		#30
		psel = 1'b0;
		#200   
		data_in = 8'b00100110; //8'h26
		#10
		psel = 1'b1;
		#40
		data_in = 8'b00111001; //8'h39
    #40
		data_in = 8'b10011101; //8'h9D
    #40
		data_in = 8'b01110100; //8'h74
    #40
    data_in = 8'b10001111; //8'h8F
    #40
    data_in = 8'b10110001; //8'bB1
		#40
    data_in = 8'b01010101; //8'b55
	
	end
	
	always 
	#20 clock = ~clock;

// serial output from SSP is looped back to the serial input.
	SSP ssp1 (.PCLK(clock), .CLEAR_B(clear_b), .PSEL(psel), .PWRITE(pwrite), .SSPCLKIN(sspclkin), .SSPFSSIN(sspfssin), .SSPRXD(ssprxd), .PWDATA(data_in), .PRDATA(data_out), .SSPCLKOUT(sspclkout), .SSPFSSOUT(sspfssout), .SSPTXD(ssptxd), .SSPOE_B(sspoe_b), .SSPTXINTR(ssptxintr), .SSPRXINTR(ssprxintr));

endmodule