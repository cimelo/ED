//////////////////////////////////////
//
// Main module of the program where
// the main state machine is located.
//
//////////////////////////////////////

module controller 
(
    input clk, rst,
    input [4:1] key,
    input [8:1] t_data1,
    input [8:1] t_data2,
    input [8:1] t_data3,
    input [2:1] flag_pass, // flag to be read from mod_pass
    output reg lcd_rs,
    output reg lcd_rw,
    output reg lcd_en,
    output reg [8:1] db,
    output reg [2:1] f_pass // flag to be sent to mod_pass
);

    localparam CLK_FREQ = 50; // 50 MHz

    // Definition of the states
    localparam INIT   = 3'b000,
               MENU   = 3'b001,
               PLAYER = 3'b010,
               TEMP   = 3'b011,
               NEW_PASS   = 3'b100,
               BLOCK  = 3'b101;

    // Menu options
    localparam PLAY     = 3'b00,
               S_TEMP   = 3'b01,
               LOCK     = 3'b10,
               N_PASS   = 3'b11;

    reg [3:1] cur_state, next_state;
    reg [16:1] cnt_time = 16'd0;
    reg [6:1] cnt_char 	= 6'd0;
    reg [3:1] cnt_menu  = 3'd0;

    // Menu screen msgs
    localparam empty_str   = "                ",
               pass_1      = "NOVA SENHA      ",
               lock_1      = "BLOQUEAR        ",
               temp_1      = "TEMPERATURA     ",
               music_1     = "PLAYER DE MUSICA";

    // Lock screen msg
    localparam scr_lock_1  = "DIGITE A SENHA  ";
    localparam scr_lock_2  = "PARA DESBLOQUEAR";

    // Temp screen msg
    localparam scr_temp_1  = "TEMPERATURA:    ";

    // New password msgs
    localparam scr_pass_1  = "DIGITE A NOVA   ";
    localparam scr_pass_2  = "SENHA           ";

    // LCD aux variables
    reg lcd_enable = 1'b0;
    reg [10:1] lcd_bus = 10'b0;
    reg lcd_busy;
	reg [127:0] l1;
	reg [127:0] l2;

    // LCD controller Instance
    lcd_controller i_lcd_ctrl (
        .clk(clk),
        .rst(rst),
        .lcd_enable(lcd_enable),
        .lcd_bus(lcd_bus),
        .busy(lcd_busy),
        .rw(lcd_rw),
        .rs(lcd_rs),
        .en(lcd_en),
        .lcd_data(db)
    );

    // Task to send strings to the LCD
    task send_strs;
    begin
        if (lcd_enable == 1'b0 && lcd_busy == 1'b0) begin
            lcd_enable <= 1'b1;

            if (cnt_char < 6'd34) begin
                cnt_char <= cnt_char + 6'd1;
			end
            else begin
                cnt_char <= 6'd0;
            end

            case (cnt_char)
	            6'd0  : lcd_bus <= {2'b00, 8'b10000000}; //inst. linha 1
                6'd1  : lcd_bus <= {2'b10, l1[127:120]}; //prim. char da linha 1
                6'd2  : lcd_bus <= {2'b10, l1[119:112]};
                6'd3  : lcd_bus <= {2'b10, l1[111:104]};
                6'd4  : lcd_bus <= {2'b10, l1[103:96]};
                6'd5  : lcd_bus <= {2'b10, l1[95:88]};
                6'd6  : lcd_bus <= {2'b10, l1[87:80]};
                6'd7  : lcd_bus <= {2'b10, l1[79:72]};
                6'd8  : lcd_bus <= {2'b10, l1[71:64]};
                6'd9  : lcd_bus <= {2'b10, l1[63:56]};
	            6'd10 : lcd_bus <= {2'b10, l1[55:48]};
	            6'd11 : lcd_bus <= {2'b10, l1[47:40]};
	            6'd12 : lcd_bus <= {2'b10, l1[39:32]};
	            6'd13 : lcd_bus <= {2'b10, l1[31:24]};
	            6'd14 : lcd_bus <= {2'b10, l1[23:16]};
	            6'd15 : lcd_bus <= {2'b10, l1[15:8]};
	            6'd16 : lcd_bus <= {2'b10, l1[7:0]}; //ult char da linha 
	            6'd17 : lcd_bus <= {2'b00, 8'b11000000}; //inst. linha 
                6'd18 : lcd_bus <= {2'b10, l2[127:120]}; //prim. char da linha 
                6'd19 : lcd_bus <= {2'b10, l2[119:112]};
                6'd20 : lcd_bus <= {2'b10, l2[111:104]};
                6'd21 : lcd_bus <= {2'b10, l2[103:96]};
                6'd22 : lcd_bus <= {2'b10, l2[95:88]};
                6'd23 : lcd_bus <= {2'b10, l2[87:80]};
                6'd24 : lcd_bus <= {2'b10, l2[79:72]};
                6'd25 : lcd_bus <= {2'b10, l2[71:64]};
                6'd26 : lcd_bus <= {2'b10, l2[63:56]};
	            6'd27 : lcd_bus <= {2'b10, l2[55:48]};
	            6'd28 : lcd_bus <= {2'b10, l2[47:40]};
	            6'd29 : lcd_bus <= {2'b10, l2[39:32]};
	            6'd30 : lcd_bus <= {2'b10, l2[31:24]};
	            6'd31 : lcd_bus <= {2'b10, l2[23:16]};
	            6'd32 : lcd_bus <= {2'b10, l2[15:8]};
	            6'd33 : lcd_bus <= {2'b10, l2[7:0]}; //ult. char da linha 2
                default:
                    lcd_enable <= 1'b0; //desabilita o LCD
            endcase
		end
        else begin
            lcd_enable <= 1'b0; // desabilita o LCD
        end
	end
    endtask


    always @(posedge(clk), posedge(rst))
    begin
        if (rst) begin
            cur_state <= MENU;
        end
        else begin
            cur_state <= next_state;
        end
    end

    // Menu option logic
    always @( posedge(key[1]) )
    begin
        if (cur_state == MENU) begin
            cnt_menu <= cnt_menu + 3'd1;

            if (cnt_menu == 3'd3) begin
                cnt_menu <= 3'd0;
            end
        end
    end

    always @(posedge(clk))
    begin
        case (cur_state)
            INIT:
            begin
                cnt_time <= cnt_time + 16'd1;

                if ( cnt_time < 16'd55200*CLK_FREQ && lcd_busy ) begin
                    next_state <= INIT;
                end
                else begin
                    next_state <= MENU;
                    cnt_time <= 16'd0;
                end
            end

            MENU:
            begin
                send_strs;

                case (cnt_menu)
                    LOCK : 
                    begin
                        l1 <= lock_1;
                        l2 <= empty_str;

                        if (key[2]) begin
                            f_pass <= 2'b10;
                            next_state <= BLOCK;
                        end
                        else begin
                            f_pass <= 2'b00;
                            next_state <= MENU;
                        end
                    end

                    N_PASS :
                    begin
                        l1 <= pass_1;
                        l2 <= empty_str;

                        if (key[2]) begin
                            f_pass <= 2'b01;
                            next_state <= NEW_PASS;
                        end
                        else begin
                            f_pass <= 2'b00;
                            next_state <= MENU;
                        end
                    end

                    S_TEMP :
                    begin
                        l1 <= temp_1;
                        l2 <= empty_str;

                        if (key[2]) begin
                            next_state <= TEMP;
                        end
                        else begin
                            next_state <= MENU;
                        end
                    end

                    PLAY :
                    begin
                        l1 <= music_1;
                        l2 <= empty_str;

                        if (key[2]) begin
                            next_state <= PLAYER;
                        end
                        else begin
                            next_state <= MENU;
                        end
                    end
                endcase
            end

            PLAYER:
				next_state <= MENU;
            TEMP:
            begin
                l1 <= scr_temp_1;
                l2 <= {t_data3, t_data2, ".",t_data1, "            "};
                send_strs;

                if (key[4]) next_state <= MENU;
                else next_state <= TEMP;
            end

            NEW_PASS:
            begin
                l1 <= scr_pass_1;
                l2 <= scr_pass_2;
                send_strs;

                if (flag_pass == 2'b01) begin
                    f_pass <= 2'b01;
				    next_state <= NEW_PASS;
                end
                else if (key[4] || flag_pass != 2'b01) begin // If rst button was pressed or the new password was added
                    f_pass <= 2'b00;
                    next_state <= MENU;
                end
            end

            BLOCK:
            begin
                l1 <= scr_lock_1;
                l2 <= scr_lock_2;
                send_strs;

                if (flag_pass == 2'b10) begin
                    f_pass <= 2'b10;
				    next_state <= BLOCK;
                end
                else if (flag_pass != 2'b10) begin
                    f_pass <= 2'b0;
                    next_state <= MENU;
                end
            end

            default: next_state <= INIT;
        endcase
    end
endmodule
