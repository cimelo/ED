LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY rngTB IS
END ENTITY rngTB;

ARCHITECTURE sim OF rngTB IS
    CONSTANT clk_freq    : NATURAL  := 10; -- 10Hz 
    CONSTANT clk_per     : TIME     := 1 ms / clk_freq;

    SIGNAL clk : STD_LOGIC := '1';
    SIGNAL n_rst : STD_LOGIC := '0';
    SIGNAL gen : STD_LOGIC := '1';
BEGIN
    i_rng : ENTITY work.rng(behaviour)
    PORT MAP(
		clk => clk,
        n_rst => n_rst,
        gen => gen);

    -- Duty cycle of 0.5
    clk <= NOT clk after clk_per / 2;

    -- Without a signal to follow it will run until
    -- the end of the process
    PROCESS IS 
    BEGIN
        wait until rising_edge(clk);
        wait until rising_edge(clk);

        n_rst <= '1';
        wait;
    END PROCESS;


END ARCHITECTURE sim;
