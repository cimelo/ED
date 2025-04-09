////////////////////////////
//
// Module that converts 4 bits
// BCD into flipped seven
// segments compatible code.
//
////////////////////////////

module bcd2ss 
(
    input [4:1] d,
    input [2:1] sel, // Display selector
    input [2:1] cnt, // Digit counter
    output reg [8:1] q
);

    // Dot logic
    always @(*)
    begin
        if (sel == cnt) begin
            q[8] <= 1'b0;
        end
        else begin
            q[8] <= 1'b1;
        end
    end

    // Flipped d7seg logic
    always @(*)
    begin
        case (d)
            0 : q[7:1] <= 7'b1000000;
            1 : q[7:1] <= 7'b1001111;
            2 : q[7:1] <= 7'b0100100;
            3 : q[7:1] <= 7'b0000110;
            4 : q[7:1] <= 7'b0001011;
            5 : q[7:1] <= 7'b0010010;
            6 : q[7:1] <= 7'b0010000;
            7 : q[7:1] <= 7'b1000111;
            8 : q[7:1] <= 7'b0000000;
            9 : q[7:1] <= 7'b0000010;
            default :
                q[7:1] <= 7'b1000000;
        endcase
    end
endmodule
