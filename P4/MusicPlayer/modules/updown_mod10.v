/////////////////////////////////
//
// Up/Down counter mod 10
//
/////////////////////////////////

module updown_mod10 
(
    input clk, inc, dec, ena, rst,
    output reg [4:1] q,
    output reg tc
);

    initial
    begin
        q = 4'd0;
    end

    always @(posedge(clk), posedge(rst))
    begin
        if (rst) begin
            q <= 4'd0;
        end
        else if (ena) begin
            if (inc && q == 4'd9) begin
                tc <= 1'b1;
                q <= 0;
            end
            else if (dec && q == 4'd0) begin
                tc <= 1'b1;
                q <= 4'd9;
            end
            else if (inc && q < 4'd10) begin
                tc <= 1'b0;
                q <= q + 4'd1;
            end
            else if (dec && q > 4'd0) begin
                tc <= 1'b0;
                q <= q - 4'd1;
            end
        end
    end
endmodule
