//*********************************************
//   This is a RxLogic module for SSP         *
//   This is a design of Xuezhi Teng          *
//*********************************************

//****************The top module***************
module RxLogic (
	//Inputs
	PCLK,			//clock from outside world
	CLEAR_B,		//reset
	VALID,			//sent enable, TxFIFO is not empty
	SSPRXD,			//1-bit serial data input
	SSPFSSIN,		//start the next cycle
	SSPCLKIN,		//twice slower than PCLK
	//Outputs
	RxDATA,			//parallel data from TxFIFO
	RECV				//A pulse signal generated by state 7 & 8
	);
	
	
	////listing all the ports:
	input PCLK, CLEAR_B, VALID, SSPRXD, SSPFSSIN, SSPCLKIN;
	output [7:0] RxDATA;
	output RECV;
	
	//initial regs and wires:
	reg [3:0] state;
	reg RECV, cnt;
	reg [7:0] RxDATA_temp;
	reg [7:0] RxDATA;
	
	
	
//*************Behavioral modeling***************


	always @ (posedge PCLK) 			//generate RECV (pulse)
		begin
		if (!CLEAR_B)
			begin
			RECV <= 0;
			cnt <= 0;
			end
		else if (VALID) 
		begin
		if (state == 0)
			begin
				if (!cnt)
				begin
				cnt <= ~cnt;
				RECV <= 0;
				end
					else
					begin
						cnt <= ~cnt;
						RECV <= 1;
					end
			end
			else
				begin
				//cnt <= ~cnt;
				RECV <= 0;
				end
		end		
		end


		
	always @ (posedge SSPCLKIN) //FSM

			begin
			case (state)
			4'b1000:      //state 8
			begin
				if (VALID)
				begin
				state <= 1;
				RxDATA_temp [7] <= SSPRXD;
//				RxDATA <= RxDATA_temp;
				end
				else
				state <= 0;
			end
			4'b0000:
			begin
				if (VALID)
				begin
				state <= (state + 1);
				RxDATA <= RxDATA_temp;
				RxDATA_temp [7] <= SSPRXD;
				end
			end
			4'b0001:
			begin
				state <= (state + 1);
				RxDATA_temp [6] <= SSPRXD;
			end				
			4'b0010:
			begin
				state <= (state + 1);
				RxDATA_temp [5] <= SSPRXD;
			end							
			4'b0011:
			begin
				state <= (state + 1);
				RxDATA_temp [4] <= SSPRXD;
			end							
			4'b0100:
			begin
				state <= (state + 1);
				RxDATA_temp [3] <= SSPRXD;
			end							
			4'b0101:
			begin
				state <= (state + 1);
				RxDATA_temp [2] <= SSPRXD;
			end							
			4'b0110:
			begin
				state <= (state + 1);
				RxDATA_temp [1] <= SSPRXD;
			end							
			4'b0111:     //state 7
			begin
				if (SSPFSSIN)
				begin
				state <= 0;
				RxDATA_temp [0] <= SSPRXD;
				end
				else begin
					state <= (state + 1);
					RxDATA_temp [0] <= SSPRXD;
					end
			end	
			default: begin
					if (SSPFSSIN)
					state <= 4'b1000;
					else state <= 'bx;
					end
		endcase
		end
		
endmodule

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			