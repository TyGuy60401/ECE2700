## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {ui[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[0]}]
set_property PACKAGE_PIN V16 [get_ports {ui[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[1]}]
set_property PACKAGE_PIN W16 [get_ports {ui[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[2]}]
set_property PACKAGE_PIN W17 [get_ports {ui[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[3]}]
set_property PACKAGE_PIN W15 [get_ports {ui[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[4]}]
set_property PACKAGE_PIN V15 [get_ports {ui[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[5]}]
set_property PACKAGE_PIN W14 [get_ports {ui[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[6]}]
set_property PACKAGE_PIN W13 [get_ports {ui[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui[7]}]

set_property PACKAGE_PIN V2 [get_ports {ui_addr[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui_addr[0]}]
set_property PACKAGE_PIN T3 [get_ports {ui_addr[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui_addr[1]}]
set_property PACKAGE_PIN T2 [get_ports {ui_addr[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui_addr[2]}]
set_property PACKAGE_PIN R3 [get_ports {ui_addr[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ui_addr[3]}]
	
set_property PACKAGE_PIN W2 [get_ports {cmd[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cmd[0]}]
set_property PACKAGE_PIN U1 [get_ports {cmd[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cmd[1]}]
set_property PACKAGE_PIN T1 [get_ports {cmd[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cmd[2]}]
set_property PACKAGE_PIN R2 [get_ports {cmd[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cmd[3]}]






# LEDs
set_property PACKAGE_PIN U16 [get_ports {acc_out[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {acc_out[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {acc_out[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {acc_out[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {acc_out[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {acc_out[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {acc_out[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {acc_out[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[7]}]
#set_property PACKAGE_PIN V13 [get_ports {acc_out[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[8]}]
#set_property PACKAGE_PIN V3 [get_ports {acc_out[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {acc_out[9]}]
	

##Buttons
set_property PACKAGE_PIN U18 [get_ports E]						
	set_property IOSTANDARD LVCMOS33 [get_ports E]
set_property PACKAGE_PIN T18 [get_ports rst]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst]
#set_property PACKAGE_PIN W19 [get_ports sensor]						
	#set_property IOSTANDARD LVCMOS33 [get_ports sensor]
#set_property PACKAGE_PIN T17 [get_ports btnR]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 