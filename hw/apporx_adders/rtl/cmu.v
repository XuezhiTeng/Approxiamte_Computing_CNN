//*********************************************
//   This is a Clock module for WISHBONE      *
//   This is a design of Xuezhi Teng          *
//*********************************************

//****************The top module***************
module Clock (

	//Inputs:
	clk_i,
	clear_i,
	ssp_intr_i,
	//Outputs:
	phi1,
	phi2,
	clk_o,
	clear_o
	);
	
	input clk_i, clear_i;
	input [1:0] ssp_intr_i;
	output phi1, phi2, clk_o, clear_o;
	
	reg phi1, phi2;
	reg [1:0] cnt;

	assign clear_o = clear_i;
	assign clk_o = clk_i;

	
	always @ (posedge clk_i)
	begin
		if (!clear_i)
		begin
		cnt <= 0;
		phi1 <= 0;
		phi2 <= 0;
		end
		else if (ssp_intr_i[1] == 1)
			begin
			phi1 <= phi1;
			phi2 <= phi2;
			end
		else
			begin
			case (cnt)
			2'b00:
			begin
			phi1 <= 1;
			cnt <= 1;
			end
			2'b01:
			begin
			phi1 <= 0;
			cnt <= 2;
			end
			2'b10:
			begin
			phi2 <= 1;
			cnt <= 3;
			end
			2'b11:
			begin
			phi2 <= 0;
			cnt <= 0;
			end
			endcase
			end
	end
endmodule

			
		
	
	
