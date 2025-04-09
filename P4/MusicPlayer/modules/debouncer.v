/////////////////////////////////
//
// Module responsible for sending
// a pulse of necessary width as
// the resut of a switch debounce
//
/////////////////////////////////

module debouncer 
(
    input wire clk, k, ena, rst,
    output p_db
);
    
    wire q1, q2;

    dffe d1 (
        .d(!k),
        .clk(clk),
        .clrn(!rst),
		.prn(1'b1),
        .ena(ena),
        .q(q1)
    );

    dffe d2 (
        .d(q1),
        .clk(clk),
        .clrn(!rst),
		.prn(1'b1),
        .ena(ena),
        .q(q2)
    );

    assign p_db = q1 && !q2;
endmodule
