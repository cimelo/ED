---------------------------------
-- Entity that generates a clock
-- for the debouncer
---------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY clk_gen IS
  PORT(
    clk     : IN   STD_LOGIC;
    clk_db	: OUT  STD_LOGIC);
END clk_gen;

ARCHITECTURE behavior OF clk_gen IS
    CONSTANT clk_freq : NATURAL := 50; -- MHz
    CONSTANT db_per : NATURAL := 100;
BEGIN
    PROCESS (clk)
        VARIABLE cnt_time : NATURAL RANGE 0 TO db_per*1e3 * clk_freq := 0;
        VARIABLE adb : STD_LOGIC;
    BEGIN
        IF (RISING_EDGE(clk)) THEN
            cnt_time := cnt_time + 1;

            IF (cnt_time = db_per*1e3 *clk_freq-1) THEN
                cnt_time := 0;
                adb := '1';
            ELSE
                adb := '0';
            END IF;
        END IF;

        clk_db <= adb;
    END PROCESS;
END behavior;
