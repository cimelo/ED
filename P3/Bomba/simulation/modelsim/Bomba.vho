-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/16/2025 18:22:56"

-- 
-- Device: Altera EPM240T100I5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	main IS
    PORT (
	dig : OUT std_logic_vector(1 DOWNTO 1);
	led : OUT std_logic_vector(5 DOWNTO 1);
	clk : IN std_logic;
	seg : OUT std_logic_vector(8 DOWNTO 1)
	);
END main;

-- Design Ports Information


ARCHITECTURE structure OF main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dig : std_logic_vector(1 DOWNTO 1);
SIGNAL ww_led : std_logic_vector(5 DOWNTO 1);
SIGNAL ww_clk : std_logic;
SIGNAL ww_seg : std_logic_vector(8 DOWNTO 1);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella0~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella0~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella1~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella1~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella2~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella3~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella3~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella4~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella4~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella5~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella5~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella6~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella6~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella7~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella8~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella8~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella9~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella9~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella10~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella10~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella11~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella11~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella12~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella13~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella13~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella14~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella14~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella15~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella15~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella16~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella16~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella17~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella18~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella18~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella19~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella19~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella20~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella20~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella21~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella21~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella22~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella23~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella23~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella24~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella24~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella25~COUT\ : std_logic;
SIGNAL \inst3|auto_generated|counter_cella25~COUTCOUT1_1\ : std_logic;
SIGNAL \inst3|auto_generated|cout\ : std_logic;
SIGNAL \inst5~regout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|aux~regout\ : std_logic;
SIGNAL \inst3|auto_generated|safe_q\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst7|q\ : std_logic_vector(8 DOWNTO 1);
SIGNAL \inst|cnt\ : std_logic_vector(3 DOWNTO 0);

BEGIN

