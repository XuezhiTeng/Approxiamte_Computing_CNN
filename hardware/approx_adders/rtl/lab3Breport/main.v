// 
// main.v
// 
// testenvironment
// 
// David Van Campenhout
// 

`include "test.config"
`include "signal.defs"
`include "signals2.defs"

`define fiq		TOP.ARM.fiq
`define irq		TOP.ARM.irq
`define swi		TOP.ARM.swi
`define und_i		TOP.ARM.undef_instr
`define d_abrt		TOP.ARM.data_abort
`define p_abrt		TOP.ARM.prefetch_abort

`define init_with_IRc	TOP.ARM.init_with_IRc

`define O_ror		TOP.ARM.CTRL.arm_ctrl_comb.zero_ror
`define O_shift	TOP.ARM.CTRL.arm_ctrl_comb.zero_shift
`define imm_op		TOP.ARM.imm_op
`define imm_amnt	TOP.ARM.imm_amnt
`define alu_s		TOP.ARM.DP.alu_s
`define alu_m		TOP.ARM.DP.alu_m
`define sh_in		TOP.ARM.DP.barrelShift.in
`define sh_amnt	TOP.ARM.DP.barrelShift.amount
`define sh_out		TOP.ARM.DP.barrelShift.out
`define IR		TOP.ARM.IR
`define sh_co		TOP.ARM.DP.shiftCarryOut

`define type_D		TOP.ARM.DP.barrelShift.type_D
`define type		TOP.ARM.DP.barrelShift.type
`define rrx		TOP.ARM.DP.barrelShift.rrx
`define right		TOP.ARM.DP.barrelShift.right
`define asr		TOP.ARM.DP.barrelShift.asr
`define s_cnst		TOP.ARM.DP.barrelShift.sel_cnst
//`define imm_amount	TOP.ARM.DP.barrelShift.imm_amount
`define left_amount	TOP.ARM.DP.barrelShift.left_amount
`define right_amount	TOP.ARM.DP.barrelShift.right_amount
`define amount		TOP.ARM.DP.barrelShift.amount
`define muxAs1		TOP.ARM.DP.barrelShift.mux_amount_s1
`define cnst		TOP.ARM.DP.barrelShift.cnst
`define inb		TOP.ARM.DP.barrelShift.inb
`define gte32		TOP.ARM.DP.barrelShift.gte32
`define IR7_xor	TOP.ARM.DP.barrelShift.IR7_xor
`define zero_amnt	TOP.ARM.DP.barrelShift.zero_amnt
`define imm_amnt_Q	TOP.ARM.DP.barrelShift.imm_amnt_Q
`define nR		TOP.ARM.DP.barrelShift.nR
`define nS1		TOP.ARM.DP.barrelShift.nS1
`define shift1		TOP.ARM.DP.barrelShift.shift1
`define over32		TOP.ARM.DP.barrelShift.shift_carry.over32
`define zero		TOP.ARM.DP.barrelShift.shift_carry.zero


`define fw_a		TOP.ARM.DP.forwardonA
`define fw_b		TOP.ARM.DP.forwardonB

module TOP;

  reg	phi1;
  reg	phi2;
  reg	clear;
  reg 	test;
  reg 	scanin;

  wire	[31:0]	dataBus;
  wire 	[25:0]	addressBus;
  wire 		r;
  wire		w;
  wire	scanout;

  reg 	[7:0]	i;

  integer	cycles;

  integer	regsFile;
   wire	[31:0]	R0_U;
   wire	[31:0]	R1_U;
   wire	[31:0]	R2_U;
   wire	[31:0]	R3_U;
   wire	[31:0]	R4_U;
   wire	[31:0]	R5_U;
   wire	[31:0]	R6_U;
   wire	[31:0]	R7_U;
   wire	[31:0]	R8_U;
   wire	[31:0]	R9_U;
   wire	[31:0]	R10_U;
   wire	[31:0]	R11_U;
   wire	[31:0]	R12_U;
   wire	[31:0]	R13_U;
   wire	[31:0]	R14_U;
   wire	[31:0]	R15;
   wire	[31:0]	R13_S;
   wire	[31:0]	R14_S;   
   wire	[31:0]	R8_F;
   wire	[31:0]	R9_F;
   wire	[31:0]	R10_F;
   wire	[31:0]	R11_F;
   wire	[31:0]	R12_F;
   wire	[31:0]	R13_F;
   wire	[31:0]	R14_F;
   wire	[31:0]	R13_I;
   wire	[31:0]	R14_I;
   
   //**********New wires****************
   wire rst_i, clk_i, mem_req, memread, memwrite, 
		ack, we, stb, cyc, taga, read, write, sel,
		sspw, phi1new, phi2new, sspclk, ssptxintr, ssprxintr, tagdata;
   wire [25:0] addbusam, adrms, addbussm;
   wire [31:0] datasm, datams, databusam,databussm;
   wire [1:0] sspintr;
   wire [7:0] pwdata, prdata;
   reg clk;
   
   assign sspintr[1]=ssptxintr;
   assign sspintr[0]=ssprxintr; 
   assign databussm[7:0] = (tagdata && !sspw)? prdata:32'hz;
   assign pwdata = databussm [7:0];
   //************************************
   
   assign	R0_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0];
   assign	R1_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1];
   assign	R2_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2];
   assign	R3_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3];
   assign	R4_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4];
   assign	R5_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5];
   assign	R6_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6];
   assign	R7_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7];
   assign	R8_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8];
   assign	R9_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9];
   assign	R10_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10];
   assign	R11_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11];
   assign	R12_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12];
   assign	R13_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[13];
   assign	R14_U = TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[14];
   assign	R15 =	{TOP.ARM.DP.regfile.STRUCT.stat_Q,
				TOP.ARM.DP.regfile.STRUCT.mask_Q,
				TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
				TOP.ARM.DP.regfile.STRUCT.mode_Q};
   assign	R8_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[16];
   assign	R9_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[17];
   assign	R10_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[18];
   assign	R11_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[19];
   assign	R12_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[20];
   assign	R13_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[21];
   assign	R14_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[22];
   assign	R13_I =	TOP.ARM.DP.regfile.STRUCT.IRQ13_Q;
   assign	R14_I =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[15];
   assign	R13_S =	TOP.ARM.DP.regfile.STRUCT.SVC13_Q;
   assign	R14_S =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23];
   
   

   initial //regfile
begin	
	if (`INIT_REGFILE) 
		begin		
			for  (i=0; i< 24; i=i+1)
				TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[i] = 32'b0;

			TOP.ARM.DP.regfile.STRUCT.SVC13.Q_temp = 32'b0;
