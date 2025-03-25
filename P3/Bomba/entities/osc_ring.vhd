----------------------------------
--	This component generates
--	the output for an oscillator
--	ring for trng purposes.
----------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY osc_ring IS
	-- The use of buffers can be avoided by
	-- the use of signals (PETRONI, 2010)
	PORT(y : OUT STD_LOGIC);
END osc_ring;

ARCHITECTURE behaviour OF osc_ring IS
	SIGNAL a, b, c : STD_LOGIC;
	-- The attribute keeps is used to avoid
	-- syntesis optimizations
	ATTRIBUTE keep : BOOLEAN;
	ATTRIBUTE keep OF a, b, c : SIGNAL IS TRUE;
BEGIN
	y <= c;
	a <= NOT c;
	b <= NOT a;
	c <= NOT b;
	
END behaviour;