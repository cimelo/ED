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

ENTITY cnt_mod10 IS
	PORT(
		clk, en, rst, inc, dec : IN STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(4 DOWNTO 1);
		cout : OUT STD_LOGIC);
END cnt_mod10;

ARCHITECTURE behaviour OF cnt_mod10 IS
BEGIN
	PROCESS (clk, rst, inc, dec)
		VARIABLE cnt : NATURAL RANGE 10 DOWNTO 0 := 0;
		VARIABLE aux : STD_LOGIC := '0';
	BEGIN
		IF (rst = '1') THEN
			cnt := 0;
			aux := '0';
		ELSIF (en = '1') THEN
			IF (rising_edge(clk)) THEN
				IF (inc = '1' AND cnt = 9) THEN
					cnt := 0;
					aux := '1';
				ELSIF (dec = '1' AND cnt = 0) THEN
					cnt := 0;
					aux := '1';
				ELSIF (inc = '1' AND cnt < 10) THEN
					cnt := cnt + 1;
					aux := '0';
				ELSIF (dec = '1' AND cnt > 0) THEN
					cnt := cnt - 1;
					aux := '0';
				END IF;
			END IF;
		END IF;
	
		q <= STD_LOGIC_VECTOR(TO_UNSIGNED(cnt, 4));
		cout <= aux;	
	END PROCESS;
END behaviour;