dig <= ww_dig;
led <= ww_led;
ww_clk <= clk;
seg <= ww_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: LC_X3_Y3_N2
\inst3|auto_generated|counter_cella0\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(0) = DFFEAS(((!\inst3|auto_generated|safe_q\(0))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella0~COUT\ = CARRY(((\inst3|auto_generated|safe_q\(0))))
-- \inst3|auto_generated|counter_cella0~COUTCOUT1_1\ = CARRY(((\inst3|auto_generated|safe_q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(0),
	cout0 => \inst3|auto_generated|counter_cella0~COUT\,
	cout1 => \inst3|auto_generated|counter_cella0~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N3
\inst3|auto_generated|counter_cella1\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(1) = DFFEAS(\inst3|auto_generated|safe_q\(1) $ ((((\inst3|auto_generated|counter_cella0~COUT\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella1~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella0~COUT\)) # (!\inst3|auto_generated|safe_q\(1)))
-- \inst3|auto_generated|counter_cella1~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella0~COUTCOUT1_1\)) # (!\inst3|auto_generated|safe_q\(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(1),
	aclr => GND,
	cin0 => \inst3|auto_generated|counter_cella0~COUT\,
	cin1 => \inst3|auto_generated|counter_cella0~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(1),
	cout0 => \inst3|auto_generated|counter_cella1~COUT\,
	cout1 => \inst3|auto_generated|counter_cella1~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N4
\inst3|auto_generated|counter_cella2\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(2) = DFFEAS(\inst3|auto_generated|safe_q\(2) $ ((((!\inst3|auto_generated|counter_cella1~COUT\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella2~COUT\ = CARRY((\inst3|auto_generated|safe_q\(2) & ((!\inst3|auto_generated|counter_cella1~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(2),
	aclr => GND,
	cin0 => \inst3|auto_generated|counter_cella1~COUT\,
	cin1 => \inst3|auto_generated|counter_cella1~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(2),
	cout => \inst3|auto_generated|counter_cella2~COUT\);

-- Location: LC_X3_Y3_N5
\inst3|auto_generated|counter_cella3\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(3) = DFFEAS(\inst3|auto_generated|safe_q\(3) $ ((((\inst3|auto_generated|counter_cella2~COUT\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella3~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella2~COUT\)) # (!\inst3|auto_generated|safe_q\(3)))
-- \inst3|auto_generated|counter_cella3~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella2~COUT\)) # (!\inst3|auto_generated|safe_q\(3)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(3),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella2~COUT\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(3),
	cout0 => \inst3|auto_generated|counter_cella3~COUT\,
	cout1 => \inst3|auto_generated|counter_cella3~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N6
\inst3|auto_generated|counter_cella4\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(4) = DFFEAS(\inst3|auto_generated|safe_q\(4) $ ((((!(!\inst3|auto_generated|counter_cella2~COUT\ & \inst3|auto_generated|counter_cella3~COUT\) # (\inst3|auto_generated|counter_cella2~COUT\ & 
-- \inst3|auto_generated|counter_cella3~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella4~COUT\ = CARRY((\inst3|auto_generated|safe_q\(4) & ((!\inst3|auto_generated|counter_cella3~COUT\))))
-- \inst3|auto_generated|counter_cella4~COUTCOUT1_1\ = CARRY((\inst3|auto_generated|safe_q\(4) & ((!\inst3|auto_generated|counter_cella3~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(4),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella2~COUT\,
	cin0 => \inst3|auto_generated|counter_cella3~COUT\,
	cin1 => \inst3|auto_generated|counter_cella3~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(4),
	cout0 => \inst3|auto_generated|counter_cella4~COUT\,
	cout1 => \inst3|auto_generated|counter_cella4~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N7
\inst3|auto_generated|counter_cella5\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(5) = DFFEAS((\inst3|auto_generated|safe_q\(5) $ (((!\inst3|auto_generated|counter_cella2~COUT\ & \inst3|auto_generated|counter_cella4~COUT\) # (\inst3|auto_generated|counter_cella2~COUT\ & 
-- \inst3|auto_generated|counter_cella4~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella5~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella4~COUT\) # (!\inst3|auto_generated|safe_q\(5))))
-- \inst3|auto_generated|counter_cella5~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella4~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(5),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella2~COUT\,
	cin0 => \inst3|auto_generated|counter_cella4~COUT\,
	cin1 => \inst3|auto_generated|counter_cella4~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(5),
	cout0 => \inst3|auto_generated|counter_cella5~COUT\,
	cout1 => \inst3|auto_generated|counter_cella5~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N8
\inst3|auto_generated|counter_cella6\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(6) = DFFEAS(\inst3|auto_generated|safe_q\(6) $ ((((!(!\inst3|auto_generated|counter_cella2~COUT\ & \inst3|auto_generated|counter_cella5~COUT\) # (\inst3|auto_generated|counter_cella2~COUT\ & 
-- \inst3|auto_generated|counter_cella5~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella6~COUT\ = CARRY((\inst3|auto_generated|safe_q\(6) & ((!\inst3|auto_generated|counter_cella5~COUT\))))
-- \inst3|auto_generated|counter_cella6~COUTCOUT1_1\ = CARRY((\inst3|auto_generated|safe_q\(6) & ((!\inst3|auto_generated|counter_cella5~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(6),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella2~COUT\,
	cin0 => \inst3|auto_generated|counter_cella5~COUT\,
	cin1 => \inst3|auto_generated|counter_cella5~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(6),
	cout0 => \inst3|auto_generated|counter_cella6~COUT\,
	cout1 => \inst3|auto_generated|counter_cella6~COUTCOUT1_1\);

-- Location: LC_X3_Y3_N9
\inst3|auto_generated|counter_cella7\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(7) = DFFEAS((\inst3|auto_generated|safe_q\(7) $ (((!\inst3|auto_generated|counter_cella2~COUT\ & \inst3|auto_generated|counter_cella6~COUT\) # (\inst3|auto_generated|counter_cella2~COUT\ & 
-- \inst3|auto_generated|counter_cella6~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella7~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella6~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(7),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella2~COUT\,
	cin0 => \inst3|auto_generated|counter_cella6~COUT\,
	cin1 => \inst3|auto_generated|counter_cella6~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(7),
	cout => \inst3|auto_generated|counter_cella7~COUT\);

-- Location: LC_X4_Y3_N0
\inst3|auto_generated|counter_cella8\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(8) = DFFEAS((\inst3|auto_generated|safe_q\(8) $ ((!\inst3|auto_generated|counter_cella7~COUT\))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella8~COUT\ = CARRY(((\inst3|auto_generated|safe_q\(8) & !\inst3|auto_generated|counter_cella7~COUT\)))
-- \inst3|auto_generated|counter_cella8~COUTCOUT1_1\ = CARRY(((\inst3|auto_generated|safe_q\(8) & !\inst3|auto_generated|counter_cella7~COUT\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(8),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella7~COUT\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(8),
	cout0 => \inst3|auto_generated|counter_cella8~COUT\,
	cout1 => \inst3|auto_generated|counter_cella8~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N1
\inst3|auto_generated|counter_cella9\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(9) = DFFEAS((\inst3|auto_generated|safe_q\(9) $ (((!\inst3|auto_generated|counter_cella7~COUT\ & \inst3|auto_generated|counter_cella8~COUT\) # (\inst3|auto_generated|counter_cella7~COUT\ & 
-- \inst3|auto_generated|counter_cella8~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella9~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella8~COUT\) # (!\inst3|auto_generated|safe_q\(9))))
-- \inst3|auto_generated|counter_cella9~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella8~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(9))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(9),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella7~COUT\,
	cin0 => \inst3|auto_generated|counter_cella8~COUT\,
	cin1 => \inst3|auto_generated|counter_cella8~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(9),
	cout0 => \inst3|auto_generated|counter_cella9~COUT\,
	cout1 => \inst3|auto_generated|counter_cella9~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N2
\inst3|auto_generated|counter_cella10\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(10) = DFFEAS((\inst3|auto_generated|safe_q\(10) $ ((!(!\inst3|auto_generated|counter_cella7~COUT\ & \inst3|auto_generated|counter_cella9~COUT\) # (\inst3|auto_generated|counter_cella7~COUT\ & 
-- \inst3|auto_generated|counter_cella9~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella10~COUT\ = CARRY(((\inst3|auto_generated|safe_q\(10) & !\inst3|auto_generated|counter_cella9~COUT\)))
-- \inst3|auto_generated|counter_cella10~COUTCOUT1_1\ = CARRY(((\inst3|auto_generated|safe_q\(10) & !\inst3|auto_generated|counter_cella9~COUTCOUT1_1\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(10),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella7~COUT\,
	cin0 => \inst3|auto_generated|counter_cella9~COUT\,
	cin1 => \inst3|auto_generated|counter_cella9~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(10),
	cout0 => \inst3|auto_generated|counter_cella10~COUT\,
	cout1 => \inst3|auto_generated|counter_cella10~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N3
\inst3|auto_generated|counter_cella11\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(11) = DFFEAS(\inst3|auto_generated|safe_q\(11) $ (((((!\inst3|auto_generated|counter_cella7~COUT\ & \inst3|auto_generated|counter_cella10~COUT\) # (\inst3|auto_generated|counter_cella7~COUT\ & 
-- \inst3|auto_generated|counter_cella10~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella11~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella10~COUT\)) # (!\inst3|auto_generated|safe_q\(11)))
-- \inst3|auto_generated|counter_cella11~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella10~COUTCOUT1_1\)) # (!\inst3|auto_generated|safe_q\(11)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(11),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella7~COUT\,
	cin0 => \inst3|auto_generated|counter_cella10~COUT\,
	cin1 => \inst3|auto_generated|counter_cella10~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(11),
	cout0 => \inst3|auto_generated|counter_cella11~COUT\,
	cout1 => \inst3|auto_generated|counter_cella11~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N4
\inst3|auto_generated|counter_cella12\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(12) = DFFEAS(\inst3|auto_generated|safe_q\(12) $ ((((!(!\inst3|auto_generated|counter_cella7~COUT\ & \inst3|auto_generated|counter_cella11~COUT\) # (\inst3|auto_generated|counter_cella7~COUT\ & 
-- \inst3|auto_generated|counter_cella11~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella12~COUT\ = CARRY((\inst3|auto_generated|safe_q\(12) & ((!\inst3|auto_generated|counter_cella11~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(12),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella7~COUT\,
	cin0 => \inst3|auto_generated|counter_cella11~COUT\,
	cin1 => \inst3|auto_generated|counter_cella11~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(12),
	cout => \inst3|auto_generated|counter_cella12~COUT\);

-- Location: LC_X4_Y3_N5
\inst3|auto_generated|counter_cella13\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(13) = DFFEAS(\inst3|auto_generated|safe_q\(13) $ ((((\inst3|auto_generated|counter_cella12~COUT\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella13~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella12~COUT\)) # (!\inst3|auto_generated|safe_q\(13)))
-- \inst3|auto_generated|counter_cella13~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella12~COUT\)) # (!\inst3|auto_generated|safe_q\(13)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(13),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella12~COUT\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(13),
	cout0 => \inst3|auto_generated|counter_cella13~COUT\,
	cout1 => \inst3|auto_generated|counter_cella13~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N6
\inst3|auto_generated|counter_cella14\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(14) = DFFEAS(\inst3|auto_generated|safe_q\(14) $ ((((!(!\inst3|auto_generated|counter_cella12~COUT\ & \inst3|auto_generated|counter_cella13~COUT\) # (\inst3|auto_generated|counter_cella12~COUT\ & 
-- \inst3|auto_generated|counter_cella13~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella14~COUT\ = CARRY((\inst3|auto_generated|safe_q\(14) & ((!\inst3|auto_generated|counter_cella13~COUT\))))
-- \inst3|auto_generated|counter_cella14~COUTCOUT1_1\ = CARRY((\inst3|auto_generated|safe_q\(14) & ((!\inst3|auto_generated|counter_cella13~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(14),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella12~COUT\,
	cin0 => \inst3|auto_generated|counter_cella13~COUT\,
	cin1 => \inst3|auto_generated|counter_cella13~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(14),
	cout0 => \inst3|auto_generated|counter_cella14~COUT\,
	cout1 => \inst3|auto_generated|counter_cella14~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N7
\inst3|auto_generated|counter_cella15\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(15) = DFFEAS((\inst3|auto_generated|safe_q\(15) $ (((!\inst3|auto_generated|counter_cella12~COUT\ & \inst3|auto_generated|counter_cella14~COUT\) # (\inst3|auto_generated|counter_cella12~COUT\ & 
-- \inst3|auto_generated|counter_cella14~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella15~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella14~COUT\) # (!\inst3|auto_generated|safe_q\(15))))
-- \inst3|auto_generated|counter_cella15~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella14~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(15))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(15),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella12~COUT\,
	cin0 => \inst3|auto_generated|counter_cella14~COUT\,
	cin1 => \inst3|auto_generated|counter_cella14~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(15),
	cout0 => \inst3|auto_generated|counter_cella15~COUT\,
	cout1 => \inst3|auto_generated|counter_cella15~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N8
\inst3|auto_generated|counter_cella16\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(16) = DFFEAS(\inst3|auto_generated|safe_q\(16) $ ((((!(!\inst3|auto_generated|counter_cella12~COUT\ & \inst3|auto_generated|counter_cella15~COUT\) # (\inst3|auto_generated|counter_cella12~COUT\ & 
-- \inst3|auto_generated|counter_cella15~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella16~COUT\ = CARRY((\inst3|auto_generated|safe_q\(16) & ((!\inst3|auto_generated|counter_cella15~COUT\))))
-- \inst3|auto_generated|counter_cella16~COUTCOUT1_1\ = CARRY((\inst3|auto_generated|safe_q\(16) & ((!\inst3|auto_generated|counter_cella15~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(16),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella12~COUT\,
	cin0 => \inst3|auto_generated|counter_cella15~COUT\,
	cin1 => \inst3|auto_generated|counter_cella15~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(16),
	cout0 => \inst3|auto_generated|counter_cella16~COUT\,
	cout1 => \inst3|auto_generated|counter_cella16~COUTCOUT1_1\);

-- Location: LC_X4_Y3_N9
\inst3|auto_generated|counter_cella17\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(17) = DFFEAS((\inst3|auto_generated|safe_q\(17) $ (((!\inst3|auto_generated|counter_cella12~COUT\ & \inst3|auto_generated|counter_cella16~COUT\) # (\inst3|auto_generated|counter_cella12~COUT\ & 
-- \inst3|auto_generated|counter_cella16~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella17~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella16~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(17))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(17),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella12~COUT\,
	cin0 => \inst3|auto_generated|counter_cella16~COUT\,
	cin1 => \inst3|auto_generated|counter_cella16~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(17),
	cout => \inst3|auto_generated|counter_cella17~COUT\);

-- Location: LC_X5_Y3_N0
\inst3|auto_generated|counter_cella18\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(18) = DFFEAS((\inst3|auto_generated|safe_q\(18) $ ((!\inst3|auto_generated|counter_cella17~COUT\))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella18~COUT\ = CARRY(((\inst3|auto_generated|safe_q\(18) & !\inst3|auto_generated|counter_cella17~COUT\)))
-- \inst3|auto_generated|counter_cella18~COUTCOUT1_1\ = CARRY(((\inst3|auto_generated|safe_q\(18) & !\inst3|auto_generated|counter_cella17~COUT\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(18),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella17~COUT\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(18),
	cout0 => \inst3|auto_generated|counter_cella18~COUT\,
	cout1 => \inst3|auto_generated|counter_cella18~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N1
\inst3|auto_generated|counter_cella19\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(19) = DFFEAS((\inst3|auto_generated|safe_q\(19) $ (((!\inst3|auto_generated|counter_cella17~COUT\ & \inst3|auto_generated|counter_cella18~COUT\) # (\inst3|auto_generated|counter_cella17~COUT\ & 
-- \inst3|auto_generated|counter_cella18~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella19~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella18~COUT\) # (!\inst3|auto_generated|safe_q\(19))))
-- \inst3|auto_generated|counter_cella19~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella18~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(19))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(19),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella17~COUT\,
	cin0 => \inst3|auto_generated|counter_cella18~COUT\,
	cin1 => \inst3|auto_generated|counter_cella18~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(19),
	cout0 => \inst3|auto_generated|counter_cella19~COUT\,
	cout1 => \inst3|auto_generated|counter_cella19~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N2
\inst3|auto_generated|counter_cella20\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(20) = DFFEAS((\inst3|auto_generated|safe_q\(20) $ ((!(!\inst3|auto_generated|counter_cella17~COUT\ & \inst3|auto_generated|counter_cella19~COUT\) # (\inst3|auto_generated|counter_cella17~COUT\ & 
-- \inst3|auto_generated|counter_cella19~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella20~COUT\ = CARRY(((\inst3|auto_generated|safe_q\(20) & !\inst3|auto_generated|counter_cella19~COUT\)))
-- \inst3|auto_generated|counter_cella20~COUTCOUT1_1\ = CARRY(((\inst3|auto_generated|safe_q\(20) & !\inst3|auto_generated|counter_cella19~COUTCOUT1_1\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(20),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella17~COUT\,
	cin0 => \inst3|auto_generated|counter_cella19~COUT\,
	cin1 => \inst3|auto_generated|counter_cella19~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(20),
	cout0 => \inst3|auto_generated|counter_cella20~COUT\,
	cout1 => \inst3|auto_generated|counter_cella20~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N3
\inst3|auto_generated|counter_cella21\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(21) = DFFEAS(\inst3|auto_generated|safe_q\(21) $ (((((!\inst3|auto_generated|counter_cella17~COUT\ & \inst3|auto_generated|counter_cella20~COUT\) # (\inst3|auto_generated|counter_cella17~COUT\ & 
-- \inst3|auto_generated|counter_cella20~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella21~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella20~COUT\)) # (!\inst3|auto_generated|safe_q\(21)))
-- \inst3|auto_generated|counter_cella21~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella20~COUTCOUT1_1\)) # (!\inst3|auto_generated|safe_q\(21)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(21),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella17~COUT\,
	cin0 => \inst3|auto_generated|counter_cella20~COUT\,
	cin1 => \inst3|auto_generated|counter_cella20~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(21),
	cout0 => \inst3|auto_generated|counter_cella21~COUT\,
	cout1 => \inst3|auto_generated|counter_cella21~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N4
\inst3|auto_generated|counter_cella22\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(22) = DFFEAS(\inst3|auto_generated|safe_q\(22) $ ((((!(!\inst3|auto_generated|counter_cella17~COUT\ & \inst3|auto_generated|counter_cella21~COUT\) # (\inst3|auto_generated|counter_cella17~COUT\ & 
-- \inst3|auto_generated|counter_cella21~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella22~COUT\ = CARRY((\inst3|auto_generated|safe_q\(22) & ((!\inst3|auto_generated|counter_cella21~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(22),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella17~COUT\,
	cin0 => \inst3|auto_generated|counter_cella21~COUT\,
	cin1 => \inst3|auto_generated|counter_cella21~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(22),
	cout => \inst3|auto_generated|counter_cella22~COUT\);

-- Location: LC_X5_Y3_N5
\inst3|auto_generated|counter_cella23\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(23) = DFFEAS(\inst3|auto_generated|safe_q\(23) $ ((((\inst3|auto_generated|counter_cella22~COUT\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella23~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella22~COUT\)) # (!\inst3|auto_generated|safe_q\(23)))
-- \inst3|auto_generated|counter_cella23~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella22~COUT\)) # (!\inst3|auto_generated|safe_q\(23)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(23),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella22~COUT\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(23),
	cout0 => \inst3|auto_generated|counter_cella23~COUT\,
	cout1 => \inst3|auto_generated|counter_cella23~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N6
\inst3|auto_generated|counter_cella24\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(24) = DFFEAS(\inst3|auto_generated|safe_q\(24) $ ((((!(!\inst3|auto_generated|counter_cella22~COUT\ & \inst3|auto_generated|counter_cella23~COUT\) # (\inst3|auto_generated|counter_cella22~COUT\ & 
-- \inst3|auto_generated|counter_cella23~COUTCOUT1_1\))))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella24~COUT\ = CARRY((\inst3|auto_generated|safe_q\(24) & ((!\inst3|auto_generated|counter_cella23~COUT\))))
-- \inst3|auto_generated|counter_cella24~COUTCOUT1_1\ = CARRY((\inst3|auto_generated|safe_q\(24) & ((!\inst3|auto_generated|counter_cella23~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inst3|auto_generated|safe_q\(24),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella22~COUT\,
	cin0 => \inst3|auto_generated|counter_cella23~COUT\,
	cin1 => \inst3|auto_generated|counter_cella23~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(24),
	cout0 => \inst3|auto_generated|counter_cella24~COUT\,
	cout1 => \inst3|auto_generated|counter_cella24~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N7
\inst3|auto_generated|counter_cella25\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|safe_q\(25) = DFFEAS((\inst3|auto_generated|safe_q\(25) $ (((!\inst3|auto_generated|counter_cella22~COUT\ & \inst3|auto_generated|counter_cella24~COUT\) # (\inst3|auto_generated|counter_cella22~COUT\ & 
-- \inst3|auto_generated|counter_cella24~COUTCOUT1_1\)))), GLOBAL(\clk~combout\), VCC, , , , , , )
-- \inst3|auto_generated|counter_cella25~COUT\ = CARRY(((!\inst3|auto_generated|counter_cella24~COUT\) # (!\inst3|auto_generated|safe_q\(25))))
-- \inst3|auto_generated|counter_cella25~COUTCOUT1_1\ = CARRY(((!\inst3|auto_generated|counter_cella24~COUTCOUT1_1\) # (!\inst3|auto_generated|safe_q\(25))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \inst3|auto_generated|safe_q\(25),
	aclr => GND,
	cin => \inst3|auto_generated|counter_cella22~COUT\,
	cin0 => \inst3|auto_generated|counter_cella24~COUT\,
	cin1 => \inst3|auto_generated|counter_cella24~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|auto_generated|safe_q\(25),
	cout0 => \inst3|auto_generated|counter_cella25~COUT\,
	cout1 => \inst3|auto_generated|counter_cella25~COUTCOUT1_1\);

-- Location: LC_X5_Y3_N8
\inst3|auto_generated|cout_bit\ : maxii_lcell
-- Equation(s):
-- \inst3|auto_generated|cout\ = (((!(!\inst3|auto_generated|counter_cella22~COUT\ & \inst3|auto_generated|counter_cella25~COUT\) # (\inst3|auto_generated|counter_cella22~COUT\ & \inst3|auto_generated|counter_cella25~COUTCOUT1_1\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst3|auto_generated|counter_cella22~COUT\,
	cin0 => \inst3|auto_generated|counter_cella25~COUT\,
	cin1 => \inst3|auto_generated|counter_cella25~COUTCOUT1_1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \inst3|auto_generated|cout\);

-- Location: LC_X2_Y3_N2
inst5 : maxii_lcell
-- Equation(s):
-- \inst5~regout\ = DFFEAS((((!\inst5~regout\))), \inst3|auto_generated|cout\, VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst3|auto_generated|cout\,
	datad => \inst5~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst5~regout\);

-- Location: LC_X7_Y3_N0
\inst|cnt[1]\ : maxii_lcell
-- Equation(s):
-- \inst|cnt\(1) = DFFEAS((\inst|cnt\(1) $ (((!\inst|cnt\(3) & \inst|cnt\(0))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	datab => \inst|cnt\(3),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|cnt\(1));

-- Location: LC_X7_Y3_N7
\inst|cnt[3]\ : maxii_lcell
-- Equation(s):
-- \inst|cnt\(3) = DFFEAS((\inst|cnt\(2) & ((\inst|cnt\(3)) # ((\inst|cnt\(1) & \inst|cnt\(0))))) # (!\inst|cnt\(2) & (\inst|cnt\(3) & ((\inst|cnt\(1)) # (!\inst|cnt\(0))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e8cc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(3),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|cnt\(3));

-- Location: LC_X7_Y3_N8
\inst|cnt[2]\ : maxii_lcell
-- Equation(s):
-- \inst|cnt\(2) = DFFEAS(\inst|cnt\(2) $ (((!\inst|cnt\(3) & (\inst|cnt\(1) & \inst|cnt\(0))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9aaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(3),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|cnt\(2));

-- Location: LC_X7_Y3_N1
\inst|cnt[0]\ : maxii_lcell
-- Equation(s):
-- \inst|cnt\(0) = DFFEAS(\inst|cnt\(0) $ ((((!\inst|cnt\(2) & !\inst|cnt\(1))) # (!\inst|cnt\(3)))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c393",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|cnt\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|cnt\(0));

-- Location: LC_X7_Y3_N4
\inst|Equal0~0\ : maxii_lcell
-- Equation(s):
-- \inst|Equal0~0_combout\ = (((!\inst|cnt\(1) & !\inst|cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \inst|Equal0~0_combout\);

-- Location: LC_X7_Y3_N5
\inst|aux\ : maxii_lcell
-- Equation(s):
-- \inst|aux~regout\ = DFFEAS((\inst|cnt\(3) & ((\inst|Equal0~0_combout\ & ((\inst|cnt\(0)))) # (!\inst|Equal0~0_combout\ & (\inst|aux~regout\)))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|aux~regout\,
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|Equal0~0_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|aux~regout\);

-- Location: LC_X7_Y3_N3
\inst7|q[7]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(7) = DFFEAS((!\inst|cnt\(3) & ((\inst|cnt\(2) & (\inst|cnt\(0) & \inst|cnt\(1))) # (!\inst|cnt\(2) & ((!\inst|cnt\(1)))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0805",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|cnt\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(7));

-- Location: LC_X7_Y3_N6
\inst7|q[6]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(6) = DFFEAS((!\inst|cnt\(3) & ((\inst|cnt\(2) & (\inst|cnt\(0) & \inst|cnt\(1))) # (!\inst|cnt\(2) & ((\inst|cnt\(0)) # (\inst|cnt\(1)))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0d04",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|cnt\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(6));

-- Location: LC_X6_Y3_N0
\inst7|q[5]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(5) = DFFEAS(((\inst|cnt\(0)) # ((\inst|cnt\(2) & !\inst|cnt\(1)))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	datab => \inst|cnt\(2),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(5));

-- Location: LC_X7_Y3_N2
\inst7|q[4]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(4) = DFFEAS((!\inst|cnt\(3) & ((\inst|cnt\(2) & (\inst|cnt\(0) $ (!\inst|cnt\(1)))) # (!\inst|cnt\(2) & (\inst|cnt\(0) & !\inst|cnt\(1))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0806",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|cnt\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(4));

-- Location: LC_X6_Y3_N5
\inst7|q[3]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(3) = DFFEAS(((!\inst|cnt\(2) & (\inst|cnt\(1) & !\inst|cnt\(0)))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	datab => \inst|cnt\(2),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(3));

-- Location: LC_X6_Y3_N4
\inst7|q[2]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(2) = DFFEAS(((\inst|cnt\(2) & (\inst|cnt\(1) $ (\inst|cnt\(0))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0cc0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	datab => \inst|cnt\(2),
	datac => \inst|cnt\(1),
	datad => \inst|cnt\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(2));

-- Location: LC_X7_Y3_N9
\inst7|q[1]\ : maxii_lcell
-- Equation(s):
-- \inst7|q\(1) = DFFEAS((!\inst|cnt\(3) & (!\inst|cnt\(1) & (\inst|cnt\(2) $ (\inst|cnt\(0))))), GLOBAL(\inst5~regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0006",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \inst5~regout\,
	dataa => \inst|cnt\(2),
	datab => \inst|cnt\(0),
	datac => \inst|cnt\(3),
	datad => \inst|cnt\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst7|q\(1));

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\dig[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_dig(1));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst|aux~regout\,
	oe => VCC,
	padio => ww_led(5));

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst|cnt\(3),
	oe => VCC,
	padio => ww_led(4));

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst|cnt\(2),
	oe => VCC,
	padio => ww_led(3));

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst|cnt\(1),
	oe => VCC,
	padio => ww_led(2));

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\led[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst|cnt\(0),
	oe => VCC,
	padio => ww_led(1));

-- Location: PIN_77,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[8]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_seg(8));

-- Location: PIN_82,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(7),
	oe => VCC,
	padio => ww_seg(7));

-- Location: PIN_78,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(6),
	oe => VCC,
	padio => ww_seg(6));

-- Location: PIN_74,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(5),
	oe => VCC,
	padio => ww_seg(5));

-- Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(4),
	oe => VCC,
	padio => ww_seg(4));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(3),
	oe => VCC,
	padio => ww_seg(3));

-- Location: PIN_83,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(2),
	oe => VCC,
	padio => ww_seg(2));

-- Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\seg[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \inst7|q\(1),
	oe => VCC,
	padio => ww_seg(1));
END structure;


