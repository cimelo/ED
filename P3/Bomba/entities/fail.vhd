---------------------------
-- Entity responsible for
-- blinking the LEDs and
-- turning on the buzzer
---------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fail IS
    PORT(
        clk, f : IN STD_LOGIC;
        leds, buzz : OUT STD_LOGIC_VECTOR(4 DOWNTO 1));
END fail;

ARCHITECTURE behavior OF fail IS
    COMPONENT driver_buzzer 
        PORT (
        clk : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        buzz : OUT STD_LOGIC);
    END COMPONENT;


BEGIN
    i_db : driver_buzzer IS 
    PORT MAP (
        clk => clk,
        buzz => buzz, 
        ena => f);
END ARCHITECTURE behaviour;
