LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.gen_functions.ALL;

ENTITY test_dec_uni IS
	PORT(du : OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END test_dec_uni;

ARCHITECTURE behaviour of test_dec_uni IS
	CONSTANT c : NATURAL := 25; 
BEGIN
	du <= dec_uni(TO_UNSIGNED(c, 5));
END behaviour;