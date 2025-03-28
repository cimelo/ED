--------------------------------------
--	State Machine for LCD behaviour
--------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; -- for operations with unsigned values and to_unsigned
USE work.gen_functions.ALL;
USE work.lcd_vhdl_package.ALL;

ENTITY lcd IS 
	PORT (
		clk, rst, ena   : IN STD_LOGIC;
        keys            : IN STD_LOGIC_VECTOR(4 DOWNTO 2);
        rng             : IN STD_LOGIC_VECTOR(3 DOWNTO 1);
        eq             	: IN STD_LOGIC; -- Switch that compares the value of keys and rng
        rs, rw, en      : OUT STD_LOGIC;
        db              : OUT STD_LOGIC_VECTOR(8 DOWNTO 1));
END lcd;

ARCHITECTURE behaviour OF lcd IS
    CONSTANT clk_freq : NATURAL := 50; -- MHz

    CONSTANT fs1_1  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("BOMBA  EXPLODIRA");
    CONSTANT fs1_2  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("EM    SEGUNDOS  ");      

    CONSTANT fs2_1  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("BOOM            ");
    CONSTANT fs2_2  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("                ");

    CONSTANT fs3_1  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("BOMBA           ");
    CONSTANT fs3_2  : STD_LOGIC_VECTOR(127 DOWNTO 0) := to_std_logic_vector("DESATIVADA      ");

    CONSTANT LOG2_30 : NATURAL := 5;

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

    TYPE STATES IS (INIT, CMP, SUCCESS, FAIL, RESET);
    SIGNAL st : STATES;
    SIGNAL lcd_enable : STD_LOGIC := '0';

    SIGNAL lcd_bus : STD_LOGIC_VECTOR(10 DOWNTO 1) := (OTHERS => '0');
    SIGNAL lcd_busy : STD_LOGIC;
	SIGNAL l1 : std_logic_vector (127 DOWNTO 0);
	SIGNAL l2 : std_logic_vector (127 DOWNTO 0);
