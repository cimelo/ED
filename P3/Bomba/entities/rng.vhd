---------------------------------------------------
--	This block generates a true
--	rng based upon oscillator rings.
-- 	Reference: [1]"Analysis and Enhancement of
--				Random Number Generator in FPGA 
--				Based on Oscillator Rings", by
--				Knut Wold and Chik How Tan, 2009.
--------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY rng IS
	PORT(
		clk, gen, rst : IN STD_LOGIC;
		q 				: OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
END rng;

ARCHITECTURE behavior OF rng IS
	COMPONENT osc_ring IS
		PORT (y : OUT STD_LOGIC);
	END COMPONENT;
	
	FUNCTION xor_reduction(v : STD_LOGIC_VECTOR)	
		RETURN STD_LOGIC IS
		VARIABLE temp : STD_LOGIC := v(v'LOW);
	BEGIN
		FOR i IN v'LOW TO v'HIGH-1 LOOP
			temp := temp XOR v(i+1);
		END LOOP;
		
		RETURN temp;
	END FUNCTION xor_reduction;
	
	SIGNAL tmp_r : STD_LOGIC_VECTOR(16 DOWNTO 1);
	SIGNAL aux_xor : STD_LOGIC_VECTOR(4 DOWNTO 1);	
BEGIN
	-- 16 osc_rings instances have a probability > 35%
    -- of reaching a transition region.
	i_ring : FOR i IN 1 TO 16 GENERATE
		ringx: osc_ring PORT MAP (tmp_r(i));
	END GENERATE i_ring;
	
	gen_q : FOR i IN 1 TO 4 GENERATE
		aux_xor(i) <= xor_reduction(tmp_r(4*i DOWNTO (i-1)*4+1));
	END GENERATE gen_q;
	
	-- We then save the values inside a register 
	-- for Unsigned Mod 10 operation to avoid overflow.
	PROCESS (clk, gen, aux_xor, rst)
		VARIABLE temp : STD_LOGIC_VECTOR(4 DOWNTO 1) 
                                    := (OTHERS => '0');
	BEGIN
		IF (rst = '1') THEN
			temp := (OTHERS => '0');
		ELSIF (RISING_EDGE(clk) AND gen = '1') THEN
			temp := aux_xor;
		END IF;
		
		q <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(temp) MOD 8, 3));
	END PROCESS;
END behavior;
