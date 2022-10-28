`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

module hex(HEX0, SW);
    input logic [9:0] SW;
    output logic [6:0] HEX0;

    hex_decoder u0(
        .c(SW[3:0]),
        .display(HEX0[6:0])
        );
endmodule

module hex_decoder(c, display);
	input logic [3:0] c;
	output logic [6:0] display;
	
	assign display[0] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (c[3]&~c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&c[0]);
	assign display[1] = (~c[3]&c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&~c[0]) | (c[3]&~c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&~c[0]) | (c[3]&c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[2] = (~c[3]&~c[2]&c[1]&~c[0]) | (c[3]&c[2]&~c[1]&~c[0]) | (c[3]&c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[3] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&~c[2]&~c[1]&c[0]) | (c[3]&~c[2]&c[1]&~c[0]) | (c[3]&c[2]&c[1]&c[0]);
	assign display[4] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&~c[2]&c[1]&c[0]) | (~c[3]&c[2]&~c[1]&~c[0]) | (~c[3]&c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&~c[2]&~c[1]&c[0]);
	assign display[5] = (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&~c[2]&c[1]&~c[0]) | (~c[3]&~c[2]&c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&c[0]);
	assign display[6] = (~c[3]&~c[2]&~c[1]&~c[0]) | (~c[3]&~c[2]&~c[1]&c[0]) | (~c[3]&c[2]&c[1]&c[0]) | (c[3]&c[2]&~c[1]&~c[0]);

endmodule