BEGIN

    i_lcd_ctrl : lcd_controller PORT MAP (
    	clk         => clk,
    	rst         => rst,
    	lcd_enable  => lcd_enable,
        lcd_bus     => lcd_bus,
    	busy        => lcd_busy,
    	rw          => rw,
    	rs          => rs,
    	en          => en,
    	lcd_data    => db);

    PROCESS (clk, rst, ena, eq)
        -- This variable counts the time that an operation takes
        -- the slowest operation possible is return home with a
        -- delay of 1.52 ms
        VARIABLE cnt_op     : NATURAL RANGE 0 TO 20e3*clk_freq := 0;
        VARIABLE cnt_time   : NATURAL RANGE 0 TO 30e6*clk_freq := 0;
        VARIABLE tries      : NATURAL RANGE 0 TO 3  := 0;
        VARIABLE cnt_char   : NATURAL RANGE 0 TO 34 := 0;

        -- 4 bits variable that results from a conversion of a
		-- natural number into a 8 bits vects in wich the 4 most
		-- significant bits are the decimal part and the others
		-- represent the ones part
        VARIABLE du : STD_LOGIC_VECTOR(8 DOWNTO 1) := (OTHERS => '0');

        PROCEDURE restart(rst_time : NATURAL) IS
        BEGIN
            cnt_op := 0;
            tries := 0;
            cnt_time := rst_time;
        END PROCEDURE restart;

        PROCEDURE send_strs IS
        BEGIN
            IF (lcd_enable = '0' AND lcd_busy = '0') THEN
                lcd_enable <= '1';

                IF (cnt_char < 34) THEN
                    cnt_char := cnt_char + 1;
                ELSE
                    cnt_char := 0;
                END IF;

                CASE cnt_char IS --verifica o estado atual
			        WHEN 0  => lcd_bus <= "00" & "10000000"; --inst. linha 1
                    WHEN 1  => lcd_bus <= "10" & L1(127 DOWNTO 120); --prim. char da linha 1
                    WHEN 2  => lcd_bus <= "10" & L1(119 DOWNTO 112);
                    WHEN 3  => lcd_bus <= "10" & L1(111 DOWNTO 104);
                    WHEN 4  => lcd_bus <= "10" & L1(103 DOWNTO 96);
                    WHEN 5  => lcd_bus <= "10" & L1(95 DOWNTO 88);
                    WHEN 6  => lcd_bus <= "10" & L1(87 DOWNTO 80);
                    WHEN 7  => lcd_bus <= "10" & L1(79 DOWNTO 72);
                    WHEN 8  => lcd_bus <= "10" & L1(71 DOWNTO 64);
                    WHEN 9  => lcd_bus <= "10" & L1(63 DOWNTO 56);
			        WHEN 10 => lcd_bus <= "10" & L1(55 DOWNTO 48);
			        WHEN 11 => lcd_bus <= "10" & L1(47 DOWNTO 40);
			        WHEN 12 => lcd_bus <= "10" & L1(39 DOWNTO 32);
			        WHEN 13 => lcd_bus <= "10" & L1(31 DOWNTO 24);
			        WHEN 14 => lcd_bus <= "10" & L1(23 DOWNTO 16);
			        WHEN 15 => lcd_bus <= "10" & L1(15 DOWNTO 8);
			        WHEN 16 => lcd_bus <= "10" & L1(7 DOWNTO 0); --ult char da linha 
			        WHEN 17 => lcd_bus <= "00" & "11000000"; --inst. linha 
                    WHEN 18 => lcd_bus <= "10" & L2(127 DOWNTO 120); --prim. char da linha 
                    WHEN 19 => lcd_bus <= "10" & L2(119 DOWNTO 112);

                    WHEN 20 =>  
                        du := dec_uni(TO_UNSIGNED(cnt_time/(1e6*clk_freq), LOG2_30));
                        lcd_bus <= "10" & L2(111 DOWNTO 104);

                    -- To convert a 4bits number into ascii you just need to concatenate
                    -- 0011 in front of it
                    WHEN 21 => 
                        IF (st = CMP) THEN
                           lcd_bus <= "10" & "0011" & du(8 DOWNTO 5);
                        ELSE
                           lcd_bus <= "10" & L2(103 DOWNTO 96);
                        END IF;
                    WHEN 22 => 
                        IF (st = CMP) THEN
                            lcd_bus <= "10" & "0011" & du(4 DOWNTO 1);
                        ELSE
                           lcd_bus <= "10" & L2(95 DOWNTO 88);
                        END IF;

                    WHEN 23 => lcd_bus <= "10" & L2(87 DOWNTO 80);
                    WHEN 24 => lcd_bus <= "10" & L2(79 DOWNTO 72);
                    WHEN 25 => lcd_bus <= "10" & L2(71 DOWNTO 64);
                    WHEN 26 => lcd_bus <= "10" & L2(63 DOWNTO 56);
			        WHEN 27 => lcd_bus <= "10" & L2(55 DOWNTO 48);
			        WHEN 28 => lcd_bus <= "10" & L2(47 DOWNTO 40);
			        WHEN 29 => lcd_bus <= "10" & L2(39 DOWNTO 32);
			        WHEN 30 => lcd_bus <= "10" & L2(31 DOWNTO 24);
			        WHEN 31 => lcd_bus <= "10" & L2(23 DOWNTO 16);
			        WHEN 32 => lcd_bus <= "10" & L2(15 DOWNTO 8);
			        WHEN 33 => lcd_bus <= "10" & L2(7 DOWNTO 0); --ult. char da linha 2
                    WHEN OTHERS => lcd_enable <= '0'; --desabilita o LCD
                END CASE;
            ELSE
                lcd_enable <= '0'; --desabilita o LCD
            END IF;
        END PROCEDURE send_strs;

    BEGIN

        if_re: IF (RISING_EDGE(clk)) THEN
            IF (rst = '1') THEN
                st <= RESET;
                cnt_time := 0;
            END IF;

            CASE st IS
                -- Waits for the LCD to be read to read data
                WHEN INIT =>
                    cnt_time := cnt_time + 1;
                    -- Waits 55.2 ms for the lcd to power up
                    IF (cnt_time < 55200*clk_freq AND 
                                            lcd_busy = '1') THEN
                        st <= INIT;
                    ELSE
                        cnt_time := 30e6 * clk_freq;
                        st <= CMP;
                    END IF;

                -- State of comparison between keys[4..2] and rng[3..1]
                -- 3 chances and 30 seconds are given to the user to 
                -- guess the right number.
                WHEN CMP =>
                    cnt_time := cnt_time - 1;

                    IF (cnt_time > 0) THEN
                        l1 <= fs1_1;
                        l2 <= fs1_2;
                        send_strs;

                        IF (tries = 3) THEN
                            restart(10e6 * clk_freq);
                            st <= FAIL;
                        ELSIF ( rng = keys AND eq = '1' ) THEN
                            restart(10e6 * clk_freq);
                            st <= SUCCESS;
                        ELSIF ( rng /= keys AND eq = '1' ) THEN
                            tries := tries + 1;
                            st <= CMP;
                        ELSE
                            st <= CMP;
                        END IF;
                    ELSE
                        restart(10e6*clk_freq);
                        st <= FAIL;
                    END IF;
                WHEN SUCCESS =>
                    cnt_time := cnt_time - 1;

                    IF (cnt_time > 0) THEN
                        l1 <= fs3_1;
                        l2 <= fs3_2;
                        send_strs;

                        st <= SUCCESS;
                    ELSE
                        restart(0);
                        st <= RESET;
                    END IF;
                WHEN FAIL =>
                    cnt_time := cnt_time - 1;

                    IF (cnt_time > 0) THEN
                        l1 <= fs2_1;
                        l2 <= fs2_2;
                        send_strs;

                        st <= FAIL;
                    ELSE
                        restart(0);
                        st <= RESET;
                    END IF;
                WHEN RESET =>
					restart(30e6 * clk_freq);
                    st <= CMP;
            END CASE;
        END IF if_re; -- If rising_edge()
    END PROCESS;
END behaviour;
