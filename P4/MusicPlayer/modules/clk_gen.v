//////////////////////////////////////////////
//
//  Clock generator used for the debouncer and
//  display of 7 segments.
//
//////////////////////////////////////////////

module clk_gen
(
    input wire clk,
    output reg clk_db,
    output reg clk_d7
);
    localparam HALF_DB = 2_500_000;
    localparam HALF_D7 = 25_000;

    reg [22:1] cnt_db;
    reg [15:1] cnt_d7;

    always @(posedge(clk))
    begin
		cnt_db <= cnt_db + 22'd1;
        
		if (cnt_db == HALF_DB-1) begin
            clk_db <= ~clk_db;
            cnt_db <= 22'd0;
        end
    end

    always @(posedge(clk))
    begin
		cnt_d7 <= cnt_d7 + 15'd1;
        
		if (cnt_d7 == HALF_D7-1) begin
            clk_d7 <= ~clk_d7;
            cnt_d7 <= 15'd0;
        end
    end
endmodule
