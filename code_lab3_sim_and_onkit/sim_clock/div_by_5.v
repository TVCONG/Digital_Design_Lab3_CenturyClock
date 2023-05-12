`timescale 10ns/1ps

module div_by_5(
	input clk_in,
	output clk_out
	);
	
	reg q0, q1, q2, q3;
	wire d0, d1, d2;

	initial
	begin
		q0 = 0;
		q1 = 0;
		q2 = 0;
		//clk_out = 1;
	end
	assign not_q0 = ~q0;
	assign not_q1 = ~q1;
	assign not_q2 = ~q2;
		
	assign d2 = q1 & q0;
	assign d1 = q1 ^ q0;
	assign d0 = not_q2 & not_q0;	

	always @(posedge clk_in) begin
		q2 <= d2;
		q1 <= d1;
		q0 <= d0;
	end
	always @(negedge clk_in) begin
		q3 <= q1;
	end
	assign clk_out = q3 | q1;

endmodule
