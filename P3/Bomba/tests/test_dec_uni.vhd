LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.gen_functions.ALL;

ENTITY test_dec_uni IS
	PORT(du : OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END test_dec_uni;

ARCHITECTURE behaviour of test_dec_uni IS
	CONSTANT c : NATURAL RANGE 0 to 30 := 25; 
BEGIN
	du <= dec_uni(c);
END behaviour;