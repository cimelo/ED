/////////////////////////////////////////
//
// Module responsible for the readings of  
// the LM75A temperature sensor.
//
/////////////////////////////////////////

module mod_temp
(
    input [15:0] data,
    output reg [8:1] t_data1,
    output reg [8:1] t_data2,
    output reg [8:1] t_data3
);

    reg [7:1] aux;

    // Formating the data coming from the I2C module
    // into a ASCII string of 4 chars. where the msb
    // is the signal and lsb is the decimal part.
    always @(*)
    begin
        //if (data[15]) begin // If read data is negative null the reading
        //    t_data1 = "0";
        //    aux = 7'b0;
		//	t_data2 = "0";
        //    t_data3 = "0";
        //end
        //else begin
            t_data1 <= (data[7]) ? "5" : "0";

            // removing the hundreds and decimal parts from the units, where
            // 0011 is added for ascii compatibility.
            if      (data[14:8] >= 7'd10  && data[14:8] < 7'd20)   aux = (data[14:8] - 7'd10 );
			else if	(data[14:8] >= 7'd20  && data[14:8] < 7'd30)   aux = (data[14:8] - 7'd20 );
			else if	(data[14:8] >= 7'd30  && data[15:8] < 7'd40)   aux = (data[14:8] - 7'd30 );
			else if	(data[14:8] >= 7'd40  && data[15:8] < 7'd50)   aux = (data[14:8] - 7'd40 );
			else if	(data[14:8] >= 7'd50  && data[15:8] < 7'd60)   aux = (data[14:8] - 7'd50 );
			else if	(data[14:8] >= 7'd60  && data[15:8] < 7'd70)   aux = (data[14:8] - 7'd60 );
			else if	(data[14:8] >= 7'd70  && data[15:8] < 7'd80)   aux = (data[14:8] - 7'd70 );
			else if	(data[14:8] >= 7'd80  && data[15:8] < 7'd90)   aux = (data[14:8] - 7'd80 );
			else if	(data[14:8] >= 7'd90  && data[15:8] < 7'd100)  aux = (data[14:8] - 7'd90 );
			else if	(data[14:8] >= 7'd100 && data[15:8] < 7'd110)  aux = (data[14:8] - 7'd100);
			else if	(data[14:8] >= 7'd110 && data[15:8] < 7'd120)  aux = (data[14:8] - 7'd110);
			else if	(data[14:8] >= 7'd120)                         aux = (data[14:8] - 7'd120);
			else                                                   aux =  data[11:8]; //apenas unidade

            t_data2 = {4'b0011, aux[4:1]};

            // Decimal digit treatment
            if      (data[14:8] >= 7'd10  && data[14:8] <  7'd20)   t_data3 = {4'b0011, 4'h1};
		    else if	(data[14:8] >= 7'd20  && data[14:8] <  7'd30)   t_data3 = {4'b0011, 4'h2};
		    else if	(data[14:8] >= 7'd30  && data[14:8] <  7'd40)   t_data3 = {4'b0011, 4'h3};
		    else if	(data[14:8] >= 7'd40  && data[14:8] <  7'd50)   t_data3 = {4'b0011, 4'h4};
		    else if	(data[14:8] >= 7'd50  && data[14:8] <  7'd60)   t_data3 = {4'b0011, 4'h5};
		    else if	(data[14:8] >= 7'd60  && data[14:8] <  7'd70)   t_data3 = {4'b0011, 4'h6};
		    else if	(data[14:8] >= 7'd70  && data[14:8] <  7'd80)   t_data3 = {4'b0011, 4'h7};
		    else if	(data[14:8] >= 7'd80  && data[14:8] <  7'd90)   t_data3 = {4'b0011, 4'h8};
		    else if	(data[14:8] >= 7'd90  && data[14:8] <  7'd100)  t_data3 = {4'b0011, 4'h9};
		    else if	(data[14:8] >= 7'd110 && data[14:8] < 7'd120)   t_data3 = {4'b0011, 4'h1};
		    else if	(data[14:8] >= 7'd120)                          t_data3 = {4'b0011, 4'h2};
		    else                                                    t_data3 = {4'b0011, 4'b0}; //dezena zero	
        //end
    end
endmodule
