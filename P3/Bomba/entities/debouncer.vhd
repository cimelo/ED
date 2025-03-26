---------------------------------
-- This block is responsible for
-- the debounce of the switches
---------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY debouncer IS
	PORT(
		clk, k, rst   : IN STD_LOGIC;
		q 			    : OUT STD_LOGIC);
END debouncer;

ARCHITECTURE behaviour OF debouncer IS
BEGIN
    PROCESS (clk, k, rst)
        VARIABLE tmp : STD_LOGIC;
    BEGIN
        IF (rst = '1') THEN
            tmp := '0';
        ELSIF (RISING_EDGE(clk)) THEN
            tmp := NOT k;
        END IF;

        q <= tmp;
    END PROCESS;
END behaviour;
