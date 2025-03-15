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

-- DATE "03/12/2025 12:43:15"

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

ENTITY 	up_down IS
    PORT (
	inc : IN std_logic;
	dec : IN std_logic;
	rst : IN std_logic;
	clk : IN std_logic;
	q : OUT std_logic_vector(4 DOWNTO 1)
	);
END up_down;

-- Design Ports Information


ARCHITECTURE structure OF up_down IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_inc : std_logic;
SIGNAL ww_dec : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_q : std_logic_vector(4 DOWNTO 1);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \dec~combout\ : std_logic;
SIGNAL \inc~combout\ : std_logic;
SIGNAL \op_4~0_combout\ : std_logic;
SIGNAL \_~3_combout\ : std_logic;
SIGNAL \cnt[2]~26_combout\ : std_logic;
SIGNAL \_~0_combout\ : std_logic;
SIGNAL \_~2_combout\ : std_logic;
SIGNAL \_~1_combout\ : std_logic;
SIGNAL \cnt[4]~20_combout\ : std_logic;
SIGNAL \cnt[4]~18_combout\ : std_logic;
SIGNAL \cnt[4]~32_combout\ : std_logic;
SIGNAL \cnt[4]~33_combout\ : std_logic;
SIGNAL \_~4_combout\ : std_logic;
SIGNAL \op_2~0_combout\ : std_logic;
SIGNAL \op_4~1_combout\ : std_logic;
SIGNAL \cnt[3]~28_combout\ : std_logic;
SIGNAL \cnt[1]~3_combout\ : std_logic;
SIGNAL cnt : std_logic_vector(4 DOWNTO 1);

BEGIN

ww_inc <= inc;
ww_dec <= dec;
ww_rst <= rst;
ww_clk <= clk;
q <= ww_q;
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

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dec~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_dec,
	combout => \dec~combout\);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inc~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_inc,
	combout => \inc~combout\);

