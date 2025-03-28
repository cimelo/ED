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
		clk, rst 	: IN STD_LOGIC;
		q 			: OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END bcd2ss8bits;

ARCHITECTURE behaviour OF bcd2ss8bits IS
BEGIN
	PROCESS (clk, rst)
		VARIABLE tmp : UNSIGNED(8 DOWNTO 1) 
								:= B"11000000";
	BEGIN
		IF (rst = '1') THEN
			tmp := B"11000000";
		ELSIF (rising_edge(clk)) THEN
			CASE (d) IS
				WHEN 0 => tmp := B"11000000";
				WHEN 1 => tmp := B"11111001";
				WHEN 2 => tmp := B"10100100";
				WHEN 3 => tmp := B"10110000";
				WHEN 4 => tmp := B"10011001";
				WHEN 5 => tmp := B"10010010";
				WHEN 6 => tmp := B"10000010";
				WHEN 7 => tmp := B"11111000";
				WHEN 8 => tmp := B"10000000";
				WHEN 9 => tmp := B"10010000";
				WHEN OTHERS => 
					tmp := B"10000110";
			END CASE;
		END IF;

        q <= STD_LOGIC_VECTOR(tmp);
	END PROCESS;
END behaviour;
