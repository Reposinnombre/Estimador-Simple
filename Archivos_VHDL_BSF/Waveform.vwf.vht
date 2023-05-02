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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/01/2023 17:19:48"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          estimador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY estimador_vhd_vec_tst IS
END estimador_vhd_vec_tst;
ARCHITECTURE estimador_arch OF estimador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cociente_mI_mG : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL direccion : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL gamma : STD_LOGIC_VECTOR(40 DOWNTO 0);
SIGNAL guardar : STD_LOGIC;
SIGNAL guardar2 : STD_LOGIC;
SIGNAL guardar_NG : STD_LOGIC;
SIGNAL H_funcion : STD_LOGIC;
SIGNAL H_med : STD_LOGIC;
SIGNAL hab : STD_LOGIC;
SIGNAL Hab_reg_med : STD_LOGIC;
SIGNAL Hc : STD_LOGIC;
SIGNAL Hr_memoria : STD_LOGIC;
SIGNAL Hw_memoria : STD_LOGIC;
SIGNAL med_G : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL med_I : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL N_G : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL N_I : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL Q : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL sigma : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT estimador
	PORT (
	clk : IN STD_LOGIC;
	cociente_mI_mG : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	direccion : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	gamma : OUT STD_LOGIC_VECTOR(40 DOWNTO 0);
	guardar : IN STD_LOGIC;
	guardar2 : IN STD_LOGIC;
	guardar_NG : IN STD_LOGIC;
	H_funcion : IN STD_LOGIC;
	H_med : IN STD_LOGIC;
	hab : IN STD_LOGIC;
	Hab_reg_med : IN STD_LOGIC;
	Hc : IN STD_LOGIC;
	Hr_memoria : IN STD_LOGIC;
	Hw_memoria : IN STD_LOGIC;
	med_G : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	med_I : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	N_G : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	N_I : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	rst : IN STD_LOGIC;
	sigma : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
	
	CONSTANT N : NATURAL := 153600000;
	
BEGIN
	i1 : estimador
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cociente_mI_mG => cociente_mI_mG,
	direccion => direccion,
	gamma => gamma,
	guardar => guardar,
	guardar2 => guardar2,
	guardar_NG => guardar_NG,
	H_funcion => H_funcion,
	H_med => H_med,
	hab => hab,
	Hab_reg_med => Hab_reg_med,
	Hc => Hc,
	Hr_memoria => Hr_memoria,
	Hw_memoria => Hw_memoria,
	med_G => med_G,
	med_I => med_I,
	N_G => N_G,
	N_I => N_I,
	Q => Q,
	rst => rst,
	sigma => sigma
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 1600
	LOOP
		clk <= '0';
		WAIT FOR 150000 ps;
		clk <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '0';
	WAIT FOR 0 ps;
	rst <= '1';
	WAIT FOR 480000000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

-- hab
t_prcs_hab: PROCESS
BEGIN
	hab <= '0';
	WAIT FOR 153600000 ps;
	hab <= '1';
	WAIT FOR 153600000 ps;
	hab <= '0';
	WAIT FOR 153600000 ps;
	hab <= '1';
WAIT;
END PROCESS t_prcs_hab;

-- guardar
t_prcs_guardar: PROCESS
BEGIN
	guardar <= '0';
	WAIT FOR 153600000 ps;
	guardar <= '1';
	WAIT FOR 480000000 ps - 153600000 ps;
	guardar <= '0';
WAIT;
END PROCESS t_prcs_guardar;

-- guardar2
t_prcs_guardar2: PROCESS
BEGIN
	guardar2 <= '0';
	WAIT FOR 3*153600000 ps + 300000 ps;
	guardar2 <= '1';
	WAIT FOR 480000000 ps - 3*153600000 ps - 300000 ps;
	guardar2 <= '0';
WAIT;
END PROCESS t_prcs_guardar2;

-- Hc
t_prcs_Hc: PROCESS
BEGIN
	Hc <= '0';
	WAIT FOR 2*153600000 ps;
	Hc <= '1';
	WAIT FOR 153600000 ps + 300000 ps;
	Hc <= '0';
WAIT;
END PROCESS t_prcs_Hc;

-- guardar_NG
t_prcs_guardar_NG: PROCESS
BEGIN
	guardar_NG <= '0';
	WAIT FOR 3*153600000 ps + 300000 ps;
	guardar_NG <= '1';
	WAIT FOR 480000000 ps - 3*153600000 ps - 300000 ps;
	guardar_NG <= '0';
WAIT;
END PROCESS t_prcs_guardar_NG;

-- Hw_memoria
t_prcs_Hw_memoria: PROCESS
BEGIN
	Hw_memoria <= '0';
	WAIT FOR 2*153600000 ps;
	Hw_memoria <= '1';
	WAIT FOR 153600000 ps;
	Hw_memoria <= '0';
WAIT;
END PROCESS t_prcs_Hw_memoria;

-- Hr_memoria
t_prcs_Hr_memoria: PROCESS
BEGIN
	Hr_memoria <= '0';
	WAIT FOR 3*153600000 ps + 900000 ps;
	Hr_memoria <= '1';
	WAIT FOR 480000000 ps - 3*153600000 ps - 900000 ps;
	Hr_memoria <= '0';
WAIT;
END PROCESS t_prcs_Hr_memoria;

-- Hab_reg_med
t_prcs_Hab_reg_med: PROCESS
BEGIN
	Hab_reg_med <= '0';
	WAIT FOR 3*153600000 ps + 1500000 ps; 
	Hab_reg_med <= '1';
	WAIT FOR 600000 ps;
	Hab_reg_med <= '0';
WAIT;
END PROCESS t_prcs_Hab_reg_med;

-- H_med
t_prcs_H_med: PROCESS
BEGIN
	H_med <= '0';
	WAIT FOR 3*153600000 ps + 900000 ps;
	H_med <= '1';
	WAIT FOR 600000 ps;
	H_med <= '0';
WAIT;
END PROCESS t_prcs_H_med;

-- H_funcion
t_prcs_H_funcion: PROCESS
BEGIN
	H_funcion <= '0';
	WAIT FOR 3*153600000 ps + 2100000 ps;
	H_funcion <= '1';
	WAIT FOR 480000000 ps - 3*153600000 ps - 2100000 ps;
	H_funcion <= '0';
WAIT;
END PROCESS t_prcs_H_funcion;
END estimador_arch;
