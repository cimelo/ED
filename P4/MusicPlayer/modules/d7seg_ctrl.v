/////////////////////////////
//
// Module responsible for
// blinking the every digit
// of the d7seg at a rate of
// 10 kHz and to decode these
// into 4 bits.
//
/////////////////////////////

module d7seg_ctrl
(
    input clk,
    output [2:1] sel,
    output reg [4:1] dec // Decoded digit to be lighted up.
);
    
    wire [2:1] aux;
    reg [4:1] aux_dec;
    wire tc;

    cnt_mod4 ic4 
    (
        .clk(clk),
        .inc(1'b1),
        .ena(1'b1),
        .rst(tc),
        .cnt(aux),
        .tc(tc)
    );

    assign sel = aux;

    always @(aux)
    begin
        case (aux)
            2'd0 : aux_dec = 4'b1110;
            2'd1 : aux_dec = 4'b1101;
            2'd2 : aux_dec = 4'b1011;
            2'd3 : aux_dec = 4'b0111;
			default:
				aux_dec = 4'b1110;
        endcase

        dec = aux_dec;
    end
endmodule
