`timescale 10ns/1ps
module counter_day  (
	input clk_1Hz,    // Clock 1Hz
	input rst_n,  // Asynchronous reset active low
	input inc_day,
	input [5:0] rst_numb_day,
	output reg inc_mon,
	output reg [5:0] out_day 
);	
		
	always @(posedge inc_day  or negedge rst_n) begin
		if(~rst_n) begin
			out_day  <= 1;
			inc_mon <= 0;
		end else begin	
			if (out_day == rst_numb_day) begin
				out_day  <= 1;
				inc_mon <= 1;
			end
			else
			begin 
				out_day  <= out_day  + 1'b1;
				inc_mon <= 0;
			end
		end
	end
endmodule