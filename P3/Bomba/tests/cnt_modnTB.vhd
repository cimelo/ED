LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.gen_functions.ALL;

ENTITY cnt_modnTB IS
END ENTITY cnt_modnTB;

ARCHITECTURE sim OF cnt_modnTB IS
    CONSTANT clk_freq    : NATURAL  := 10; -- 10Hz 
    CONSTANT clk_per     : TIME     := 1 ms / clk_freq;

    SIGNAL clk : STD_LOGIC := '1';
    SIGNAL rst : STD_LOGIC := '0';
    SIGNAL en : STD_LOGIC := '1';
    SIGNAL inc : STD_LOGIC := '0';
    SIGNAL dec : STD_LOGIC := '0';
BEGIN
    i_cnt_modN : ENTITY work.cnt_modn(behaviour)
    GENERIC MAP(N => 11)
    PORT MAP(
		clk => clk,
        en  => en,
        rst => rst,
        inc => inc,
        dec => dec);

    -- Duty cycle of 0.5
    clk <= NOT clk after clk_per / 2;

    inc <= NOT inc after clk_per*10;
    dec <= NOT inc;

    -- Without a signal to follow it will run until
    -- the end of the process
    PROCESS IS 
    BEGIN
        wait;
    END PROCESS;


END ARCHITECTURE sim;
