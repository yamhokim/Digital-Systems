// Lab 4 Part 2 Verilog

module D_flip_flop(input logic clk, 
			input logic reset, 
			input logic [7:0] d, 
			output logic [7:0] q);
	always_ff @(posedge clk)
	begin
		if (reset_b) q <= 0;
		else q <= d;
	end
endmodule

module part2(Clock, Reset_b, Data, Function, ALUout);
	input logic Clock;
	input logic Reset_b;
	input logic [3:0] Data;
	input logic [1:0] Function;
	output logic [7:0] ALUout;

	logic [7:0] d_temp;

	D_flip_flop u0 (.clk(Clock), .reset_b(Reset_b), .d(d_temp), .q(ALUout));

	always_comb
	begin
		case(Function)
		2'b00: d_temp = Data[3:0] + ALUout[3:0];
		2'b01: d_temp = Data[3:0] * ALUout[3:0];
		2'b10: d_temp = ALUout[3:0] << Data[3:0];
		default: d_temp = ALUout[7:0];
		endcase
	end
endmodule



