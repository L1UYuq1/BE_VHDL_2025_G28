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
-- Generated on "09/12/2025 09:17:45"
                                                       	 
-- Vhdl Test Bench template for design  :  SpeedController
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;                                          	 
USE ieee.std_logic_1164.all;                           	 

ENTITY SpeedController_vhd_tst IS
END SpeedController_vhd_tst;
ARCHITECTURE SpeedController_arch OF SpeedController_vhd_tst IS
-- constants                                            	 
-- signals                                              	 
SIGNAL clk : STD_LOGIC;
SIGNAL mode : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL shift : STD_LOGIC;
COMPONENT SpeedController
    PORT (
    clk : IN STD_LOGIC;
    mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rst : IN STD_LOGIC;
    shift : OUT STD_LOGIC
    );
END COMPONENT;
BEGIN
    i1 : SpeedController
    PORT MAP (
-- list connections between master ports and signals
    clk => clk,
    mode => mode,
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
    wait for 100ns;
    rst <= '0';
    wait for 80ns;
    rst <= '1';
    wait;
                                                  	 
END PROCESS rst_in;


mode_in : PROCESS                                          	 
-- variable declarations                                	 
BEGIN                                                   	 
    mode <= "00";
    wait for 3ms;
    mode <= "01";
    wait for 6ms;
    mode <= "10";
    wait for 8ms;
    mode <= "11";
    wait;
                                                  	 
END PROCESS mode_in;
                              	 
END SpeedController_arch;


