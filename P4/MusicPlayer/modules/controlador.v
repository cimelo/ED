module controlador
(
	output Clk_out = 1'b0,
	output reg Disparo = 1'b0, 
	output reg [27:0] Temp_out,
	output reg [27:0] Freq_out,	
    output reg menu,
	input clk, Duracao,
    input [4:1] key,
    input ena, clk_db
);
    wire Clk_in;
    wire clk_mus;
    reg pause_play;
    reg rst3;
    reg [2:1] cnt3;

    initial
    begin
        pause_play = 1'b1;
        cnt3 = 2'd0;
        rst3 = 2'd0;
        menu = 1'b0;
    end

    always @(posedge(key[2]))
    begin
        pause_play <= ~pause_play;
    end

    assign Clk_in = clk && pause_play && ena;

    assign clk_mus = ((estado == s1) || (estado == s34) || 
						(estado == s58) || key[1] && ena);

    always @(posedge(clk_mus), posedge(rst3))
    begin
        if (rst3) begin
            cnt3 <= 2'd0;
        end
        if (ena) begin
            if (cnt3 == 2'd2) begin
                cnt3 <= 2'd0;
            end
			else cnt3 <= cnt3 + 1;
        end
    end

	//overflow para frequencias
	`define LA3  56819 // (Lá3)
	`define LS3  53649 // (Lá#3)
	`define SI3  50608 // (Si3)
	`define DO3  95603 // (Do3)
	`define RS3  60169 // (Re#3)
	`define MI3  75873 // (Mi3)
	`define MS3  71634 // (Mi#3)
	`define SO3  63776 // (SOL3)
	`define SS3  60169 // (SOL#3)
	`define FA3  71634 // (FA#3)
	`define SB3  53649 // (Si b 3)
	`define RE3  85179 // (RE3)


	`define DO4  47802 //1046Hz (C4 ou Dó4)
	`define RE4  42553 //1175Hz (D4 ou Ré4)
	`define RS4  40193 //1175Hz (D4 ou Ré4)
	`define MI4  37937 //1318Hz (E4 ou Mi4)
	`define FA4  35791 //1397Hz (F4 ou Fá4)
	`define SO4  31290 //1598Hz (G4 ou Sol4)
	
	//overflow para tempos

    // Timing Over the Waves
	`define ov_t11 33_333_335 //0.66..7 s
	`define ov_t12 66_666_670   
	`define ov_t14 133_333_340   
	
    // Timing Over the Rainbow
	`define ov_t21   30_000_000 //0.6 s
	`define ov_t205  15_000_000  //0.3 s
	`define ov_t22   60_000_000   //1.2 s
	`define ov_t24   120_000_000    //2.4 s
    
    // Timing Frere Jacque
	`define ov_t31  25_000_000 //0.5 s
	`define ov_t305 12_500_000 //0.25 s
	`define ov_t32  50_000_000 //1.0 s
	`define ov_t34  200_000_000 //2.0 s

	//FSM Declaração de estados 
	reg [6:0] estado, prox_estado;	
	localparam s0 = 7'd0;

    // Over the Waves
	localparam s1 = 7'd1;
	localparam s2 = 7'd2;
	localparam s3 = 7'd3;
	localparam s4 = 7'd4;
	localparam s5 = 7'd5;
	localparam s6 = 7'd6;
	localparam s7 = 7'd7;
	localparam s8 = 7'd8;
	localparam s9 = 7'd9;
	localparam s10 = 7'd10;
	localparam s11 = 7'd11;
	localparam s12 = 7'd12;
	localparam s13 = 7'd13;
	localparam s14 = 7'd14;
	localparam s15 = 7'd15;
	localparam s16 = 7'd16;
	localparam s17 = 7'd17;
	localparam s18 = 7'd18;
	localparam s19 = 7'd19;
	localparam s20 = 7'd20;
	localparam s21 = 7'd21;
	localparam s22 = 7'd22;
	localparam s23 = 7'd23;
	localparam s24 = 7'd24;
	localparam s25 = 7'd25;
	localparam s26 = 7'd26;
	localparam s27 = 7'd27;
	localparam s28 = 7'd28;
	localparam s29 = 7'd29;
	localparam s30 = 7'd30;
	localparam s31 = 7'd31;
	localparam s32 = 7'd32;
	localparam s33 = 7'd33;

    // Over the Rainbow
	localparam s34 = 7'd34;
	localparam s35 = 7'd35;
	localparam s36 = 7'd36;
	localparam s37 = 7'd37;
	localparam s38 = 7'd38;
	localparam s39 = 7'd39;
	localparam s40 = 7'd40;
	localparam s41 = 7'd41;
	localparam s42 = 7'd42;
	localparam s43 = 7'd43;
	localparam s44 = 7'd44;
	localparam s45 = 7'd45;
	localparam s46 = 7'd46;
	localparam s47 = 7'd47;
	localparam s48 = 7'd48;
	localparam s49 = 7'd49;
	localparam s50 = 7'd50;
	localparam s51 = 7'd51;
	localparam s52 = 7'd52;
	localparam s53 = 7'd53;
	localparam s54 = 7'd54;
	localparam s55 = 7'd55;
	localparam s56 = 7'd56;
	localparam s57 = 7'd57;

    // Frere Jacque
	localparam s58 = 7'd58;
	localparam s59 = 7'd59;
	localparam s60 = 7'd60;
	localparam s61 = 7'd61;
	localparam s62 = 7'd62;
	localparam s63 = 7'd63;
	localparam s64 = 7'd64;
	localparam s65 = 7'd65;
	localparam s66 = 7'd66;
	localparam s67 = 7'd67;
	localparam s68 = 7'd68;
	localparam s69 = 7'd69;
	localparam s70 = 7'd70;
	localparam s71 = 7'd71;
	localparam s72 = 7'd72;
	localparam s73 = 7'd73;
	localparam s74 = 7'd74;
	localparam s75 = 7'd75;
	localparam s76 = 7'd76;
	localparam s77 = 7'd77;
	localparam s78 = 7'd78;
	localparam s79 = 7'd79;
	localparam s80 = 7'd80;
	localparam s81 = 7'd81;
	localparam s82 = 7'd82;
	localparam s83 = 7'd83;
	localparam s84 = 7'd84;
	localparam s85 = 7'd85;
	localparam s86 = 7'd86;
	localparam s87 = 7'd87;
	localparam s88 = 7'd88;
	localparam s89 = 7'd89;
	localparam s90 = 7'd90;
	
	//FSM Lógica para controle do estado atual
	always @ (posedge Clk_in)
	begin : L1
		estado <= prox_estado;
	end
	
	//FSM Lógica para controle do próximo estado
	always @ (posedge Clk_in)//Combinacional 
	begin : L2
        if (key[4]) begin // Go back to the main menu
            prox_estado <= s0;
            rst3 <= 1'b0;
            pause_play <= 1'b0;
            menu <= 1'b1;
        end
        else if (key[1]) begin // Change music
            case (cnt3)
                2'd0 : prox_estado <= s0;
                2'd1 : prox_estado <= s33;
                2'd2 : prox_estado <= s57;
            endcase
        end
        else begin
		    case (estado)
		    	s0:  if (!Duracao) prox_estado <= s1 ;	

                // Over the Waves
                s1:  if (!Duracao) prox_estado <= s2;	
		    	s2:  if (!Duracao) prox_estado <= s3;	
		    	s3:  if (!Duracao) prox_estado <= s4 ;
		    	s4:  if (!Duracao) prox_estado <= s5 ;	
		    	s5:  if (!Duracao) prox_estado <= s6 ;
		    	s6:  if (!Duracao) prox_estado <= s7 ;
		    	s7:  if (!Duracao) prox_estado <= s8 ;
		    	s8:  if (!Duracao) prox_estado <= s9 ;
		    	s9:  if (!Duracao) prox_estado <= s10;
		    	s10: if (!Duracao) prox_estado <= s11;
		    	s11: if (!Duracao) prox_estado <= s12;
		    	s12: if (!Duracao) prox_estado <= s13;
		    	s13: if (!Duracao) prox_estado <= s14;
		    	s14: if (!Duracao) prox_estado <= s15;
		    	s15: if (!Duracao) prox_estado <= s16;
		    	s16: if (!Duracao) prox_estado <= s17;
		    	s17: if (!Duracao) prox_estado <= s18;
		    	s18: if (!Duracao) prox_estado <= s19;
		    	s19: if (!Duracao) prox_estado <= s20;
		    	s20: if (!Duracao) prox_estado <= s21;
		    	s21: if (!Duracao) prox_estado <= s22;
		    	s22: if (!Duracao) prox_estado <= s23;
		    	s23: if (!Duracao) prox_estado <= s24;
		    	s24: if (!Duracao) prox_estado <= s25;
		    	s25: if (!Duracao) prox_estado <= s26;
		    	s26: if (!Duracao) prox_estado <= s27;
		    	s27: if (!Duracao) prox_estado <= s28;
		    	s28: if (!Duracao) prox_estado <= s29;
		    	s29: if (!Duracao) prox_estado <= s30;
		    	s30: if (!Duracao) prox_estado <= s31;
		    	s31: if (!Duracao) prox_estado <= s32;
		    	s32: if (!Duracao) prox_estado <= s33;
		    	s33: if (!Duracao) prox_estado <= s34;

                // Over the Rainbow
		    	s34: if (!Duracao) prox_estado <= s35;	
		    	s35: if (!Duracao) prox_estado <= s36;	
		    	s36: if (!Duracao) prox_estado <= s37;
		    	s37: if (!Duracao) prox_estado <= s38;
		    	s38: if (!Duracao) prox_estado <= s39;
		    	s39: if (!Duracao) prox_estado <= s40;
		    	s40: if (!Duracao) prox_estado <= s41;
		    	s41: if (!Duracao) prox_estado <= s42;
		    	s42: if (!Duracao) prox_estado <= s43;
		    	s43: if (!Duracao) prox_estado <= s44;
		    	s44: if (!Duracao) prox_estado <= s45;
		    	s45: if (!Duracao) prox_estado <= s46;
		    	s46: if (!Duracao) prox_estado <= s47;
		    	s47: if (!Duracao) prox_estado <= s48;
		    	s48: if (!Duracao) prox_estado <= s49;
		    	s49: if (!Duracao) prox_estado <= s50;
		    	s50: if (!Duracao) prox_estado <= s51;
		    	s51: if (!Duracao) prox_estado <= s52;
		    	s52: if (!Duracao) prox_estado <= s53;
		    	s53: if (!Duracao) prox_estado <= s54;
		    	s54: if (!Duracao) prox_estado <= s55;
		    	s55: if (!Duracao) prox_estado <= s56;
		    	s56: if (!Duracao) prox_estado <= s57;
		    	s57: if (!Duracao) prox_estado <= s58;

                // Frere Jacque
		    	s58: if (!Duracao) prox_estado <= s59;	
		    	s59: if (!Duracao) prox_estado <= s60;	
		    	s60: if (!Duracao) prox_estado <= s61;
		    	s61: if (!Duracao) prox_estado <= s62;
		    	s62: if (!Duracao) prox_estado <= s63;
		    	s63: if (!Duracao) prox_estado <= s64;
		    	s64: if (!Duracao) prox_estado <= s65;
		    	s65: if (!Duracao) prox_estado <= s66;
		    	s66: if (!Duracao) prox_estado <= s67;
		    	s67: if (!Duracao) prox_estado <= s68;
		    	s68: if (!Duracao) prox_estado <= s69;
		    	s69: if (!Duracao) prox_estado <= s70;
		    	s70: if (!Duracao) prox_estado <= s71;
		    	s71: if (!Duracao) prox_estado <= s72;
		    	s72: if (!Duracao) prox_estado <= s73;
		    	s73: if (!Duracao) prox_estado <= s74;
		    	s74: if (!Duracao) prox_estado <= s75;
		    	s75: if (!Duracao) prox_estado <= s76;
		    	s76: if (!Duracao) prox_estado <= s77;
		    	s77: if (!Duracao) prox_estado <= s78;
		    	s78: if (!Duracao) prox_estado <= s79;
		    	s79: if (!Duracao) prox_estado <= s80;
		    	s80: if (!Duracao) prox_estado <= s81;
		    	s81: if (!Duracao) prox_estado <= s82;
		    	s82: if (!Duracao) prox_estado <= s83;
		    	s83: if (!Duracao) prox_estado <= s84;
		    	s84: if (!Duracao) prox_estado <= s85;
		    	s85: if (!Duracao) prox_estado <= s86;
		    	s86: if (!Duracao) prox_estado <= s87;
		    	s87: if (!Duracao) prox_estado <= s88;
		    	s88: if (!Duracao) prox_estado <= s89;
		    	s89: if (!Duracao) prox_estado <= s90;
		    	s90: if (!Duracao) prox_estado <= s1;
		    	default: prox_estado <= s0; 
		    endcase
        end
	end	
	
	//FSM Lógica para controle das saídas
	always @ (estado)//Combinacional 
	begin : L3
		case (estado) //s0 apenas inicia a prox nota
			s0: nota(0,`ov_t12);  //freq atual, dur prox		

            // Over the Waves
			s1:  nota(`MI3,`ov_t11);//freq atual, dur prox
			s2:  nota(`MI3,`ov_t11);//freq atual, dur prox
			s3:  nota(`RS3,`ov_t11);//freq atual, dur prox		
			s4:  nota(`MI3,`ov_t11);//freq atual, dur prox		
			s5:  nota(`SO3,`ov_t12);//freq atual, dur prox		
			s6:  nota(`DO4,`ov_t12);//freq atual, dur prox		
			s7:  nota(`DO4,`ov_t11);//freq atual, dur prox		
			s8:  nota(`SI3,`ov_t11);//freq atual, dur prox		
			s9:  nota(`DO4,`ov_t11);//freq atual, dur prox		
			s10: nota(`RE4,`ov_t11);//freq atual, dur prox		
			s11: nota(`DO4,`ov_t11);//freq atual, dur prox		
			s12: nota(`SI3,`ov_t11);//freq atual, dur prox		
			s13: nota(`DO4,`ov_t11);//freq atual, dur prox		
			s14: nota(`MI3,`ov_t11);//freq atual, dur prox		
			s15: nota(`SO3,`ov_t14);//freq atual, dur prox		
			s16: nota(`SI3,`ov_t12);//freq atual, dur prox		
			s17: nota(`SI3,`ov_t12);//freq atual, dur prox		
			s18: nota(`FA3,`ov_t11);//freq atual, dur prox		
			s19: nota(`FA3,`ov_t11);//freq atual, dur prox		
			s20: nota(`MI3,`ov_t11);//freq atual, dur prox		
			s21: nota(`FA3,`ov_t11);//freq atual, dur prox		
			s22: nota(`SO3,`ov_t14);//freq atual, dur prox		
			s23: nota(`SI3,`ov_t11);//freq atual, dur prox		
			s24: nota(`LS3,`ov_t11);//freq atual, dur prox		
			s25: nota(`SI3,`ov_t11);//freq atual, dur prox		
			s26: nota(`DO4,`ov_t11);//freq atual, dur prox		
			s27: nota(`SI3,`ov_t11);//freq atual, dur prox		
			s28: nota(`LS3,`ov_t11);//freq atual, dur prox		
			s29: nota(`SI3,`ov_t11);//freq atual, dur prox		
			s30: nota(`FA3,`ov_t11);//freq atual, dur prox		
			s31: nota(`SI3,`ov_t14);//freq atual, dur prox		
			s32: nota(`SO3,`ov_t12);//freq atual, dur prox		
			s33: nota(0,  `ov_t12);//freq atual, dur prox		

            // Over the Rainbow
			s34: nota(`FA3,`ov_t22);//freq atual, dur prox
			s35: nota(`FA4,`ov_t21);//freq atual, dur prox		
			s36: nota(`MI4,`ov_t205);//freq atual, dur prox		
			s37: nota(`DO4,`ov_t205);//freq atual, dur prox		
			s38: nota(`RE4,`ov_t21);//freq atual, dur prox		
			s39: nota(`MI4,`ov_t21);//freq atual, dur prox		
			s40: nota(`FA4,`ov_t22);//freq atual, dur prox		
			s41: nota(`FA3,`ov_t22);//freq atual, dur prox		
			s42: nota(`RE4,`ov_t24);//freq atual, dur prox		
			s43: nota(`DO4,`ov_t22);//freq atual, dur prox		
			s44: nota(`RE3,`ov_t22);//freq atual, dur prox		
			s45: nota(`SB3,`ov_t21);//freq atual, dur prox		
			s46: nota(`LA3,`ov_t205);//freq atual, dur prox		
			s47: nota(`FA3,`ov_t205);//freq atual, dur prox		
			s48: nota(`SO3,`ov_t21);//freq atual, dur prox		
			s49: nota(`LA3,`ov_t21);//freq atual, dur prox		
			s50: nota(`SB3,`ov_t21);//freq atual, dur prox		
			s51: nota(`SO3,`ov_t205);//freq atual, dur prox		
			s52: nota(`MI3,`ov_t205);//freq atual, dur prox		
			s53: nota(`FA3,`ov_t21);//freq atual, dur prox		
			s54: nota(`SO3,`ov_t21);//freq atual, dur prox		
			s55: nota(`LA3,`ov_t24);//freq atual, dur prox		
			s56: nota(`FA3,`ov_t24);//freq atual, dur prox		
			s57: nota(0,  `ov_t31);//freq atual, dur prox		

            // Frere Jacque
            s58: nota(`FA3,  `ov_t31);//freq atual, dur prox		
			s59: nota(`SO3,  `ov_t31);//freq atual, dur prox		
			s60: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s61: nota(`FA3,  `ov_t31);//freq atual, dur prox		
			s62: nota(`FA3,  `ov_t31);//freq atual, dur prox		
			s63: nota(`SO3,  `ov_t31);//freq atual, dur prox		
			s64: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s65: nota(`FA3,  `ov_t31);//freq atual, dur prox		
			s66: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s67: nota(`SB3,  `ov_t32);//freq atual, dur prox		
			s68: nota(`DO4,  `ov_t31);//freq atual, dur prox		
			s69: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s70: nota(`SB3,  `ov_t32);//freq atual, dur prox		
			s71: nota(`DO4,  `ov_t305);//freq atual, dur prox		
			s72: nota(`DO4,  `ov_t305);//freq atual, dur prox		
			s73: nota(`RE4,  `ov_t305);//freq atual, dur prox		
			s74: nota(`DO4,  `ov_t305);//freq atual, dur prox		
			s75: nota(`SB3,  `ov_t31);//freq atual, dur prox		
			s76: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s77: nota(`FA3,  `ov_t305);//freq atual, dur prox		
			s78: nota(`DO4,  `ov_t305);//freq atual, dur prox		
			s79: nota(`RE4,  `ov_t305);//freq atual, dur prox		
			s80: nota(`DO4,  `ov_t305);//freq atual, dur prox		
			s81: nota(`SB3,  `ov_t31);//freq atual, dur prox		
			s82: nota(`LA3,  `ov_t31);//freq atual, dur prox		
			s83: nota(`FA3,  `ov_t31);//freq atual, dur prox		
			s84: nota(`SO4,  `ov_t31);//freq atual, dur prox		
			s85: nota(`DO4,  `ov_t32);//freq atual, dur prox		
			s86: nota(`FA4,  `ov_t31);//freq atual, dur prox		
			s87: nota(`SO4,  `ov_t31);//freq atual, dur prox		
			s88: nota(`DO4,  `ov_t32);//freq atual, dur prox		
			s89: nota(`FA4,  `ov_t34);//freq atual, dur prox		
			s90: nota(0,    `ov_t31);//freq atual, dur prox		
		endcase
	end
	
	//Atribuição contínua
	assign Clk_out = Duracao & Clk_in;	
	
	//Tarefa para atribuição de saídas nos estados
	task nota( input [27:0] ov_f, ov_t);
	begin
		Temp_out = ov_t; //define a duração	proxima nota			
		Freq_out = ov_f; //define a frequência nota atual
		Disparo = 1'b1;  //dispara o temp a próxima nota		
	end
	endtask
	
endmodule		
		
