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

module part2(A,B,Function,ALUout);
	input logic [3:0] A;
	input logic [3:0] B;
	input logic [1:0] Function;
	output logic [7:0] ALUout;
	
	logic [3:0] carry;
	logic [3:0] s_temp;
	
	part1 P1 (.a(A),.b(B),.c_in(0),.s(s_temp[3:0]),.c_out(carry[3:0]));
	
	always_comb
	begin
		case(Function)
		2'b00: ALUout = {3'b000, carry[3], s_temp[3:0]};
		2'b01: ALUout = |{A,B}; // Alternate form is (|A) | (|B)
		2'b10: ALUout = &{A,B}; // ALternate form is (&A) & (&A)
		2'b11: ALUout = {A,B};
		default: ALUout = 0;
		endcase
	end
endmodule

module part3(A,B,Function,ALUout);
	parameter N = 4;
	input logic [N-1:0] A;
	input logic [N-1:0] B;
	input logic [1:0] Function;
	output logic [2*N-1:0] ALUout;
	
	always_comb
	begin
		case(Function)
		2'b00: ALUout = A + B;
		2'b01: ALUout = |{A,B}; // Alternate form is (|A) | (|B)
		2'b10: ALUout = &{A,B}; // ALternate form is (&A) & (&A)
		2'b11: ALUout = {A,B};
		default: ALUout = 0;
		endcase
	end
endmodule
