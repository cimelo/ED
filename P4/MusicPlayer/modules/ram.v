/////////////////////////////
//
// Simple RAM module with
// write enable.
//
/////////////////////////////

module ram
(
	input we, rst, clk, load,
    input [2:1] addr,
    input [2:1] sel,
    input [4:1] d,
    output reg [4:1] q_ss,
    output reg [4:1] q_cmp
);
    reg [4:1] ram [4:1];

    always @(posedge(clk))
    begin
        if (rst) begin
            ram[1] <= 4'd0;
            ram[2] <= 4'd0;
            ram[3] <= 4'd0;
            ram[4] <= 4'd0;
        end
        if (we && load) begin
            case (addr)
                2'd0 : ram[1] <= d;
                2'd1 : ram[2] <= d;
                2'd2 : ram[3] <= d;
                2'd3 : ram[4] <= d;
            endcase
        end
    end

    always @(*)
    begin
        case (sel)
            2'd0 : q_ss <= ram[1];
            2'd1 : q_ss <= ram[2];
            2'd2 : q_ss <= ram[3];
            2'd3 : q_ss <= ram[4];
        endcase
        case (addr)
            2'd0 : q_cmp <= ram[1];
            2'd1 : q_cmp <= ram[2];
            2'd2 : q_cmp <= ram[3];
            2'd3 : q_cmp <= ram[4];
        endcase
    end
endmodule
