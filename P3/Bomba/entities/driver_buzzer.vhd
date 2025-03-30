LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY driver_buzzer IS
    PORT (
        clk, ena : IN STD_LOGIC;
        buzz : OUT STD_LOGIC);
END driver_buzzer;

ARCHITECTURE behavior OF driver_buzzer IS
    CONSTANT clk_freq : NATURAL := 50e6;
	CONSTANT osc_2hz : NATURAL := clk_freq/2;
	CONSTANT osc_1khz : NATURAL := clk_freq/1000;
BEGIN
    PROCESS (clk)
        VARIABLE cnt_2 : NATURAL RANGE 0 to osc_2hz-1;
        VARIABLE cnt_1k : NATURAL RANGE 0 to osc_1khz-1;
		VARIABLE tmp : STD_LOGIC := '1';
    BEGIN
        IF ( ena = '1' ) THEN
            IF (RISING_EDGE(clk)) THEN
                cnt_2 := cnt_2 + 1;

                IF (cnt_2 = osc_2hz-1) THEN
                    cnt_2 := 0;
		        END IF;

                IF ( cnt_2 < (osc_2hz)/2 ) THEN
                    tmp := '1';
                ELSE
                    cnt_1k := cnt_1k + 1;

                    IF (cnt_1k = osc_1khz-1) THEN
                        cnt_1k := 0;
		            END IF;

                    IF (cnt_1k < (osc_1khz)/2) THEN
                        tmp := '0';
                    ELSE
		        	    tmp := '1';
                    END IF;
                END IF;
            END IF;
		    
            buzz <= tmp;
        END IF;
    END PROCESS;
END behavior;
