module counter_year  (
	input clk_1Hz,    // Clock
	input rst_n,  // Asynchronous reset active low
	input inc_year,

	output reg [5:0] out_year 
);	
	always @(posedge inc_year  or negedge rst_n) begin
		if(~rst_n) begin
			out_year  <= 0;
		end else begin
			out_year  <= out_year  + 1'b1;
		end
	end
endmodule