//		TOP.ARM.DP.regfile.STRUCT.stat.Q_temp = 4'b0;
//		TOP.ARM.DP.regfile.STRUCT.mask.Q_temp = 2'b0;
			TOP.ARM.DP.regfile.STRUCT.pcAddr.Q_temp = 24'b0;
//		TOP.ARM.DP.regfile.STRUCT.mode.Q_temp = 2'b0;
			TOP.ARM.DP.regfile.STRUCT.IRQ13.Q_temp = 32'b0;
		end
	end

// scan stuff

/*  initial
	begin
		scanin 	= 0;
		test 	= 0;
	end*/
	
	// scan stuff

  initial
	begin
		scanin 	= 0;
		test 	= 0;
	end
  initial
	begin
		clk = 0;
	end
  always
	begin
	#20
		clk=~clk;
	end
  initial 
  #300000 $finish;

// clocks

/*  initial
	begin
		phi1 = 0;
		phi2 = 0;
	end

  always
	begin
		#`NONOVERLAP phi1 = 1;
		#`PHI_HIGH phi1 = 0;
		#`NONOVERLAP phi2 = 1;
		#`PHI_HIGH phi2 = 0;
	end
*/
// clear

  initial
	begin
		clear = 0;
	//	@(posedge phi1); #1;
		@(posedge clk); #1;
		clear = 1;
	end


  always
  	begin
  	@(negedge phi1) 
		if (`SCAN_CIRCULAR) scanin = scanout;
	end
	
  memory MEM( 	
		.dataBus(databussm), 
		.addressBus(addbussm), 
		.r(read), 
		.w(write), 
		.phi1(phi1new), 
		.phi2(phi2new));
  arm ARM( 	
		.phi1(phi1new), 
		.phi2(phi2new), 
		.clear(rst_i),
		.test(test),
		.scanin(scanin),
		.scanout(scanout),
		.addressBus(addbusam), 
		.dataBus(databusam), 
		.memoryRead(memread), 
		.memoryWrite(memwrite),
		.mem_req_bar(mem_req));
	Master MASTER( 
		.rst_i(rst_i), 
		.clk_i(clk_i), 
		.mem_req(mem_req), 
		.memoryRead(memread), 
		.memoryWrite(memwrite), 
		.addressBus(addbusam), 
		.dat_i(datasm), 
		.ack_i(ack),
		.adr_o(adrms), 
		.dat_o(datams),
		.we_o(we),
		.stb_o(stb),
		.cyc_o(cyc), 
		.taga_o(taga), 
		.dataBus(databusam));
	Slave  SLAVE( 
		.rst_i(rst_i), 
		.clk_i(clk_i), 
		.dat_i(datams),
		.adr_i(adrms),
		.taga_i(taga),
		.we_i(we), 
		.stb_i(stb), 
		.cyc_i(cyc), 
		.mem_adr_o(addbussm), 
		.mem_r_o(read),
		.mem_w_o(write),
		.ssp_sel_o(sel),
		.ssp_w_o(sspw),
		.dat_o(datasm),
		.ack_o(ack),
		.dataBus(databussm),
		.tagd_o(tagdata));
	SSP ssp(
		.PCLK(clk_i),
		.CLEAR_B(rst_i),
		.PSEL(sel),
		.PWRITE(sspw),
		.PWDATA(pwdata),
		.SSPCLKIN(sspclk),
		.SSPFSSIN(sspfss),
		.SSPRXD(sspdata),
		.PRDATA(prdata),
		.SSPOE_B(ob_b),
		.SSPTXD(sspdata),
		.SSPCLKOUT(sspclk),
		.SSPFSSOUT(sspfss),
		.SSPTXINTR(ssptxintr),
		.SSPRXINTR(ssprxintr)
		); 
	Clock CMU(
		.clk_i(clk),
		.clear_i(clear),
		.ssp_intr_i(sspintr),
		.phi1(phi1new),
		.phi2(phi2new),
		.clk_o(clk_i),
		.clear_o(rst_i));
	
	

  always 
	begin
		@(negedge phi2)	
			strobe_bus;
	end

  initial
  	begin
	if (`SCAN) 
		begin
		#( `SCAN_START * `CYCLE);
		#( `SCAN_OFFSET);
		test = 1;
		if (!`SCAN_CIRCULAR) 
			begin
				scanin = 1;
				#`CYCLE;
				scanin = 0;
				#`CYCLE;
				scanin = 1;
		 		#`CYCLE;
				scanin = 0;
		 		#`CYCLE;
			end
		#( `SCAN_CYCLES * `CYCLE);
		test = 0;
		end
	end
	
  initial
	begin
//  	$dumpvars;
	  regsFile = $fopen("regsFile.txt"); 
  	if ( regsFile == 0) $finish;
	
	StrobeRegsSTRUCT;
		
	for(i = 0; i< 64; i= i+ 1)
		$display("%d: %h", i, TOP.MEM.mem[i]);

	$stop;
	for (cycles = 0; cycles <= `CYCLES; cycles = cycles + 1)
		begin
//		if (cycles == `START_WAVES) Waves;
		@(negedge phi2); #1;
			StrobeRegsSTRUCT;
		end
	@(negedge phi2); #1;
	for(i = 0; i< 64; i= i+ 1)
		$display("%d: %h", i, TOP.MEM.mem[i]);
	$stop;
	$fclose (regsFile);
	$finish(2);
       	end  



//------------------------------------------------------------------------
/*************************************************************************
task StrobeRegs;
	begin
	$fstrobe(regsFile,"time: %t aBus: %h dBus: %h\nstate: %d      IR: %h            IRcurr: %h\nR0:  %h R1:  %h R2:  %h R3:  %h\nR4:  %h R5:  %h R6:  %h R7:  %h\nR8:  %h R9:  %h R10: %h R11: %h\nR12: %h R13S:%h R14S:%h R15: %h\n ",
		$realtime, 
		TOP.ARM.addressBus,
		TOP.ARM.dataBus,
		TOP.ARM.CTRL.state,
		TOP.ARM.IR,
		TOP.ARM.IRcurr,
		TOP.ARM.DP.regfile.REG[0],
		TOP.ARM.DP.regfile.REG[1],
		TOP.ARM.DP.regfile.REG[2],
		TOP.ARM.DP.regfile.REG[3],
		TOP.ARM.DP.regfile.REG[4],
		TOP.ARM.DP.regfile.REG[5],
		TOP.ARM.DP.regfile.REG[6],
		TOP.ARM.DP.regfile.REG[7],
		TOP.ARM.DP.regfile.REG[8],
		TOP.ARM.DP.regfile.REG[9],
		TOP.ARM.DP.regfile.REG[10],
		TOP.ARM.DP.regfile.REG[11],
		TOP.ARM.DP.regfile.REG[12],
		TOP.ARM.DP.regfile.REG[25],
		TOP.ARM.DP.regfile.REG[26],
		TOP.ARM.DP.regfile.pc);
	end
endtask
*************************************************************************/

task StrobeRegsSTRUCT;
	begin
	$fstrobe(regsFile,"time: %t aBus: %h dBus: %h\ncycles:%d rd: %d wr: %d clear %d test %d scanin %d\nstate: %d      IR: %h            IRcurr: %h\nR0:  %h R1:  %h R2:  %h R3:  %h\nR4:  %h R5:  %h R6:  %h R7:  %h\nR8:  %h R9:  %h R10: %h R11: %h\nR12: %h R13S:%h R14S:%h R15: %h\nqfull: %d\n",
		$realtime, 
		TOP.ARM.addressBus,
		TOP.ARM.dataBus,
		TOP.cycles,
		TOP.r,
		TOP.w,
		TOP.clear,
		TOP.test,
		TOP.scanin,
		TOP.ARM.CTRL.state,
		TOP.ARM.IR,
		TOP.ARM.IRcurr,
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12],
		TOP.ARM.DP.regfile.STRUCT.SVC13_Q,
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23],
		{TOP.ARM.DP.regfile.STRUCT.stat_Q,
		TOP.ARM.DP.regfile.STRUCT.mask_Q,
		TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
		TOP.ARM.DP.regfile.STRUCT.mode_Q},
		TOP.ARM.CTRL.qFull_D
		);
	end
