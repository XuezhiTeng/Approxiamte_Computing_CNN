//*********************************************
//   This is a TxFIFO module for SSP          *
//   This is a design of Xuezhi Teng          *
//*********************************************

//*************The top module******************
module TxFIFO (
	//Inputs:
	PSEL,           //chip selection
	PWRITE,			//write signal		
	PWDATA,			//input data[7:0]
	CLEAR_B,		//reset, clear all the pointer and data
	PCLK,			//clock from outside world
	SENT,			//the transmit logic is ready to receive data
	//Outputs:
	TxDATA,			//the data sent to transmit logic
	SSPTXINTR,		//full or not full
	VALID           //tell the txlogic that the fifo is not empty
	);
	
	// Listing all the ports:
	input PSEL, PWRITE, CLEAR_B, PCLK, SENT;
	input [7:0] PWDATA;
	output [7:0] TxDATA;
	output SSPTXINTR, VALID;	
	
	//internal regs and wires:
	reg [1:0] wp;		//write pointer
	reg [1:0] rp;		//read pointer
	reg [7:0] mcell0, mcell1, mcell2, mcell3; //4 memory cells to store the TxDATA
	reg flag0, flag1, flag2, flag3;		//flag for each memory cell
	reg [7:0] TxDATA;
	wire full, empty;	//define the cells are full or empty
	wire wre, rde;      //write and read enable
	
	//Initial value connection
	assign full = (flag3 && flag2 && flag1 && flag0);
	assign empty = (!flag3 && !flag2 && !flag1 && !flag0);
	assign SSPTXINTR = full;
	assign wre = (PSEL && PWRITE && !full);
	assign rde = (SENT && VALID);
	assign VALID = !empty;
	
	
//*************Behavioral modeling***************	
	always @ (posedge PCLK)			//Write data to fifo          
	begin	
		if (CLEAR_B == 0)			  	//when CLEAR_B is low, reset all the regs
		begin
			wp <= 2'b00;
			mcell0 <= 'bx;
			mcell1 <= 'bx;
			mcell2 <= 'bx;
			mcell3 <= 'bx;			
		end
		else if (wre)           	//when CLEAR_B is hgih, look at the write enable
			begin
				case (wp)
				2'b00: 
					begin
					mcell0 <= PWDATA;
					wp <= (wp + 1);
					end
				2'b01: 
					begin
					mcell1 <= PWDATA;
					wp <= (wp + 1);
					end
				2'b10: 
					begin
					mcell2 <= PWDATA;
					wp <= (wp + 1);
					end
				2'b11: 
					begin
					mcell3 <= PWDATA;
					wp <= 0;
					end
				endcase
			end				
	end				


	always @ (posedge PCLK)       //read data from fifo
	begin
	if (CLEAR_B == 0)
		begin
			rp <= 2'b00;
			TxDATA <= 'bx;
		end
		else if (rde)
		begin
			case (rp)
				2'b00: 
					begin
					TxDATA <= mcell0;
					rp <= (rp + 1);
					end
				2'b01: 
					begin
					TxDATA <= mcell1;
					rp <= (rp + 1);
					end
				2'b10: 
					begin
					TxDATA <= mcell2;
					rp <= (rp + 1);
					end
				2'b11: 
					begin
					TxDATA <= mcell3;
					rp <= 0;
					end
			endcase
		end
	end	
	
	
	always @ (posedge PCLK)
	begin
	if (CLEAR_B == 0)
	begin
	flag0 <= 0;
	flag1 <= 0;
	flag2 <= 0;
	flag3 <= 0;
	end
	else 
		begin
		if (wre)
		begin
		case (wp)
			2'b00: flag0 <= 1;
			2'b01: flag1 <= 1;
			2'b10: flag2 <= 1;
			2'b11: flag3 <= 1;
		endcase
		end
		if (rde)
			begin
			case (rp)
				2'b00: flag0 <= 0;
				2'b01: flag1 <= 0;
				2'b10: flag2 <= 0;
				2'b11: flag3 <= 0;
			endcase
			end
		end
	end	
endmodule