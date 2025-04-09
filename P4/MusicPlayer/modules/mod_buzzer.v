/////////////////////////////
//
// Module responsible for
// beeping the buzzer when
// the password is wrong 3
// times.
//
/////////////////////////////

module mod_buzzer
(
    input clk, ena,
    output reg buzz
);

    localparam CLK_FREQ  = 50_000_000,
               CLK_2     = CLK_FREQ/2,
               HF_2      = CLK_2/2,
               CLK_1K    = CLK_FREQ/1_000,
               HF_1K     = CLK_1K/2;

    reg [25:1] cnt_2;
    reg [16:1] cnt_1k;
    reg tmp;

    initial tmp = 1'b1;

    always @(posedge(clk)) 
    begin
        if (ena) begin
            cnt_2 <= cnt_2 + 22'd1;

            if (cnt_2 == CLK_2-1) begin
                cnt_2 <= 25'd0;
            end
            else if (cnt_2 < HF_2) begin
                tmp <= 1'b1;
            end
            else begin
                cnt_1k <= cnt_1k + 16'd1;

                if (cnt_1k == CLK_1K-1) begin
                    cnt_1k <= 16'd0;
                end
                else if (cnt_1k < HF_1K) begin
                    tmp <= 1'b0;
                end
                else begin
                    tmp <= 1'b1;
                end
            end

            buzz <= tmp;
        end
    end
endmodule