endtask

/*************************************************************************
	"R0U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
	"R1U %h",	TOP.ARM.DP.regfile.REG[1],
	"R2U %h",	TOP.ARM.DP.regfile.REG[2],
	"R3U %h",	TOP.ARM.DP.regfile.REG[3],
	"R4U %h",	TOP.ARM.DP.regfile.REG[4],
	"R5U %h",	TOP.ARM.DP.regfile.REG[5],
	"R6U %h",	TOP.ARM.DP.regfile.REG[6],
	"R7U %h",	TOP.ARM.DP.regfile.REG[7],
	"R8U %h",	TOP.ARM.DP.regfile.REG[8],
	"R9U %h",	TOP.ARM.DP.regfile.REG[9],
	"R10U %h",	TOP.ARM.DP.regfile.REG[10],
	"R11U %h",	TOP.ARM.DP.regfile.REG[11],
	"R12U %h",	TOP.ARM.DP.regfile.REG[12],
	"R13U %h",	TOP.ARM.DP.regfile.REG[13],
	"R14U %h",	TOP.ARM.DP.regfile.REG[14],
	"R15 %h",	TOP.ARM.DP.regfile.pc,
	"R8F %h",	TOP.ARM.DP.regfile.REG[16],
	"R9F %h",	TOP.ARM.DP.regfile.REG[17],
	"R10F %h",	TOP.ARM.DP.regfile.REG[18],
	"R11F %h",	TOP.ARM.DP.regfile.REG[19],
	"R12F %h",	TOP.ARM.DP.regfile.REG[20],
	"R13F %h",	TOP.ARM.DP.regfile.REG[21],
	"R14F %h",	TOP.ARM.DP.regfile.REG[22],
	"R13I %h",	TOP.ARM.DP.regfile.REG[23],
	"R14I %h",	TOP.ARM.DP.regfile.REG[24],
	"R13S %h",	TOP.ARM.DP.regfile.REG[25],
	"R14S %h",	TOP.ARM.DP.regfile.REG[26],
*************************************************************************/

