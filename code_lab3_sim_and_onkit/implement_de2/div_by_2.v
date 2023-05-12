

`timescale 10ns/1ps

module div_by_2(
	input clk_in,
	output reg clk_out
	);
	
	initial 
	begin
		clk_out = 1; 
	end
	always @(posedge clk_in) begin
		clk_out <= ~clk_out;
	end
endmodule