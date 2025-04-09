/////////////////////////////
//
// Module that handles the
// password logic.
//
/////////////////////////////

module mod_pass
(
    input clk, clk_db,
    input [4:1] key,
    input [2:1] sel, // d7seg selector
    input [2:1] f_pass, // flag to be read from the controller
    output [2:1] cnt_dig,
    output [4:1] dig_show,
    output reg [2:1] flag_pass, // flag to be sent to the controller
    output reg buzz_ena,
    output reg keys_ena
);

    wire tc4;
    wire mode;
	wire we;
    // wire [4:1] dig;
	wire [4:1] dig;
    wire [4:1] dig_s;
    wire [4:1] dig_p;
	wire c4_rst;
	wire ud_rst;
	wire load;
    wire rst_show;
    reg eqn;
    reg prev_tc;

    assign load = !key[3];
	assign c4_rst = tc4 || key[4];
	assign ud_rst = tc4 || key[4];
    assign mode = f_pass[1] || f_pass[2];
	assign we = f_pass == 2'b01;
    assign rst_show = tc4 || key[4];
	
    cnt_mod4 i_c4 (
        .clk(clk_db),
        .inc(key[3]),
        .ena(mode),
        .rst(c4_rst),
        .cnt(cnt_dig),
        .tc(tc4)
    );

    updown_mod10 i_c10 (
        .clk(clk_db),
        .inc(key[1]),
        .dec(key[2]),
        .ena(mode),
        .rst(ud_rst),
        .q(dig)
    );

    ram ram_show
    (
		.clk(clk),
        .addr(cnt_dig),
        .sel(sel),
        .load(load),
        .d(dig),
        .we(1'b1),
        .rst(rst_show),
        .q_ss(dig_show),
        .q_cmp(dig_s)
    );

    ram ram_pass
    (
		.clk(clk),
        .addr(cnt_dig),
        .load(load),
        .d(dig),
        .we(we),
        .rst(1'b0),
        .q_cmp(dig_p)
    );

    reg [2:1] cnt_tries;
     
    initial 
    begin
        cnt_tries = 2'd0;
        eqn = 1'b0;
		keys_ena = 1'b1;
		buzz_ena = 1'b0;
    end

    /*
    // Password State logic
    always @(posedge(clk))
    begin
        if (key[4]) begin // Reset and back to the main menu
            flag_pass <= 2'd0;
            keys_ena <= 1'b1; // unlock all the keys
            buzz_ena <= 1'b0; // turns off the buzz_ena
            eqn <= 1'b0;
        end

        case (f_pass)
            2'd1: 
            begin
                if (!tc4) begin
                    flag_pass <= 2'd1;
                end
                else if (f_pass == 2'd1 && tc4) begin
                    flag_pass <= 2'd0;
                end
            end

            2'd2: 
            begin
                if (cnt_tries == 2'd3) begin // total fail logic
                    keys_ena <= 1'b0; // lock all the keys except reset
                    buzz_ena <= 1'b1;
                    flag_pass <= 2'd2;
                end

                if (key[3]) begin
                    case (cnt_dig)
                        2'd0 : eqn <= eqn || (dig_s[1] != dig_p[1]);
                        2'd1 : eqn <= eqn || (dig_s[2] != dig_p[2]);
                        2'd2 : eqn <= eqn || (dig_s[3] != dig_p[3]);
                        2'd3 : eqn <= eqn || (dig_s[4] != dig_p[4]);
                    endcase
                end

                if (tc4 && eqn) begin
                    cnt_tries <= cnt_tries + 2'd1;
                    flag_pass <= 2'b10;
                    eqn <= 1'b0;
                end
                else if (tc4 && !eqn) begin
                    cnt_tries <= 2'd0;
                    eqn <= 1'b0;
                    flag_pass <= 2'b0;
                end
            end
            default : flag_pass <= 2'd2;
        endcase
   end
   */

    always @(posedge(tc4))
    begin
        prev_tc <= 1'b1;
    end

    always @(posedge(clk))
    begin
        case (f_pass)
            2'd1:
                flag_pass <= 2'd1;
            2'd2:
			begin
                if (cnt_tries < 2'd3) begin
                    flag_pass <= 2'b10;
                    if (key[3]) begin
                        case (cnt_dig)
                            2'd0 : eqn <= eqn || (dig_s[1] != dig_p[1]);
                            2'd1 : eqn <= eqn || (dig_s[2] != dig_p[2]);
                            2'd2 : eqn <= eqn || (dig_s[3] != dig_p[3]);
                            2'd3 : eqn <= eqn || (dig_s[4] != dig_p[4]);
                        endcase
                    end

                    if (tc4 && eqn) begin
                        cnt_tries <= cnt_tries + 2'd1;
                        flag_pass <= 2'b10;
                        eqn <= 1'b0;
                    end
                    else if (tc4 && !eqn) begin
                        cnt_tries <= 2'd0;
                        eqn <= 1'b0;
                        flag_pass <= 2'b0;
                    end
                end
                else begin // total fail logic
                    keys_ena <= 1'b0; // lock all the keys except reset
                    buzz_ena <= 1'b1;
                    flag_pass <= 2'd2;
                end
		    end

            default : flag_pass <= flag_pass;
        endcase
    end

endmodule
