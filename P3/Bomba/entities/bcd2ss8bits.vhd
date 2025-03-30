-----------------------------
--	Module that converts BCD
--	mod 10 into Seven Segment
--	display code.
-----------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY bcd2ss8bits IS
	PORT(
		d 			: IN NATURAL RANGE 0 TO 9;
		q 			: OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END bcd2ss8bits;

ARCHITECTURE behaviour OF bcd2ss8bits IS
BEGIN
	WITH (d) SELECT
        q <= B"11000000" WHEN 0,
    	     B"11111001" WHEN 1,
    	     B"10100100" WHEN 2,
    	     B"10110000" WHEN 3,
    	     B"10011001" WHEN 4,
    	     B"10010010" WHEN 5,
    	     B"10000010" WHEN 6,
    	     B"11111000" WHEN 7,
    	     B"10000000" WHEN 8,
    	     B"10010000" WHEN 9,
    	     B"10000110" WHEN OTHERS;
END behaviour;
