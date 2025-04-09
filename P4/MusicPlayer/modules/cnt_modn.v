module cnt_modn 
#(parameter N = 10)
(
    input clk, inc, dec, ena, rst,
    output reg [$clog2(N):1] q,
    output reg cout
);

    always @(posedge(clk))
    begin
        if (rst) begin
            q <= 0;
            cout <= 1'b0;
        end
        else if (ena) begin
            if (inc && q == N-1) begin
                q <= 0;
                cout <= 1'b1;
            end
            else if (dec && q == 0) begin
                q <= N - 1;
                cout <= 1'b1;
            end
            if (inc && q < N) begin
                q <= q + 1;
                cout <= 1'b0;
            end
            if (dec && q > 0) begin
                q <= q - 1;
                cout <= 1'b0;
            end
        end

        cout <= cout;
        q <= q;
    end
endmodule