/*
task Waves;
	begin
	$gr_waves_memsize(`WAVES_MEMSIZE);
 	$gr_waves(
	"phi1 %b",	TOP.phi1,
	"phi2 %b",	TOP.phi2,
	"cycle %d",    cycles,
	"clear %b",	TOP.clear,
	"test %b",	TOP.test,
	"scanin %b",	TOP.scanin,
	"scanout %b",	TOP.scanout,
	"data %h",	TOP.dataBus,
	"address %h", 	TOP.addressBus,
	"AR_SL %h",	TOP.ARM.AR_select,
	"enAR %b",	TOP.ARM.DP.enAR,
	"_alignA %b",	TOP.ARM.DP.align_alu_addr_bar,
	"read %b", 	TOP.r,
	"write %b", 	TOP.w,
	"state_D %h", 	`state_D,
	"state_Q %h", 	`state_Q,
	"state %h", 	`state,
	"qFull_D %b", 	`qFull_D,
	"qFull_Q %b",	`qFull_Q,
	"IR %h", 		TOP.ARM.IR,
	"IR1 %h",		TOP.ARM.DP.Ireg.IR1,
	"IR2 %h",		TOP.ARM.DP.Ireg.IR2,
	"IRcurr %h",	TOP.ARM.IRcurr,
	"enIR1 %b", 	TOP.ARM.enIR1,
	"enIR2 %b", 	TOP.ARM.enIR2,
	"enIRc %b", 	TOP.ARM.enIRcurr,
	"addrReg %h",	TOP.ARM.DP.addressRegister,
	"Ifetch_D %b",	`Ifetch_D,
	"Ifetch_Q %b",	`Ifetch_Q,
	"cond %b",	TOP.ARM.IRcurr[31:28],
	"sDin %b", 	TOP.ARM.sDin,
	"ldstrbyte %b",	TOP.ARM.DP.ldstrByte,
	"byte %b",	TOP.ARM.DP.byte,
	"dpStat %b",	TOP.ARM.DP.dpStat,
	"mask %b",	TOP.ARM.mask,
	"pcAddr %h",	TOP.ARM.DP.pcAddr,
	"mode %d",	TOP.ARM.mode,
	"evalC_D %b",	`evalCondition_D,
	"evalC_Q %b",	`evalCondition_Q,
	"skip %b",	TOP.ARM.skip,
	"rA %h",		TOP.ARM.rA,
	"rB %h",		TOP.ARM.rB,
	"Aop %h",		TOP.ARM.DP.Aop,
	"Bop %h",		TOP.ARM.DP.Bop,
	"ShftA %h",	TOP.ARM.DP.shiftAmount,
//	"ShftT %h",	TOP.ARM.shiftType,

	"O_ror %b",	`O_ror,
	"O_shift %b",	`O_shift,
	"imm_op %b",	`imm_op,
	"imm_amnt %b",	`imm_amnt,
	"sh_amnt %h",	`sh_amnt,
	"sh_in %h",	`sh_in,
	"sh_out %h",	`sh_out,
	"alu_s %b",	`alu_s,
	"alu_m %b",	`alu_m,
	"sh_cond %b",	(`O_ror & `IR[25]) | (`O_shift & ~`IR[25]) ,
	"sh_co %b",	`sh_co,

	"Bopsh %h",	TOP.ARM.DP.BopShifted,
	"AluOp %h",	TOP.ARM.aluOperation,
	"aluOut %h",	TOP.ARM.DP.aluOut,
	"aluFlags %b",	TOP.ARM.DP.aluFlagsOut,
	"wStat %b",	TOP.ARM.DP.writeStatus,
	"dIn %h",		TOP.ARM.DP.dataIn,
	"enDIN %b",	TOP.ARM.DP.Ifetch_bar,
	"dOut %h",	TOP.ARM.DP.dataOut_mod.dout_q,
	"enW %b",		TOP.ARM.enW,
	"wA %h",		TOP.ARM.wA,
	"ar_clk %b",	`ar_clk,
	"enARf2 %b",	`enAR_phi2,

	"aop_s %b",	`aop_s,
	"bop_s %b",	`bop_s,
	"fw_a %b",	`fw_a,
	"fw_b %b",	`fw_b,

	"enMODE %b",	TOP.ARM.enMODE,
	"enINC %b",	TOP.ARM.enINC,
	"enMASK %b",	TOP.ARM.enMASK,
	"MODEw %b",	TOP.ARM.MODEw,
	"MASKw %b",	TOP.ARM.MASKw,
	"Aport %h",	TOP.ARM.DP.regfile.A,
	"Bport %h",	TOP.ARM.DP.regfile.B,
	"Wport %h",	TOP.ARM.DP.regfile.W,      
	"wA %h",		TOP.ARM.DP.regfile.wA,
	"enWphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_regfile_phi2,
	"enPCphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_pcAddr_phi2,
	"enmaskphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_mask_phi2,
	"enmodephi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_mode_phi2,
	"enstatphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_stat_phi2,
	"enIRQ13phi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_IRQ13_phi2,
	"enSVC13phi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_SVC13_phi2,
	"sel_inc %b",	TOP.ARM.DP.regfile.STRUCT.sel_inc,
	"sel_stat %b",	TOP.ARM.DP.regfile.STRUCT.sel_stat,
	"sel_mode %b",	TOP.ARM.DP.regfile.STRUCT.sel_mode,
	"sel_mask %b",	TOP.ARM.DP.regfile.STRUCT.sel_mask,
	"INCin %h", 	TOP.ARM.DP.regfile.STRUCT.INCin,
	"MODEin %h", 	TOP.ARM.DP.regfile.STRUCT.MODEin,
	"MASKin %h", 	TOP.ARM.DP.regfile.STRUCT.MASKin,
	"CONDin %h", 	TOP.ARM.DP.regfile.STRUCT.CONDin,
	"INCin %h", 	TOP.ARM.DP.regfile.STRUCT.INCin,
	"rCount %d",	TOP.ARM.DP.regCount,
	"rCount1 %d",	TOP.ARM.DP.regCount1,
	"rList_up %h",	TOP.ARM.DP.getreg.updated_reglist,
	"rList %h",	TOP.ARM.DP.getreg.reglist_q,
	"rEmpty %b",	TOP.ARM.DP.regListEmpty,
	"xReg_D %h",	TOP.ARM.DP.xReg_D,
	"rLinit %b",	TOP.ARM.DP.getreg.init,
	"rL_IRc %b",	`init_with_IRc,
	"R0U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
	"R1U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1],
	"R2U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2],
	"R3U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3],
	"R4U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4],
	"R5U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5],
	"R6U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6],
	"R7U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7],
	"R8U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8],
	"R9U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9],
	"R10U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10],
	"R11U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11],
	"R12U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12],
	"R13U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[13],
	"R14U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[14],
	"R15 %h",		{TOP.ARM.DP.regfile.STRUCT.stat_Q,
				TOP.ARM.DP.regfile.STRUCT.mask_Q,
				TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
				TOP.ARM.DP.regfile.STRUCT.mode_Q},
	"R8F %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[16],
	"R9F %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[17],
	"R10F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[18],
	"R11F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[19],
	"R12F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[20],
	"R13F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[21],
	"R14F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[22],
	"R13I %h",	TOP.ARM.DP.regfile.STRUCT.IRQ13_Q,
	"R14I %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[15],
	"R13S %h",	TOP.ARM.DP.regfile.STRUCT.SVC13_Q,
	"R14S %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23],
	"M0 %h",		TOP.MEM.mem[0],
	"M1 %h",		TOP.MEM.mem[1],
	"M2 %h",		TOP.MEM.mem[2],
	"M3 %h",		TOP.MEM.mem[3],
	"M4 %h",		TOP.MEM.mem[4],
	"M5 %h",		TOP.MEM.mem[5],
	"M6 %h",		TOP.MEM.mem[6],
	"M7 %h",		TOP.MEM.mem[7],
	"M8 %h",		TOP.MEM.mem[8],
	"M9 %h",		TOP.MEM.mem[9],
	"M10 %h",		TOP.MEM.mem[10],
	"M11 %h",		TOP.MEM.mem[11],
	"M12 %h",		TOP.MEM.mem[12],
	"M13 %h",		TOP.MEM.mem[13],
	"M14 %h",		TOP.MEM.mem[14],
	"M15 %h",		TOP.MEM.mem[15],
	"M16 %h",		TOP.MEM.mem[16],
	"M17 %h",		TOP.MEM.mem[17],
	"M18 %h",		TOP.MEM.mem[18],
	"M19 %h",		TOP.MEM.mem[19],
	"M20 %h",		TOP.MEM.mem[20],
	"M21 %h",		TOP.MEM.mem[21],
	"M22 %h",		TOP.MEM.mem[22],
	"M23 %h",		TOP.MEM.mem[23],
	"M24 %h",		TOP.MEM.mem[24],
	"M25 %h",		TOP.MEM.mem[25],
	"M26 %h",		TOP.MEM.mem[26],
	"M27 %h",		TOP.MEM.mem[27],
	"M28 %h",		TOP.MEM.mem[28],
	"M29 %h",		TOP.MEM.mem[29],
	"M30 %h",		TOP.MEM.mem[30],
	"M31 %h",		TOP.MEM.mem[31],
	"M32 %h",		TOP.MEM.mem[32],
	"M33 %h",		TOP.MEM.mem[33],
	"M34 %h",		TOP.MEM.mem[34],
	"M35 %h",		TOP.MEM.mem[35],
	"M36 %h",		TOP.MEM.mem[36],
	"M37 %h",		TOP.MEM.mem[37],
	"M38 %h",		TOP.MEM.mem[38],
	"M39 %h",		TOP.MEM.mem[39],
	"M40 %h",		TOP.MEM.mem[40],
	"M41 %h",		TOP.MEM.mem[41],
	"M42 %h",		TOP.MEM.mem[42],
	"M43 %h",		TOP.MEM.mem[43],
	"M44 %h",		TOP.MEM.mem[44],
	"M45 %h",		TOP.MEM.mem[45],
	"M46 %h",		TOP.MEM.mem[46],
	"M47 %h",		TOP.MEM.mem[47],
	"M48 %h",		TOP.MEM.mem[48],
	"M49 %h",		TOP.MEM.mem[49],
	"M50 %h",		TOP.MEM.mem[50],
	"M51 %h",		TOP.MEM.mem[51],
	"M52 %h",		TOP.MEM.mem[52],
	"M53 %h",		TOP.MEM.mem[53],
	"M54 %h",		TOP.MEM.mem[54],
	"M55 %h",		TOP.MEM.mem[55],
	"M56 %h",		TOP.MEM.mem[56],
	"M57 %h",		TOP.MEM.mem[57],
	"M58 %h",		TOP.MEM.mem[58],
	"M59 %h",		TOP.MEM.mem[59],
	"M60 %h",		TOP.MEM.mem[60],
	"M61 %h",		TOP.MEM.mem[61],
	"M62 %h",		TOP.MEM.mem[62],
	"M63 %h",		TOP.MEM.mem[63],
//"immA %h",	`imm_amount,
"rightA %h", 	`right_amount,
"left %h", 	`left_amount,
"amount %h",	`amount,
"muxAs1 %b",	`muxAs1,
"inb %h", 	`inb,
"over32 %b", 	`gte32,
"gte32 %b", 	`over32,
"zero %b", 	`zero,
"type_D %b",	`type_D,
"type %b",	`type,
"rrx %b",       `rrx,
"right %b",	`right,
"asr %b",	`asr,
"s_cnst %b",    `s_cnst,
"cnst %b",     	`cnst,
"IR7_xor %b",   `IR7_xor,
"zero_amnt %b",	`zero_amnt,
"imm_amnt_Q %h",`imm_amnt_Q,
"nR %b",	`nR,
"nS1 %b",	`nS1,
"shift1 %h",    `shift1,

"IR1so %b",	TOP.ARM.DP.Ireg.IR1[31],
"IR2so %b",	TOP.ARM.DP.Ireg.IR2[31],
"IRcurrso %b",	TOP.ARM.DP.Ireg.IRcurr[31],
"addrso %b",	TOP.ARM.DP.ar.scanout,
"Aopso %b",	TOP.ARM.DP.aop_reg.scanout,
"Bopso %b",	TOP.ARM.DP.bop_reg.scanout,
"rListso %b",	TOP.ARM.DP.getreg.scanout,
"dInso %b",	TOP.ARM.DP.dataIn_mod.scanout,
"dOutso %b",	TOP.ARM.DP.dataOut_mod.scanout,
"wAso %b",	TOP.ARM.wA_scanout
);

	$define_group_waves(1, "+/-All",
	"cycle %d",
	"phi1 %b",
	"phi2 %b",
	"data %h",
	"address %h",
	"AR_SL %h",
	"state %h",
	"IR %h",
	"addrReg %h",
	"cond %b",
	"dpStat %b",
	"mask %b",
	"pcAddr %h",
	"mode %d",
	"skip %b",
	"Ifetch_D %b",
	"Ifetch_Q %b",
	"rA %h",
	"rB %h",
	"enW %b",
	"wA %h",
	"Aop %h",
	"Bop %h",
	"ShftA %h",
//	"ShftT %h",
	"Bopsh %h",
	"AluOp %h",
	"aluOut %h",
	"wStat %b",
	"aluFlags %b",
	"reset %b",
	"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
	"R4U %h", "R5U %h", "R6U %h", "R7U %h",
	"R8U %h", "R9U %h", "R10U %h", "R11U %h",
	"R12U %h", "R13U %h", "R14U %h", "R15 %h",
	"R8F %h", "R9F %h", "R10F %h", "R11F %h",
	"R12F %h", "R13F %h", "R14F %h",
	"R13I %h", "R14I %h",
	"R13S %h", "R14S %h");


  	$define_group_waves(2, "Bus",
	"cycle %d",
	"phi1 %b",
	"phi2 %b",
	"data %h",
	"address %h",
	"read %b",
	"write %b",
	"enDIN %b",
	"dIn %h",
	"dOut %h",	
	"ldstrbyte %b",
	"byte %b");

	$define_group_waves(3, " User Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13U %h", "R14U %h", "R15 %h");

	$define_group_waves(4, " FIRQ Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8F %h", "R9F %h", "R10F %h", "R11F %h",
		 "R12F %h", "R13F %h", "R14F %h", "R15 %h");

	$define_group_waves(5, " IRQ Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13I %h", "R14I %h", "R15 %h");

	$define_group_waves(6, " SVC Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13S %h", "R14S %h", "R15 %h");


	
  	$define_group_waves(7, "State",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"IR1 %h",
		"IR2 %h",
		"IRcurr %h",
		"enIR1 %b",
		"enIR2 %b",
		"enIRc %b",
		"qFull_D %b",
		"qFull_Q %b",
		"qFull %b",
		"state %h",
		"state_D %h",
		"state_Q %h",
		"Ifetch_D %b",
		"Ifetch_Q %b",
		"AR_SL %h",
		"enAR %b",
		"enARf2 %b",
		"ar_clk %b",
		"_alignA %b",
		"sDin %b",
		"cond %b",
		"dpStat %b",
		"mask %b",
		"pcAddr %h",
		"mode %b",
		"skip %b",
		"aluFlags %b",
		"wStat %b",
		"enMODE %b",
		"enINC %b",
		"enMASK %b",
		"MODEw %b",
		"MASKw %b",
		"evalC_D %b",
		"evalC_Q %b"
		);
		
   	$define_group_waves(8, "Mem",
	"cycle %d",
		"phi1 %h", "phi2 %h", "address %h", "data %h",
		"read %b", "write %b",	"ldstrbyte %b",
		"M32 %h", "M33 %h", "M34 %h", "M35 %h",
		"M36 %h", "M37 %h", "M38 %h", "M39 %h",
		"M40 %h", "M41 %h", "M42 %h", "M43 %h",
		"M44 %h", "M45 %h", "M46 %h", "M47 %h",
		"M48 %h", "M49 %h", "M50 %h", "M51 %h",
		"M52 %h", "M53 %h", "M54 %h", "M55 %h",
		"M56 %h", "M57 %h", "M58 %h", "M59 %h",
		"M60 %h", "M61 %h", "M62 %h", "M63 %h",
		"M0 %h", "M1 %h", "M2 %h", "M3 %h",
		"M4 %h", "M5 %h", "M6 %h", "M7 %h", 
		"M8 %h", "M9 %h", "M10 %h", "M11 %h", 
		"M12 %h", "M13 %h", "M14 %h", "M15 %h", 
		"M16 %h", "M17 %h", "M18 %h", "M19 %h", 
		"M20 %h", "M21 %h", "M22 %h", "M23 %h", 
		"M24 %h", "M25 %h", "M26 %h", "M27 %h", 
		"M28 %h", "M29 %h", "M30 %h", "M31 %h");

   	$define_group_waves(9, "Regfile",
	"cycle %d",
		"phi1 %b", "phi2 %b", "clear %b", "rA %h", "Aport %h", 
		"rB %h", "Bport %h", "wA %h", "Wport %h",
		"INCin %h",
		"STATin %b",
		"MODEin %b",
		"CONDin %b",
		 "enW %h",
		"enINC %b",
		"enMODE %b",
		"enMASK %b",
		"enWphi2 %b",   
		"enPCphi2 %b",  
		"enmaskphi2 %b",
		"enmodephi2 %b",
		"enstatphi2 %b",
		"enIRQ13phi2 %b",
		"enSVC13phi2 %b",
		"sel_inc %b",
		"sel_mode %b",
		"sel_mask %b",	
		"sel_stat %b");

   	$define_group_waves(10, "Multiple",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"rEmpty %b",
		"rCount %d",
		"rCount1 %d",
		"rList_up %h",
		"xReg_D %h",
		"rLinit %b",
		"rL_IRc %b");

   	$define_group_waves(11, "tstflgs",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"cond %b",
		"dpStat %b",
		"skip %b",
		"aluFlags %b",
		"evalC %b",
		"wStat %b",
		"enstatphi2 %b",
		"enW %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);

   	$define_group_waves(11, "tstalu",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
		"aluFlags %b",
		"evalC %b",
		"wStat %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"R14S %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);
   	$define_group_waves(12, "tstshft",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
		"aluFlags %b",
		"wStat %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"R4U %h",
		"R5U %h",
		"R6U %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);


   	$define_group_waves(13, "dp",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
	        "sh_co %b", 
		"aluFlags %b",
		"wStat %b",
		"Aop %h",
		"Bop %h",
		"aop_s %b",
		"bop_s %b",
		"fw_a %b",
		"fw_b %b",
		"O_shift %b",
		"O_ror %b",
		"imm_op %b",
		"imm_amnt %b",
		"alu_s %b",
		"alu_m %b",
		"aluOut %h"
		);


   	$define_group_waves(14, "shift",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"dpStat %b",
		"aluFlags %b",
		"wStat %b",
		"Aop %h",
		"Bop %h",
		"BopSh %h",
		"alu_s %b",
		"alu_m %b",
		"aluOut %h",
//"immA %h",     
"rightA %h",   
"left %h",     
"amount %h",   
"muxAs1 %b",
"inb %h",      
"over32 %b",   
"gte32 %b",    
"zero %b",     
"type_D %b",   
"type %b",     
"rrx %b",      
"right %b",
"asr %b",
"s_cnst %b",
"cnst %b",     
"IR7_xor %b",  
"zero_amnt %b", 
"imm_amnt_Q %h",
"nR %b",       
"nS1 %b",      
"shift1 %h");

   	$define_group_waves(15, "scan",
"cycle %d",
"phi1 %b", 
"phi2 %b",
"test %b",
"scanin %b",
"scanout %b",

"IR1 %h",
"IR1so %b",
"IR2 %h",
"IR2so %b",
"IRcurr %h",
"IRcurrso %b",
"address %h",
"addrso %b",
"Aop %h",
"Aopso %b",
"Bop %h",
"Bopso %b",
//shift
"rList %h",
"rListso %b",
"dIn %h",
"dInso %b",
"dOut %h",
"dOutso %b",
"wA %h",
"wAso %b"
);




	
	end
endtask
*/
task strobe_test;
	begin
	case (`TESTPROGRAM)
	`TEST_MULTI : 
$strobe( "cycle: %d ",
cycles);
	`TEST_MULT : 
$strobe( "cycle: %d ",
cycles);
	`TEST_DIV : 
$strobe( "cycle: %d ",
cycles);
	endcase
	end
endtask

task strobe_bus;
	begin
	$strobe( "cycle: %d aBus: %h  dBus:%h ",
				cycles,
			 	addressBus, 
			 	dataBus);
	end
endtask

task strobe_test_alu;
	begin
$strobe( "cycle: %d ",
cycles);
	end
endtask

//------------------------------------------------------------------------

endmodule








