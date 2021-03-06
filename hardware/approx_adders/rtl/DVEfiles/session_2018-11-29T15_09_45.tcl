# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Nov 29 15:09:44 2018
# Designs open: 1
#   Sim: /home/ecelrc/students/xteng/vlsi1/lab3/rtl/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: TOP.ssp
#   Group count = 10
#   Group Group1 signal count = 25
#   Group SLAVE signal count = 19
#   Group Group2 signal count = 17
#   Group Group3 signal count = 7
#   Group Group4 signal count = 2
#   Group ARM signal count = 15
#   Group slave signal count = 18
#   Group master signal count = 17
#   Group arm_memory signal count = 8
#   Group txfifo signal count = 23
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP1_Full64
# DVE build date: Nov 24 2015 21:15:24


#<Session mode="Full" path="/home/ecelrc/students/xteng/vlsi1/lab3/rtl/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set -value 1000

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{0 23} {1474 805}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 130]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 130
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 129} {height 515} {dock_state left} {dock_on_new_line true} {child_hier_colhier 140} {child_hier_coltype 100} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 208]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 208
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 530
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 207} {height 515} {dock_state left} {dock_on_new_line true} {child_data_colvariable 140} {child_data_colvalue 100} {child_data_coltype 40} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 173]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1476
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 173
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1474} {height 172} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui }}
gui_set_env SIMSETUP::SIMEXE {/home/ecelrc/students/xteng/vlsi1/lab3/rtl/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/ecelrc/students/xteng/vlsi1/lab3/rtl/simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui } -dir /home/ecelrc/students/xteng/vlsi1/lab3/rtl -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1s
gui_set_time_units 1s
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {TOP.ARM}
gui_load_child_values {TOP.SLAVE}
gui_load_child_values {TOP.CMU}
gui_load_child_values {TOP.MASTER}
gui_load_child_values {TOP}
gui_load_child_values {TOP.ssp.TxFIFO_tester}


set _session_group_1 Group1
gui_sg_create "$_session_group_1"
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { TOP.R0_U TOP.R1_U TOP.R2_U TOP.R3_U TOP.R4_U TOP.R5_U TOP.R6_U TOP.addbusam TOP.MASTER.rst_i TOP.MASTER.clk_i TOP.MASTER.mem_req TOP.MASTER.memoryRead TOP.MASTER.memoryWrite TOP.MASTER.ack_i TOP.MASTER.addressBus TOP.MASTER.dat_i TOP.MASTER.adr_o TOP.MASTER.dat_o TOP.MASTER.we_o TOP.MASTER.stb_o TOP.MASTER.cyc_o TOP.MASTER.dataBus TOP.MASTER.taga_o TOP.MASTER.state TOP.MASTER.next_state }

set _session_group_2 SLAVE
gui_sg_create "$_session_group_2"
set SLAVE "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { TOP.SLAVE.dat_i TOP.SLAVE.cyc_i TOP.SLAVE.dat_o TOP.SLAVE.we_i TOP.SLAVE.adr_i TOP.SLAVE.stb_i TOP.SLAVE.ack_o TOP.SLAVE.ssp_w_o TOP.SLAVE.ssp_sel_o TOP.SLAVE.mem_w_o TOP.SLAVE.next_state TOP.SLAVE.mem_adr_o TOP.SLAVE.state TOP.SLAVE.rst_i TOP.SLAVE.dataBus TOP.SLAVE.taga_i TOP.SLAVE.mem_r_o TOP.SLAVE.clk_i TOP.databusam }

set _session_group_3 Group2
gui_sg_create "$_session_group_3"
set Group2 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { TOP.MASTER.dat_i TOP.MASTER.dat_o TOP.MASTER.memoryRead TOP.MASTER.cyc_o TOP.MASTER.ack_i TOP.MASTER.we_o TOP.MASTER.adr_o TOP.MASTER.stb_o TOP.MASTER.memoryWrite TOP.MASTER.next_state TOP.MASTER.state TOP.MASTER.rst_i TOP.MASTER.mem_req TOP.MASTER.dataBus TOP.MASTER.taga_o TOP.MASTER.clk_i TOP.MASTER.addressBus }

set _session_group_4 Group3
gui_sg_create "$_session_group_4"
set Group3 "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { TOP.R6_U TOP.R0_U TOP.R1_U TOP.R2_U TOP.R3_U TOP.R4_U TOP.R5_U }

set _session_group_5 Group4
gui_sg_create "$_session_group_5"
set Group4 "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { TOP.CMU.phi1 TOP.CMU.phi2 }

set _session_group_6 ARM
gui_sg_create "$_session_group_6"
set ARM "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { TOP.ARM.dataBus TOP.ARM.addressBus TOP.ARM.phi1 TOP.ARM.phi2 TOP.ARM.clear TOP.ARM.test TOP.ARM.scanin TOP.ARM.scanout TOP.ARM.en_buses_bar TOP.ARM.mem_req_bar TOP.ARM.mem_write_read TOP.ARM.mem_word_byte TOP.ARM.mode_bar TOP.ARM.memoryWrite TOP.ARM.memoryRead }

