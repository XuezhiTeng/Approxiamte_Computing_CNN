//*********************************************
//   This is a tester for RxFIFO module       *
//   This is a design of Xuezhi Teng          *
//*********************************************


module RxFIFO_test ();

reg 	PSEL,           //chip selection
		PWRITE,			//write signal		
		CLEAR_B,		//reset, clear all the pointer and data
		PCLK,			//clock from outside world
		RECV;			//the transmit logic is ready to send data
reg[7:0]    RxDATA;	    //input data[7:0]
wire[7:0] 	PRDATA;	//the data RECV to transmit logic
wire SSPTXINTR;		//full or not full
		
RxFIFO RxFIFO_tester (.PSEL(PSEL), .PWRITE(PWRITE), .RxDATA(RxDATA), .CLEAR_B(CLEAR_B), .PCLK(PCLK), .RECV(RECV), .PRDATA(PRDATA), .SSPTXINTR(SSPTXINTR));

initial 
begin
	//CLOCK
	PCLK = 0;
	//SELECT
	PSEL = 1;
	//RECV
	RECV = 0;
	//WRITE
	PWRITE = 0;
	//CLEAR
	CLEAR_B = 1;
	//DATA
	RxDATA = 8'b00000000;
	
	#10
	CLEAR_B = 0;
	#20
	CLEAR_B = 1;
	#20
	PWRITE = 1;
	#20
	RxDATA = 8'b00000001;
	#40
	RxDATA = 8'b00000010;
	#40
	RxDATA = 8'b00000011;
	#40
	RxDATA = 8'b00000100;
	#50
	RECV = 1; 
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#10
	RECV = ~RECV;
	#300
	PWRITE = 0;
end

always
begin
	#20 PCLK = ~PCLK; 
end

	
endmodule