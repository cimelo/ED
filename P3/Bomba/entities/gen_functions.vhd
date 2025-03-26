--------------------------------
--	Package with functions that
--	are 1993 VHDL standard 
--	compliant.
--------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE gen_functions IS
	FUNCTION ceil_log2(n : NATURAL) 
        RETURN NATURAL;

	-- Function that receives a 5-bit number N
	-- and returns a 8-bit number where the 
	-- 4 most significant bits represent the
	-- decimal part of N and the 4 other bits
	-- represent the unity.
	FUNCTION dec_uni(N : UNSIGNED) 
        RETURN STD_LOGIC_VECTOR;
END gen_functions;

PACKAGE BODY gen_functions IS
	FUNCTION ceil_log2(n : NATURAL) RETURN
		NATURAL IS
		VARIABLE t : NATURAL := n;
		VARIABLE l : NATURAL := 0;
	BEGIN
		WHILE (t > 0) LOOP
			t := t/2;
			l := l + 1;
		END LOOP;
		
		RETURN l;
	END FUNCTION ceil_log2;
	
	FUNCTION dec_uni(n: UNSIGNED) 
		RETURN STD_LOGIC_VECTOR IS
		VARIABLE du : STD_LOGIC_VECTOR(8 DOWNTO 1);
		VARIABLE d, u : UNSIGNED(4 DOWNTO 1);
	BEGIN
		d := n / 10;
		u := n MOD 10;
		du(8 DOWNTO 5) := STD_LOGIC_VECTOR(d);
		du(4 DOWNTO 1) := STD_LOGIC_VECTOR(u);
		RETURN du;
	END FUNCTION dec_uni;
END gen_functions;