set _session_group_7 slave
gui_sg_create "$_session_group_7"
set slave "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { TOP.SLAVE.dat_i TOP.SLAVE.cyc_i TOP.SLAVE.dat_o TOP.SLAVE.we_i TOP.SLAVE.adr_i TOP.SLAVE.stb_i TOP.SLAVE.ack_o TOP.SLAVE.ssp_w_o TOP.SLAVE.ssp_sel_o TOP.SLAVE.mem_w_o TOP.SLAVE.next_state TOP.SLAVE.mem_adr_o TOP.SLAVE.rst_i TOP.SLAVE.state TOP.SLAVE.taga_i TOP.SLAVE.dataBus TOP.SLAVE.mem_r_o TOP.SLAVE.clk_i }

set _session_group_8 master
gui_sg_create "$_session_group_8"
set master "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { TOP.MASTER.dat_i TOP.MASTER.dat_o TOP.MASTER.memoryRead TOP.MASTER.cyc_o TOP.MASTER.ack_i TOP.MASTER.we_o TOP.MASTER.adr_o TOP.MASTER.stb_o TOP.MASTER.memoryWrite TOP.MASTER.next_state TOP.MASTER.state TOP.MASTER.rst_i TOP.MASTER.mem_req TOP.MASTER.dataBus TOP.MASTER.taga_o TOP.MASTER.clk_i TOP.MASTER.addressBus }

set _session_group_9 arm_memory
gui_sg_create "$_session_group_9"
set arm_memory "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { TOP.databusam TOP.R6_U TOP.R0_U TOP.R1_U TOP.R2_U TOP.R3_U TOP.R4_U TOP.R5_U }

set _session_group_10 txfifo
gui_sg_create "$_session_group_10"
set txfifo "$_session_group_10"

gui_sg_addsignal -group "$_session_group_10" { TOP.ssp.TxFIFO_tester.PSEL TOP.ssp.TxFIFO_tester.PWRITE TOP.ssp.TxFIFO_tester.CLEAR_B TOP.ssp.TxFIFO_tester.PCLK TOP.ssp.TxFIFO_tester.SENT TOP.ssp.TxFIFO_tester.PWDATA TOP.ssp.TxFIFO_tester.TxDATA TOP.ssp.TxFIFO_tester.SSPTXINTR TOP.ssp.TxFIFO_tester.VALID TOP.ssp.TxFIFO_tester.full TOP.ssp.TxFIFO_tester.empty TOP.ssp.TxFIFO_tester.wre TOP.ssp.TxFIFO_tester.rde TOP.ssp.TxFIFO_tester.wp TOP.ssp.TxFIFO_tester.rp TOP.ssp.TxFIFO_tester.mcell0 TOP.ssp.TxFIFO_tester.mcell1 TOP.ssp.TxFIFO_tester.mcell2 TOP.ssp.TxFIFO_tester.mcell3 TOP.ssp.TxFIFO_tester.flag0 TOP.ssp.TxFIFO_tester.flag1 TOP.ssp.TxFIFO_tester.flag2 TOP.ssp.TxFIFO_tester.flag3 }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 3860



# Save global setting...

# Wave/List view global setting
gui_list_create_group_when_add -wave -enable
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} TOP}
catch {gui_list_expand -id ${Hier.1} TOP.ssp}
catch {gui_list_select -id ${Hier.1} {TOP.ssp.TxFIFO_tester}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {TOP.ssp.TxFIFO_tester}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {TOP.ssp.TxFIFO_tester.PWRITE TOP.ssp.TxFIFO_tester.SENT TOP.ssp.TxFIFO_tester.SSPTXINTR TOP.ssp.TxFIFO_tester.TxDATA TOP.ssp.TxFIFO_tester.PCLK TOP.ssp.TxFIFO_tester.PSEL TOP.ssp.TxFIFO_tester.CLEAR_B TOP.ssp.TxFIFO_tester.wp TOP.ssp.TxFIFO_tester.empty TOP.ssp.TxFIFO_tester.rp TOP.ssp.TxFIFO_tester.PWDATA TOP.ssp.TxFIFO_tester.VALID TOP.ssp.TxFIFO_tester.mcell0 TOP.ssp.TxFIFO_tester.mcell1 TOP.ssp.TxFIFO_tester.full TOP.ssp.TxFIFO_tester.mcell2 TOP.ssp.TxFIFO_tester.mcell3 TOP.ssp.TxFIFO_tester.wre TOP.ssp.TxFIFO_tester.flag0 TOP.ssp.TxFIFO_tester.rde TOP.ssp.TxFIFO_tester.flag1 TOP.ssp.TxFIFO_tester.flag2 TOP.ssp.TxFIFO_tester.flag3 }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active TOP.ssp /home/ecelrc/students/xteng/vlsi1/lab3/rtl/SSP.v
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
#</Session>

