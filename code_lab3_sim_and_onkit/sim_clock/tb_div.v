`timescale 10ns/1ps

module tb_div();
	reg clk_in;
	wire clk_out_div2;
	wire clk_out_div5;
	wire clk_out_div10;

	//conv_freq cf(.clk_in(clk_in), .clk_out(clk_out));
	div_by_2 div_2(.clk_in(clk_in), .clk_out(clk_out_div2));
	div_by_5 div_5(.clk_in(clk_in), .clk_out(clk_out_div5));
	div_by_10 div_10(.clk_in(clk_in), .clk_out(clk_out_div10));
	initial
	begin
		clk_in = 1;
		//clk_out = 1;
	end
	always #1 clk_in = ~clk_in;
	
endmodule

