LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY buzzerTB IS
END ENTITY buzzerTB;

ARCHITECTURE sim OF buzzerTB IS
    CONSTANT clk_freq    : NATURAL  := 10; -- 10Hz 
    CONSTANT clk_per     : TIME     := 1 ms / clk_freq;

    SIGNAL clk : STD_LOGIC := '1';
    SIGNAL buzz : STD_LOGIC := '1';
BEGIN
    i_buzz : ENTITY work.driver_buzzer(behaviour)
    PORT MAP(
		clk => clk,
        buzz => buzz);

    -- Duty cycle of 0.5
    clk <= NOT clk after clk_per / 2;

    -- Without a signal to follow it will run until
    -- the end of the process
    PROCESS IS 
    BEGIN
        wait;
    END PROCESS;


END ARCHITECTURE sim;
