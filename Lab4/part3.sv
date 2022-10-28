module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
	input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
	input logic [3:0] Data_IN;
	output logic [3:0] Q;
	
	// Four Cases
	subcircuit bit0 (Q[3], Q[1], RotateRight, Data_IN[0], ParallelLoadn, clock, reset, Q[0]);
	subcircuit bit1 (Q[0], Q[2], RotateRight, Data_IN[1], ParallelLoadn, clock, reset, Q[1]);
	subcircuit bit2 (Q[1], Q[3], RotateRight, Data_IN[2], ParallelLoadn, clock, reset, Q[2]);
	subcircuit bit3 (Q[2], Q[0], RotateRight, Data_IN[3], ParallelLoadn, clock, reset, Q[3]);
endmodule

module register(input logic clk, input logic reset, input logic d, output logic q);
	always_ff @(posedge clk)
	begin
		if (reset_b) q <= 0;
		else q <= d;
	end
endmodule

module mux2to1(input logic x, input logic y, input logic s, output logic f);
	assign f = (~s & x) | (s & y);
endmodule

module subcircuit(input logic right, 
	      input logic left, 
	      input logic Loadleft, 
	      input logic D, 
	      input logic loadn, 
	      input logic clock, 
	      input logic reset, 
	      output logic Q
	);
	// check the value of parallelload, rotateright, asright, and rotate to determine the type of rotate that must occur.
	logic temp_out1, temp_out2;
	
	mux2to1 u0 (.x(right), .y(left), .s(Loadleft), .f(tempout));
	mux2to1 u1 (.x(D), .y(tempout), .s(loadn), .f(tempout2));
	register(.clk(clock), .reset(reset), .d(tempout2), .q(Q));
endmodule 

