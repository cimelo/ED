module cnt_mod10 (
    input clk,
    input rst,
    input ena,
    input inc,
    output reg [3:0] count
);

    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
        end
        else if (ena) begin
            if (inc && count == 9) begin
                count <= 0;
            end
            if (inc && count < 9) begin
                count <= count + 1;
            end
        end
    end

endmodule
