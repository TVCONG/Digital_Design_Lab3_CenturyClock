

//`timescale 10ns/1ps
module counter_min (
	input clk_1Hz,    // Clock 1Hz
	input rst_n,  // Asynchronous reset active low
	input inc_min,
	input [5:0] rst_numb_min,
	output reg inc_hour,
	output reg [5:0] out_min
);	

	always @(posedge inc_min or negedge rst_n) begin
		if(~rst_n) begin
			out_min <= 0;
			inc_hour <= 0;
		end else begin
			if (out_min == rst_numb_min) begin
				out_min <= 0;
				inc_hour <= 1;
			end
			else
			begin 
				out_min <= out_min + 1'b1;
				inc_hour <= 0;
			end
		end
	end
endmodule