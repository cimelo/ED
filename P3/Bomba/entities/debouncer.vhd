---------------------------------
-- This block is responsible for
-- the debounce of the switches
---------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY debouncer IS
	PORT(
		clk, clk_db, k  : IN STD_LOGIC;
		p_db, q 	: OUT STD_LOGIC);
END debouncer;

ARCHITECTURE behavior OF debouncer IS
BEGIN
    PROCESS (clk, clk_db)
        VARIABLE q1, q2, q3, q4, pdb, flag : STD_LOGIC := '0';
    BEGIN
        IF (RISING_EDGE(clk_db)) THEN
            q1 := NOT k;
        ELSIF (FALLING_EDGE(clk_db)) THEN
            q2 := q1;
        END IF;

        pdb := NOT q2 AND q1;

        IF (RISING_EDGE(clk)) THEN
            q3 := pdb;
            IF (flag = '1') THEN
                q4 := q3;
            END IF;
        ELSIF (FALLING_EDGE(clk)) THEN
            flag := pdb;
        END IF;
        
        p_db <= pdb;
        q <= NOT q4 AND q3; -- Gerates a pulse of width of 20 ns
    END PROCESS;
END behavior;
