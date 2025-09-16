-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/15/2025 21:08:09"
                                                            
-- Vhdl Test Bench template for design  :  RegisterS
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegisterS_vhd_tst IS
END RegisterS_vhd_tst;
ARCHITECTURE RegisterS_arch OF RegisterS_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL direction : STD_LOGIC;
SIGNAL dout : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL shift : STD_LOGIC;
COMPONENT RegisterS
	PORT (
	clk : IN STD_LOGIC;
	direction : IN STD_LOGIC;
	dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	rst : IN STD_LOGIC;
	shift : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RegisterS
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	direction => direction,
	dout => dout,
	rst => rst,
	shift => shift
	);

	clk_in : PROCESS                                          	 
	-- variable declarations                                	 
	BEGIN                                                   	 
		 clk <= '0';
		 wait for 10ns;
		 clk <= '1';
		 wait for 10ns;                                 	 
	END PROCESS clk_in;


	rst_in : PROCESS                                          	 
	-- variable declarations                                	 
	BEGIN                                                   	 
		 rst <= '1';
		 wait for 50ns;
		 rst <= '0';
		 wait for 40ns;
		 rst <= '1';
		 wait;
																		 
	END PROCESS rst_in;


	shift_in : PROCESS                                          	 
	-- variable declarations                                	 
	BEGIN                                                   	 
		 shift <= '0';
		 wait for 100ns;
		 shift <= '1';
		 wait for 20ns;
																		 
	END PROCESS shift_in;
	
	direction_in : PROCESS                                          	 
	-- variable declarations                                	 
	BEGIN                                                   	 
		 direction <= '0';
		 wait for 600ns;
		 direction <= '1';
		 wait for 600ns;
																		 
	END PROCESS direction_in;

END RegisterS_arch;


