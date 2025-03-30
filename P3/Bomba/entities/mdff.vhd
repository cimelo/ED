---------------------------------
-- This block is a simple dff
---------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mdff IS
	PORT(
		clk, d  : IN STD_LOGIC;
		q       : OUT STD_LOGIC);
END mdff;

ARCHITECTURE behavior OF mdff IS
BEGIN
    PROCESS (clk)
       VARIABLE aux : STD_LOGIC; 
    BEGIN
        IF (RISING_EDGE(clk)) THEN
            aux := d;
        END IF;

        q <= aux;
    END PROCESS;
END behavior;
