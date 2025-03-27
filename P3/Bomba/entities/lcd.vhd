--------------------------------------
--	State Machine for LCD behaviour
--------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lcd IS 
	PORT (
		clk, rst, ena   : IN STD_LOGIC;
        keys            : IN STD_LOGIC_VECTOR(3 DOWNTO 1);
        cmp             : IN STD_LOGIC;
        rs, rw, en      : OUT stD_LOGIC;
        db              : STD_LOGIC_VECTOR(8 DOWNTO 1));
END lcd;

ARCHITECTURE behaviour OF lcd IS
    CONSTANT clk_freq := 50; -- MHz

    fs1_1 : STRING := "BOMBA  EXPLODIRA";
    fs1_2 : STRING := "EM ";
    fs1_3 : STRING := " SEGUNDOS";

    fs2_1 : STRING := "BOOM";

    fs3_1 : STRING := "BOMBA";
    fs3_2 : STRING := "DESATIVADA";

    COMPONENT lcd_controller
    	PORT (
    		clk		    :	 IN STD_LOGIC;
    		rst		    :	 IN STD_LOGIC;
    		lcd_enable	:	 IN STD_LOGIC;
    		lcd_bus		:	 IN STD_LOGIC_VECTOR(10 DOWNTO 1);
    		busy		:	 OUT STD_LOGIC;
    		rw		    :	 OUT STD_LOGIC;
    		rs		    :	 OUT STD_LOGIC;
    		en		    :	 OUT STD_LOGIC;
    		lcd_data	:	 OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
    END COMPONENT;

    TYPE STATES(INIT, CMP, SUCC, FAIL, RESET);
    SIGNAL st : STATES;
    SIGNAL lcd_en : STD_LOGIC;
    -- Because we will not read any value from the lcd, 
    -- we set rs='0' and rw='0' for write operation
    SIGNAL lcd_data : STD_LOGIC_VECTOR(10 DOWNTO 1) :=
                                                "1000000000");
    SIGNAL lcd_busy : STD_LOGIC;
BEGIN

    i_lcd_ctrl : lcd_controller PORT MAP (
    	clk => clk,
    	rst => rst,
    	lcd_en => lcd_enable,
        lcd_data => lcd_bus,		
    	lcd_busy => busy,
    	rw => rw,
    	rs => rs,
    	en => en,
    	lcd_data);

    PROCESS (clk, rst, en)
        -- This variable counts the time that an operation takes
        -- the slowest operation possible is return home with a
        -- delay of 1.52 ms
        VARIABLE cnt_op : NATURAL RANGE 0 TO 20e3*clk_freq;
        VARIABLE cnt_time : NATURAL RANGE 0 TO 30e6*clk_freq;
    BEGIN

        if_re: IF (RISING_EDGE(clk)) THEN
            IF (rst = '1') THEN
                st <= RESET;
                cnt_time := 0;
            END IF

            case_st: CASE st IS
                -- Waits for the LCD to be read to read data
                WHEN INIT =>
                    cnt_time := cnt_time + 1;
                    -- Waits 55.2 ms for the lcd to power up
                    IF (cnt_time < 55200*clk_freq AND 
                                            lcd_busy = '1') THEN
                        st <= INIT;
                    ELSE
                        cnt_time := 0;
                        st <= CMP;
                    END IF;

                -- State of comparison between keys[4..2] and rng[3..1]
                WHEN CMP =>
                WHEN SUCC =>
                WHEN FAIL =>
                WHEN RESET =>
            END case_st;
        END if_re;
    END PROCESS;
END behaviour;
