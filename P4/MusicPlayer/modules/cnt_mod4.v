module cnt_mod4 (
    input clk, rst, ena, inc,
    output reg [2:1] cnt,
    output reg tc
);

    reg [3:1] count;
    reg aux;

    initial begin
        count = 3'd0;
        aux = 1'b0;
    end

    always @(posedge(clk)) begin
        if (rst) begin
            count <= 3'd0;
            aux <= 1'd0;
        end
        else if (ena) begin
            if (count == 3'd4) begin
                count <= 3'd0;
                aux <= 1'b1;
            end
            else if (inc) begin
                count <= count + 3'd1;
                aux <= 1'd0;
            end
            else begin
                count <= count;
                aux <= aux;
            end
        end

		tc <= aux;
        cnt <= count[2:1];
    end

endmodule
