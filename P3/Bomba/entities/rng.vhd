--------------------------------
--	This block generates a true
--	rng value suppose the input
--	is trully randomized.
--------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY rng IS
	PORT(
		clk, input : IN STD_LOGIC;
		q : NATURAL RANGE 4 DOWNTO 0);
END rng;

ARCHITECTURE behaviour OF rng IS
	COMPONENT cnt_mod10
		PORT
		(
			clk		:	 IN STD_LOGIC;
			en		:	 IN STD_LOGIC;
			rst		:	 IN STD_LOGIC;
			inc		:	 IN STD_LOGIC;
			dec		:	 IN STD_LOGIC;
			q		:	 OUT NATURAL RANGE 0 TO 9;
			cout		:	 OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	
END behaviour;