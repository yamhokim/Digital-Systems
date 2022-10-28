`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

module mux(LEDR, SW);
    input logic [9:0] SW;
    output logic [9:0] LEDR;

    mux2to1 u0(
        .x(SW[0]),
        .y(SW[1]),
        .s(SW[9]),
        .m(LEDR[0])
        );
endmodule

module mux2to1(x, y, s, m);
    input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
    logic connection1, connection2, connection3;
	v7404 not1(.pin1(s), .pin2(connection1));
	v7408 and1(.pin1(x), .pin2(connection1), .pin3(connection2));
	v7408 and2(.pin4(y), .pin5(s), .pin6(connection3));
	v7432 or1(.pin1(connection2), .pin2(connection3), .pin3(m));

endmodule

module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, 
			  pin2, pin4, pin6, pin8, pin10, pin12);
	input logic pin1, pin3, pin5, pin9, pin11, pin13;
	output logic pin2, pin4, pin6, pin8, pin10, pin12;
	
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
	
endmodule


module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, 
			  pin2, pin4, pin6, pin8, pin10, pin12);
	
	input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output logic pin3, pin6, pin8, pin11;
	
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11 = pin12 & pin13;

endmodule

module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, 
			  pin2, pin4, pin6, pin8, pin10, pin12);
	
	input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output logic pin3, pin6, pin8, pin11;
	
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin9 | pin10;
	assign pin11 = pin12 | pin13;

endmodule

module hex_decoder(c, display);
	input logic c[3:0];
	output logic display[6:0];
	
	assign display[0] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (c[3]&~c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&c[0]);
	assign display[1] = (~c[3]&c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&~c[0]) | (c[3]&~c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&~c[0]) | (c[3]&c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[2] = (~c[3]&~c[2]&c[1]&~c[0]) | (c[3]&c[2]&~c[1]&~c[0]) | (c[3]&c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[3] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&~c[2]&~c[1]&c[0]) | (c[3]&~c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[4] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&~c[2]&c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (~c[3]&c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&~c[2]&~c[1]&c[0]);
	assign display[5] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&~c[2]&c[1]&~c[0]) | (~c[3]&~c[2]&c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&c[0]);
	assign display[6] = (~c[3]&~c[2]&~c[1]&~c[0]) | (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]);

endmodule