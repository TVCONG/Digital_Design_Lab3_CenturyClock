module counter_hour (
	input clk_1Hz,    // Clock
	input rst_n,  // Asynchronous reset active low
	input inc_hour,
	input [5:0] rst_numb_hour,
	output reg inc_day,
	output reg [5:0] out_hour
);	

	always @(posedge inc_hour or negedge rst_n) begin
		if(~rst_n) begin
			out_hour <= 0;
			inc_day <= 0;
		end else begin
			if (out_hour == rst_numb_hour) begin
				out_hour <= 0;
				inc_day <= 1;
			end
			else
			begin 
				out_hour <= out_hour + 1'b1;
				inc_day <= 0;
			end
		end
	end
endmodule