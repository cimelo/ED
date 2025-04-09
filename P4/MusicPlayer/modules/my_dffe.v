//////////////////////////////////
//
// Simple dffe
//
//////////////////////////////////

module my_dffe 
(
    input wire clk, d, ena, clrn,
    output reg q
);

    always @(posedge(clk), clrn, ena)
    begin
        if (clrn) begin
            q <= 1'b0;
        end
        else if (ena) begin
            q <= d;
        end
    end
endmodule