-- Location: LC_X3_Y1_N3
\op_4~0\ : maxii_lcell
-- Equation(s):
-- \op_4~0_combout\ = ((cnt(1) $ (cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => cnt(1),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \op_4~0_combout\);

-- Location: LC_X3_Y1_N7
\_~3\ : maxii_lcell
-- Equation(s):
-- \_~3_combout\ = (!cnt(1) & (!cnt(4) & (!cnt(3) & !cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(1),
	datab => cnt(4),
	datac => cnt(3),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \_~3_combout\);

-- Location: LC_X3_Y1_N9
\cnt[2]~26\ : maxii_lcell
-- Equation(s):
-- \cnt[2]~26_combout\ = (\dec~combout\ & (!\_~3_combout\ & (cnt(2) $ (!cnt(1))))) # (!\dec~combout\ & (cnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4c46",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dec~combout\,
	datab => cnt(2),
	datac => \_~3_combout\,
	datad => cnt(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[2]~26_combout\);

-- Location: LC_X4_Y1_N6
\_~0\ : maxii_lcell
-- Equation(s):
-- \_~0_combout\ = (\inc~combout\ & (!cnt(3) & (!cnt(2) & cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0200",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inc~combout\,
	datab => cnt(3),
	datac => cnt(2),
	datad => cnt(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \_~0_combout\);

-- Location: LC_X4_Y1_N7
\_~2\ : maxii_lcell
-- Equation(s):
-- \_~2_combout\ = (\rst~combout\) # ((cnt(1) & ((\_~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eecc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(1),
	datab => \rst~combout\,
	datad => \_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \_~2_combout\);

-- Location: LC_X4_Y1_N8
\_~1\ : maxii_lcell
-- Equation(s):
-- \_~1_combout\ = ((!\_~2_combout\ & ((!\_~3_combout\) # (!\dec~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "030f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \dec~combout\,
	datac => \_~2_combout\,
	datad => \_~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \_~1_combout\);

-- Location: LC_X4_Y1_N5
\cnt[2]\ : maxii_lcell
-- Equation(s):
-- cnt(2) = DFFEAS((\_~1_combout\ & ((\_~4_combout\ & (\op_4~0_combout\)) # (!\_~4_combout\ & ((\cnt[2]~26_combout\))))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \_~4_combout\,
	datab => \op_4~0_combout\,
	datac => \cnt[2]~26_combout\,
	datad => \_~1_combout\,
	aclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(2));

-- Location: LC_X4_Y1_N3
\cnt[4]~20\ : maxii_lcell
-- Equation(s):
-- \cnt[4]~20_combout\ = cnt(4) $ (((!cnt(2) & (!cnt(3) & !cnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fe01",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(2),
	datab => cnt(3),
	datac => cnt(1),
	datad => cnt(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[4]~20_combout\);

-- Location: LC_X4_Y1_N4
\cnt[4]~18\ : maxii_lcell
-- Equation(s):
-- \cnt[4]~18_combout\ = ((\dec~combout\ & ((\cnt[4]~20_combout\))) # (!\dec~combout\ & (cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => cnt(4),
	datac => \dec~combout\,
	datad => \cnt[4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[4]~18_combout\);

-- Location: LC_X4_Y1_N0
\cnt[4]~32\ : maxii_lcell
-- Equation(s):
-- \cnt[4]~32_combout\ = (cnt(1) & (((cnt(3))))) # (!cnt(1) & ((cnt(4)) # ((\dec~combout\ & !cnt(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfc2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dec~combout\,
	datab => cnt(3),
	datac => cnt(1),
	datad => cnt(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[4]~32_combout\);

-- Location: LC_X4_Y1_N1
\cnt[4]~33\ : maxii_lcell
-- Equation(s):
-- \cnt[4]~33_combout\ = (cnt(4) & ((\cnt[4]~32_combout\) # ((!cnt(3) & cnt(2))))) # (!cnt(4) & (\cnt[4]~32_combout\ & (cnt(3) $ (!cnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eb20",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datab => cnt(3),
	datac => cnt(2),
	datad => \cnt[4]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[4]~33_combout\);

-- Location: LC_X4_Y1_N2
\cnt[4]\ : maxii_lcell
-- Equation(s):
-- cnt(4) = DFFEAS((!\rst~combout\ & ((\inc~combout\ & ((\cnt[4]~33_combout\))) # (!\inc~combout\ & (\cnt[4]~18_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3210",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \inc~combout\,
	datab => \rst~combout\,
	datac => \cnt[4]~18_combout\,
	datad => \cnt[4]~33_combout\,
	aclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(4));

-- Location: LC_X3_Y1_N0
\_~4\ : maxii_lcell
-- Equation(s):
-- \_~4_combout\ = (\inc~combout\ & (((!cnt(3) & !cnt(2))) # (!cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a2a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inc~combout\,
	datab => cnt(3),
	datac => cnt(4),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \_~4_combout\);

-- Location: LC_X3_Y1_N2
\op_2~0\ : maxii_lcell
-- Equation(s):
-- \op_2~0_combout\ = (cnt(3) $ (((cnt(1) & cnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5af0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(1),
	datac => cnt(3),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \op_2~0_combout\);

-- Location: LC_X3_Y1_N8
\op_4~1\ : maxii_lcell
-- Equation(s):
-- \op_4~1_combout\ = (((cnt(1)) # (cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => cnt(1),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \op_4~1_combout\);

-- Location: LC_X3_Y1_N6
\cnt[3]~28\ : maxii_lcell
-- Equation(s):
-- \cnt[3]~28_combout\ = (\dec~combout\ & (!\_~3_combout\ & (cnt(3) $ (!\op_4~1_combout\)))) # (!\dec~combout\ & (cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4c46",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dec~combout\,
	datab => cnt(3),
	datac => \_~3_combout\,
	datad => \op_4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[3]~28_combout\);

-- Location: LC_X4_Y1_N9
\cnt[3]\ : maxii_lcell
-- Equation(s):
-- cnt(3) = DFFEAS((\_~1_combout\ & ((\_~4_combout\ & (\op_2~0_combout\)) # (!\_~4_combout\ & ((\cnt[3]~28_combout\))))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \_~4_combout\,
	datab => \op_2~0_combout\,
	datac => \cnt[3]~28_combout\,
	datad => \_~1_combout\,
	aclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(3));

-- Location: LC_X3_Y1_N4
\cnt[1]~3\ : maxii_lcell
-- Equation(s):
-- \cnt[1]~3_combout\ = (\inc~combout\ & (((!cnt(3) & !cnt(2))) # (!cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "02aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inc~combout\,
	datab => cnt(3),
	datac => cnt(2),
	datad => cnt(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt[1]~3_combout\);

-- Location: LC_X3_Y1_N5
\cnt[1]\ : maxii_lcell
-- Equation(s):
-- cnt(1) = DFFEAS((!\rst~combout\ & (cnt(1) $ (((\dec~combout\) # (\cnt[1]~3_combout\))))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1114",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \rst~combout\,
	datab => cnt(1),
	datac => \dec~combout\,
	datad => \cnt[1]~3_combout\,
	aclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(1));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(1),
	oe => VCC,
	padio => ww_q(1));

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(2),
	oe => VCC,
	padio => ww_q(2));

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(3),
	oe => VCC,
	padio => ww_q(3));

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(4),
	oe => VCC,
	padio => ww_q(4));
END structure;


