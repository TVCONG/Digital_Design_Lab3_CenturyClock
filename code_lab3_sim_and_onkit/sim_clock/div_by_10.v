`timescale 10ns/1ps

module div_by_10(
	input clk_in,
	output clk_out
	);
	wire a;
	div_by_5 div5(.clk_in(clk_in), .clk_out(a));
	div_by_2 div2(.clk_in(a), .clk_out(clk_out));
endmodule