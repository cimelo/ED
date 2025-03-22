--------------------------------
--	Package with functions that
--	are 1993 VHDL standard 
--	compliant.
--------------------------------

PACKAGE gen_functions IS
	FUNCTION ceil_log2(n : NATURAL) 
						RETURN NATURAL;
	FUNCTION prng(seed : NATURAL) 
						RETURN NATURAL;
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
	END ceil_log2;
	
	FUNCTION prng(seed : NATURAL) RETURN NATURAL IS
	BEGIN
		return (1238587*seed) MOD 10;
	END prng;
	
END gen_functions;