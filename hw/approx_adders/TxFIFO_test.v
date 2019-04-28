//*********************************************
//   This is a tester for TxFIFO module       *
//   This is a design of Xuezhi Teng          *
//*********************************************


module TxFIFO_test ();

reg 	PSEL,           //chip selection
		PWRITE,			//write signal		
		CLEAR_B,		//reset, clear all the pointer and data
		PCLK,			//clock from outside world
		SENT;			//the transmit logic is ready to receive data
reg[7:0]    PWDATA;	    //input data[7:0]
wire[7:0] 	TxDATA;	//the data sent to transmit logic
wire SSPTXINTR, SENT_E;		//full or not full
		
TxFIFO TxFIFO_tester (.PSEL(PSEL), .PWRITE(PWRITE), .PWDATA(PWDATA), .CLEAR_B(CLEAR_B), .PCLK(PCLK), .SENT(SENT), .TxDATA(TxDATA), .SSPTXINTR(SSPTXINTR), .SENT_E(SENT_E));

initial 
begin
	//CLOCK
	PCLK = 0;
	//SELECT
	PSEL = 1;
	//SENT
	SENT = 0;
	//WRITE
	PWRITE = 0;
	//CLEAR
	CLEAR_B = 1;
	//DATA
	PWDATA = 8'b01010101;
	
	#10
	CLEAR_B = 0;
	#20
	CLEAR_B = 1;
	#20
	PWRITE = 1;
	#20
	PWDATA = 8'b10101010;
	#40
	PWDATA = 8'b00000010;
	#20
	SENT = 1;
	#20
	PWDATA = 8'b00000011;
	#40
	PWDATA = 8'b11111100;
/*	#50
	SENT = 1; PWRITE = 0;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#10
	SENT = ~SENT;
	#50
	CLEAR_B = 0;
	#20
	CLEAR_B = 1;*/
end

always
begin
	#20 PCLK = ~PCLK; 
end

	
endmodule