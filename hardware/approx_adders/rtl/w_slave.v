//*********************************************
//   This is a Slave module for WISHBONE      *
//   This is a design of Xuezhi Teng          *
//*********************************************

//****************The top module***************
module Slave (
	
	//Inputs:
	//****from the cmu*********
	rst_i,			//reset input:force the WISHBONE to restart, all the state mechine be set to initial
	clk_i,			//clock input:coordinate all the internal logic of WISHBONE
	//****from the master*******
	dat_i,			//data from master
	adr_i,			//address from master
	taga_i,			//provide information of the data
	we_i,			
	stb_i,
	cyc_i,
	
	//Outputs:
	mem_adr_o,
	mem_r_o,
	mem_w_o,
	ssp_sel_o,
	ssp_w_o,
	dat_o,
	ack_o,			//ackownledge input, terminatea cycle
	tagd_o,
	//bidirectional ports：
	dataBus			//commuicate with ARM
	);
	
	//listing all the ports:
	input rst_i, clk_i, taga_i, we_i, stb_i, cyc_i; 
	input [31:0] dat_i;
	input [25:0] adr_i;
	output [25:0] mem_adr_o;
	output mem_r_o, mem_w_o, ssp_sel_o, ssp_w_o, ack_o, tagd_o;
	output [31:0] dat_o;
	inout [31:0]dataBus;
	
	//listing all the ports:
	reg [1:0] state;
	reg [1:0] next_state;
	reg mem_r_o, mem_w_o, ssp_sel_o, ssp_w_o, ack_o, tagd_o;
//	reg [31:0] dat_o;
//	reg [31:0] dataBus;
//	reg [25:0] mem_adr_o;
	reg [31:0] dat_i_temp;
	reg [31:0] dataBus_temp;  
	
	//initial value assignment
	assign mem_adr_o = adr_i;
	assign dataBus = (we_i)? dat_i_temp:32'hz;
	assign dat_o[31:8] = (adr_i[16])? 24'h0:dataBus_temp[31:8];
	assign dat_o[7:0] = dataBus_temp[7:0];
	//*************Behavioral modeling***************
	always @ (posedge clk_i)
	begin
		if (!rst_i)
			state <= 2'b00;
		else state <= next_state;
	end
	
	always @ (*)
	begin
		if (!rst_i)
			next_state = 2'b00;
		else
		begin
			case (state)
			2'b00:			//IDLE state
			begin
				if (!taga_i)	next_state = 2'b01;
				else 			next_state = 2'b00;
			end
			2'b01:
			begin			//WAIT state
				next_state = 2'b10;
			end
			2'b10: 			//READY state
			begin
				next_state = 2'b11;
			end
			2'b11:			//RESP state
			begin
				next_state = 2'b00;
			end
			endcase
		end
	end		
	
	always @ (*)
	begin
//		if (rst_i)
//			begin
			case (state)
			2'b00:
				begin
//				dat_o = 'bz;
				ack_o = 0;
				mem_r_o = 0;
				mem_w_o = 0;
				ssp_sel_o = 0;
				ssp_w_o = 0;
//				mem_adr_o = 'bz;
				end
			2'b01:
				begin
				if (adr_i[16] == 0 && we_i == 0)	//read instruction
					begin
					mem_r_o = 1;
					mem_w_o = 0;
					ssp_sel_o = 0;
					ssp_w_o = 0;
					end
					else if (adr_i[16] == 1 && we_i == 0)	//read SSP
						begin
						mem_r_o = 0;
						mem_w_o = 0;
						ssp_sel_o = 1;
						ssp_w_o = 0;
						end
				end		
			2'b10:
				begin
//				ack_o = 1;
				if (adr_i[16] == 0 && we_i == 0)   //read instruction
					begin
						ack_o = 1;
//						mem_adr_o = adr_i;
//						dat_o = dataBus;
//						mem_r_o = 1;
//						mem_w_o = 0;
						dataBus_temp = dataBus;
					end
					else if (adr_i[16] == 1 && we_i == 0) //read SSP
						begin
						ack_o = 1;
//						dat_o = dataBus;
						ssp_sel_o = 0;
//						mem_r_o = 0;
//						mem_w_o = 0;
						ssp_w_o = 0;
						tagd_o = 1;
//						mem_adr_o = adr_i;
						dataBus_temp = dataBus;
						end
						else if (adr_i[16] == 1 && we_i == 1)  //write SSP
							begin
//							dat_o = 'bz;
//							mem_r_o = 0;
//							mem_w_o = 0;
							ssp_sel_o = 1;
							ssp_w_o = 1;
							dat_i_temp = dat_i;
//							mem_adr_o = 'bz;
							end
				end
			2'b11:
				begin
				ack_o = 0;
				ssp_sel_o = 0;
				ssp_w_o = 0;
				tagd_o = 0;
//				dat_i_temp = dat_i;
				end
			endcase
//			end
	end	

endmodule	
						
					
			
				
	