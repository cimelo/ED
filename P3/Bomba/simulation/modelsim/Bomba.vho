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

-- DATE "03/21/2025 08:59:49"

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

ENTITY 	cnt_mod10 IS
    PORT (
	clk : IN std_logic;
	en : IN std_logic;
	rst : IN std_logic;
	inc : IN std_logic;
	dec : IN std_logic;
	q : BUFFER std_logic_vector(3 DOWNTO 0);
	cout : BUFFER std_logic
	);
END cnt_mod10;

-- Design Ports Information


ARCHITECTURE structure OF cnt_mod10 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_inc : std_logic;
SIGNAL ww_dec : std_logic;
SIGNAL ww_q : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \inc~combout\ : std_logic;
SIGNAL \dec~combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \cnt~4_combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \en~combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \cnt~2_combout\ : std_logic;
SIGNAL \cnt~7_combout\ : std_logic;
SIGNAL \cnt~6_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \cnt~0_combout\ : std_logic;
SIGNAL \aux~regout\ : std_logic;
SIGNAL cnt : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_en <= en;
ww_rst <= rst;
ww_inc <= inc;
ww_dec <= dec;
q <= ww_q;
cout <= ww_cout;
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

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inc~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_inc,
	combout => \inc~combout\);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dec~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_dec,
	combout => \dec~combout\);

