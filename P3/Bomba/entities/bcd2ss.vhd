-----------------------------
--	Module that converts BCD
--	mod 10 into Seven Segment
--	display code.
-----------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bcd2ss IS
	PORT(
		d : IN NATURAL RANGE 9 DOWNTO 0;
		clk : IN STD_LOGIC; -- Signal to update the value
		q : OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END bcd2ss;

ARCHITECTURE behaviour OF bcd2ss IS
BEGIN
	PROCESS (clk)
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			CASE (d) IS
				WHEN 0 => q <= B"11000000";
				WHEN 1 => q <= B"11111001";
				WHEN 2 => q <= B"10100100";
				WHEN 3 => q <= B"10110000";
				WHEN 4 => q <= B"10011001";
				WHEN 5 => q <= B"10010010";
				WHEN 6 => q <= B"10000010";
				WHEN 7 => q <= B"11111000";
				WHEN 8 => q <= B"10000000";
				WHEN 9 => q <= B"10010000";
				WHEN OTHERS => 
					q <= B"10000110";
			END CASE;
		END IF;
	END PROCESS;
END behaviour;
