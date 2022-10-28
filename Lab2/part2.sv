module v7404(pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
	input logic pin1;
	input logic pin3;
	input logic pin5;
	input logic pin9;
	input logic pin11;
	input logic pin13;
	
	output logic pin2;
	output logic pin4;
	output logic pin6;
	output logic pin8;
	output logic pin10;
	output logic pin12;
	
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
endmodule


module v7408(pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
	input logic pin1;
	input logic pin2;
	input logic pin4;
	input logic pin5;
	input logic pin9;
	input logic pin10;
	input logic pin12;
	input logic pin13;
	
	output logic pin3;
	output logic pin6;
	output logic pin8;
	output logic pin11;
	
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11 = pin12 & pin13;
endmodule

module v7432(pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
	input logic pin1;
	input logic pin2;
	input logic pin4;
	input logic pin5;
	input logic pin9;
	input logic pin10;
	input logic pin12;
	input logic pin13;
	
	output logic pin3;
	output logic pin6;
	output logic pin8;
	output logic pin11;
	
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin9 | pin10;
	assign pin11 = pin12 | pin13;
endmodule

module mux2to1(x, y, s, m);
	input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
	
	logic connection1;
	logic connection2;
	logic connection3;
	//assign m = s & y | ~s & x;
    // OR
	v7408 AND1(
		.pin1(x),
		.pin2(connection1), // connecton1 is the notted s
		.pin3(connection2) // connection2 is the output of the AND
		);
	
	v7408 AND2( 
		.pin4(s),
		.pin5(y),
		.pin6(connection3) // connection 3 is the output of the bottom AND
		);
	v7404 NOT(
		.pin1(s),
		.pin2(connection1)
		);
		
	v7432 OR(
		.pin1(connection2),
		.pin2(connection3),
		.pin3(m)
		);
endmodule