-- Location: LC_X4_Y2_N9
\process_0~0\ : maxii_lcell
-- Equation(s):
-- \process_0~0_combout\ = (\inc~combout\ & (((!cnt(1) & !cnt(2))) # (!cnt(3))))

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
	datab => cnt(1),
	datac => cnt(2),
	datad => cnt(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~0_combout\);

-- Location: LC_X4_Y2_N2
\process_0~5\ : maxii_lcell
-- Equation(s):
-- \process_0~5_combout\ = ((\dec~combout\ & ((cnt(3)) # (!\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \dec~combout\,
	datac => \process_0~1_combout\,
	datad => cnt(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~5_combout\);

-- Location: LC_X4_Y2_N3
\cnt~4\ : maxii_lcell
-- Equation(s):
-- \cnt~4_combout\ = (cnt(0) & (cnt(1) & (\process_0~0_combout\))) # (!cnt(0) & (!cnt(1) & (!\process_0~0_combout\ & \process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8180",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => cnt(1),
	datac => \process_0~0_combout\,
	datad => \process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt~4_combout\);

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

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\en~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_en,
	combout => \en~combout\);

-- Location: LC_X4_Y2_N4
\cnt[2]\ : maxii_lcell
-- Equation(s):
-- cnt(2) = DFFEAS((!\process_0~4_combout\ & (!\process_0~2_combout\ & (cnt(2) $ (\cnt~4_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , \en~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0102",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => cnt(2),
	datab => \process_0~4_combout\,
	datac => \process_0~2_combout\,
	datad => \cnt~4_combout\,
	aclr => \rst~combout\,
	ena => \en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(2));

-- Location: LC_X4_Y2_N5
\process_0~1\ : maxii_lcell
-- Equation(s):
-- \process_0~1_combout\ = ((!cnt(1) & (!cnt(2) & !cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0003",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => cnt(1),
	datac => cnt(2),
	datad => cnt(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~1_combout\);

-- Location: LC_X4_Y2_N6
\process_0~2\ : maxii_lcell
-- Equation(s):
-- \process_0~2_combout\ = (!cnt(3) & (\dec~combout\ & ((\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4400",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => \dec~combout\,
	datad => \process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~2_combout\);

-- Location: LC_X4_Y2_N0
\cnt~2\ : maxii_lcell
-- Equation(s):
-- \cnt~2_combout\ = ((\process_0~0_combout\ & (cnt(0))) # (!\process_0~0_combout\ & (!cnt(0) & \process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \process_0~0_combout\,
	datac => cnt(0),
	datad => \process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt~2_combout\);

-- Location: LC_X4_Y2_N1
\cnt[1]\ : maxii_lcell
-- Equation(s):
-- cnt(1) = DFFEAS((!\process_0~4_combout\ & (!\process_0~2_combout\ & (cnt(1) $ (\cnt~2_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , \en~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0102",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => cnt(1),
	datab => \process_0~4_combout\,
	datac => \process_0~2_combout\,
	datad => \cnt~2_combout\,
	aclr => \rst~combout\,
	ena => \en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(1));

-- Location: LC_X3_Y2_N6
\cnt~7\ : maxii_lcell
-- Equation(s):
-- \cnt~7_combout\ = (cnt(0) & (\inc~combout\ & (cnt(1) & cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => \inc~combout\,
	datac => cnt(1),
	datad => cnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt~7_combout\);

-- Location: LC_X3_Y2_N4
\cnt~6\ : maxii_lcell
-- Equation(s):
-- \cnt~6_combout\ = (\inc~combout\) # (((!\process_0~1_combout\)) # (!\dec~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bbff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inc~combout\,
	datab => \dec~combout\,
	datad => \process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt~6_combout\);

-- Location: LC_X3_Y2_N5
\cnt[3]\ : maxii_lcell
-- Equation(s):
-- cnt(3) = DFFEAS(\process_0~4_combout\ $ (((\cnt~7_combout\) # ((cnt(3) & \cnt~6_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , \en~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "565a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \process_0~4_combout\,
	datab => cnt(3),
	datac => \cnt~7_combout\,
	datad => \cnt~6_combout\,
	aclr => \rst~combout\,
	ena => \en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(3));

-- Location: LC_X4_Y2_N8
\process_0~3\ : maxii_lcell
-- Equation(s):
-- \process_0~3_combout\ = (((!cnt(2) & !cnt(1))))

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
	datac => cnt(2),
	datad => cnt(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~3_combout\);

-- Location: LC_X4_Y2_N7
\process_0~4\ : maxii_lcell
-- Equation(s):
-- \process_0~4_combout\ = (cnt(3) & (cnt(0) & (\inc~combout\ & \process_0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(0),
	datac => \inc~combout\,
	datad => \process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~4_combout\);

-- Location: LC_X3_Y2_N3
\cnt~0\ : maxii_lcell
-- Equation(s):
-- \cnt~0_combout\ = (\process_0~0_combout\) # ((\dec~combout\ & ((cnt(3)) # (!\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f8fc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => \dec~combout\,
	datac => \process_0~0_combout\,
	datad => \process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \cnt~0_combout\);

-- Location: LC_X3_Y2_N7
\cnt[0]\ : maxii_lcell
-- Equation(s):
-- cnt(0) = DFFEAS((!\process_0~4_combout\ & (!\process_0~2_combout\ & (cnt(0) $ (\cnt~0_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , \en~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0104",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \process_0~4_combout\,
	datab => cnt(0),
	datac => \process_0~2_combout\,
	datad => \cnt~0_combout\,
	aclr => \rst~combout\,
	ena => \en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(0));

-- Location: LC_X3_Y2_N1
aux : maxii_lcell
-- Equation(s):
-- \aux~regout\ = DFFEAS(\process_0~4_combout\ $ (((\process_0~2_combout\) # ((\aux~regout\ & !\cnt~0_combout\)))), GLOBAL(\clk~combout\), !GLOBAL(\rst~combout\), , \en~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5a56",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \process_0~4_combout\,
	datab => \aux~regout\,
	datac => \process_0~2_combout\,
	datad => \cnt~0_combout\,
	aclr => \rst~combout\,
	ena => \en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \aux~regout\);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(0),
	oe => VCC,
	padio => ww_q(0));

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(1),
	oe => VCC,
	padio => ww_q(1));

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(2),
	oe => VCC,
	padio => ww_q(2));

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\q[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => cnt(3),
	oe => VCC,
	padio => ww_q(3));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\cout~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \aux~regout\,
	oe => VCC,
	padio => ww_cout);
END structure;


