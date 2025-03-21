---------------------------------------
--	This module is a parameterized 
--	up/down counter mod N that 
--	behaves accordingly with the input
--	of inc or dec.
---------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.gen_functions.ALL;

ENTITY cnt_modn IS
	GENERIC(N : NATURAL := 10);
	PORT(
		clk, en, rst, inc, dec : IN STD_LOGIC;
		q : OUT NATURAL RANGE N-1 DOWNTO 0;
		cout : OUT STD_LOGIC);
END cnt_modn;

ARCHITECTURE behaviour OF cnt_modn IS
BEGIN
	PROCESS (clk, rst)
		VARIABLE cnt : NATURAL RANGE N DOWNTO 0 := 0;
		VARIABLE aux : STD_LOGIC := '0';
	BEGIN
		IF (rst = '1') THEN
			cnt := 0;
			aux := '0';
		ELSIF (en = '1') THEN
			IF (clk'EVENT AND clk = '1') THEN
				IF (inc = '1' AND cnt = N-1) THEN
					cnt := 0;
					aux := '1';
				ELSIF (dec = '1' AND cnt = 0) THEN
					cnt := 0;
					aux := '1';
				ELSIF (inc = '1' AND cnt < n) THEN
					cnt := cnt + 1;
					aux := '0';
				ELSIF (dec = '1' AND cnt > 0) THEN
					cnt := cnt - 1;
					aux := '0';
				END IF;
			END IF;
		END IF;
	
		q <= cnt;
		cout <= aux;	
	END PROCESS;
END behaviour;