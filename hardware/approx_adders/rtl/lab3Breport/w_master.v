//*********************************************
//   This is a Mater module for WISHBONE      *
//   This is a design of Xuezhi Teng          *
//*********************************************

//****************The top module***************
module Master (
	
	//Inputs:
	//****from the arm*********
	rst_i,			//reset input:force the WISHBONE to restart, all the state mechine be set to initial
	clk_i,			//clock input:coordinate all the internal logic of WISHBONE
	mem_req,		//low active: the arm want to read the memory
//	mwr_arm,		//??
	memoryRead, 	//the arm want to read the memory
	memoryWrite,	//the arm want to write the memory
	addressBus,		//provide the address that the arm want to access
	//****from the salve*******
	dat_i,			//data from slave
	ack_i,			//ackownledge input, terminatea cycle
//  taga_i,			//provide information of the data
	
	//Outputs:
	adr_o,			//address [16:0]
	dat_o,			//data to salve
	we_o,			//write enable
	stb_o,			//the master is ready to accept data
	cyc_o,			//just the same thing as stb_o
	taga_o,			//information of the address: SSP? or Memory?
	
	//bidirectional ports：
	dataBus			//commuicate with ARM
	);
	
	//listing all the ports:
	input rst_i, clk_i, mem_req, memoryRead, memoryWrite, ack_i; 
	input [25:0] addressBus;
	input [31:0] dat_i;
	output [25:0] adr_o;
	output [31:0] dat_o;
	output we_o, stb_o, cyc_o;
	inout [31:0] dataBus;
	output taga_o;
	
	
	//initial regs and wires:
	reg [1:0] state;
	reg [1:0] next_state;
	reg we_o, stb_o, cyc_o;
//	reg [25:0] adr_o;
//	reg [31:0] dat_o;
	reg [31:0] dat_i_temp;
	
	//initial value assignment
	assign adr_o = addressBus;
	assign taga_o = mem_req;
	assign dataBus = (memoryRead)? dat_i_temp:32'hz;
	assign dat_o = dataBus;
	//*************Behavioral modeling***************

	always @ (posedge clk_i)      //control the transmission of states
	begin
		if (!rst_i)
			state <= 2'b00;       //To IDLE state
		else state <= next_state;
	end
	
	always @ (*)				//control the value of next_state
	begin
		if (!rst_i)
			next_state = 2'b00; 
		else 
		begin
			case (state)
			2'b00:    				//the IDLE state
			begin
				if (!mem_req)	next_state = 2'b01;		//to the VALID state
					else 		next_state = 2'b00;		//stay in the IDLE state
			end
			2'b01:					//the VALID state
			begin 
				if (ack_i)		next_state = 2'b11;		//to the RESP state
				else 			next_state = 2'b01; 	//stay in the VALID state
			end
			2'b11:					//the RESP state
			begin
				next_state = 2'b00;
			end
			endcase
		end
	end
	
	always @ (*)				//control the behavior of different states
	begin
//		if (rst_i)
//			begin
			case (state)
			2'b00:				//IDLE state: set all the signals to 0
				begin
//				adr_o = 'bz;
//				dat_o = 'bz;
				we_o = 0;
				stb_o = 0;
				cyc_o = 0;
//				taga_o = 'bz;
				end
			2'b01:				//VALID state: read and write
				begin
				stb_o = 1;
				cyc_o = 1;
				if (addressBus[16] == 0 && memoryRead == 1) //read instruction
					begin
					we_o = 0;
//					taga_o = 0; //"0" means memory
//					adr_o = addressBus; 
//					dat_o = 'bz;
					end
				else if (addressBus[16] == 1 && memoryRead == 1) //read SSP
					begin
					we_o = 0;
//					taga_o = 1;
//					adr_o = addressBus;
//					dat_o = 'bz;
					end
					else if (addressBus[16] == 1 && memoryRead == 0) //write SSP
						begin
						we_o = 1;
//						taga_o = 1; //"1" means SSP
//						adr_o = addressBus;
//						dat_o = dataBus; 
						end
				end
			2'b11:				//RESP state: latches data
				begin
//				adr_o = 'bz;
//				dat_o = 'bz;
				we_o = 0;
				stb_o = 0;
				cyc_o = 0;
//				taga_o = 'bz;
//				if (addressBus[16] == 0 && memoryRead == 1)
//				begin
				dat_i_temp = dat_i;
//				end
//				else if (addressBus[16] == 1 && memoryRead == 1)
//					begin
//					dat_i_temp[7:0] = dat_i[7:0];
//					dat_i_temp[31:8] = 24'h0; 
//					end
				end
			endcase
//			end
	end
				
endmodule			
				
	
			
			
	
	
	