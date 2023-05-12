
//`timescale 10ns/1ps

module  convert_freq(
	input clk_in,    // Clock
	output clk_out
);

	wire clk_out_temp_1;
	wire clk_out_temp_2;
	wire clk_out_temp_3;
	wire clk_out_temp_4;
	wire clk_out_temp_5;
	wire clk_out_temp_6;
	wire clk_out_temp_7;
	
	wire clk_in_2;
	wire clk_in_3;
	wire clk_in_4;
	wire clk_in_5;
	wire clk_in_6;
	wire clk_in_7;
	wire clk_in_8;
	
	
	// use 1 block div 5 and 7 block div 10 to convert clk 50Mhz to 1000Hz
	div_by_5 block_1(.clk_in(clk_in), .clk_out(clk_out_temp_1)); // 10M	
	
	assign clk_in_2 = clk_out_temp_1;
	div_by_10 block_2(.clk_in(clk_in_2), .clk_out(clk_out_temp_2)); //1M
	
	assign clk_in_3 = clk_out_temp_2;
	div_by_10 block_3(.clk_in(clk_in_3), .clk_out(clk_out_temp_3)); //100k
	
	assign clk_in_4 = clk_out_temp_3;
	div_by_10 block_4(.clk_in(clk_in_4), .clk_out(clk_out_temp_4)); //10k
	
	assign clk_in_5 = clk_out_temp_4;
	div_by_10 block_5(.clk_in(clk_in_5), .clk_out(clk_out_temp_5)); //1k
	
	assign clk_in_6 = clk_out_temp_5;
	div_by_10 block_6(.clk_in(clk_in_6), .clk_out(clk_out_temp_6));//100
	
	assign clk_in_7 = clk_out_temp_6;
	div_by_10 block_7(.clk_in(clk_in_7), .clk_out(clk_out_temp_7)); //10
	
	assign clk_in_8 = clk_out_temp_7;
	div_by_10 block_8(.clk_in(clk_in_8), .clk_out(clk_out)); //1
	
endmodule
