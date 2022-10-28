module FA(a,b,c_in,s, c_out);
	input logic a,b,c_in;
	output logic s,c_out;
	assign s = a^b^c_in;
	assign c_out = (a&b) | (a&c_in) | (b&c_in);
endmodule

module part1(a,b,c_in,s,c_out);
	input logic [3:0] a;
	input logic [3:0] b;
	input logic c_in;
	output logic [3:0] s;
	output logic [3:0] c_out;
	logic c1, c2, c3, c4;
	
	FA U0(a[0],b[0],c_in,s[0],c1);
	FA U1(a[1],b[1],c1,s[1],c2);
	FA U2(a[2],b[2],c2,s[2],c3);
	FA U3(a[3],b[3],c3,s[3],c4);
	
	assign c_out[0] = c1;
	assign c_out[1] = c2;
	assign c_out[2] = c3;
	assign c_out[3] = c4;
endmodule

module tester(LEDR, SW);
    input logic [9:0] SW;
    output logic [9:0] LEDR;

    part1 u0(
	.a(SW[3:0]),
	.b(SW[7:4]),
	.c_in(SW[8]),
	.s(LEDR[3:0]),
	.c_out(LEDR[7:4])
        );
endmodule
