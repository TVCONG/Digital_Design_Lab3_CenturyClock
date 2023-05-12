/*
module counter_day_mon_year (
	input clk_1Hz,    // Clock
	input rst_n,  // Asynchronous reset active low
	
	output reg [5:0] out_day,
	output reg [5:0] out_mon,
	output reg [5:0] out_year
); 
	parameter rst_numb_mon = 5;
	wire [5:0] out_hour;
	
	wire inc_day;
	
	reg [3:0] rst_numb_day;
	reg [3:0] arr_mon_31 [0:6];
	reg [3:0] arr_mon_30 [0:3];
	counter_hour cnt_hour(.clk_1Hz(clk_1Hz), .rst_n(rst_n), .inc_day(inc_day), .out_hour(out_hour));

	integer i,j;

	initial
	begin
		arr_mon_31[0] = 1;
    	arr_mon_31[1] = 3;
    	arr_mon_31[2] = 5;
    	arr_mon_31[3] = 7;
    	arr_mon_31[4] = 8;
    	arr_mon_31[5] = 10;
    	arr_mon_31[6] = 12;

    	arr_mon_30[0] = 4;
    	arr_mon_30[1] = 6;
    	arr_mon_30[2] = 9;
    	arr_mon_30[3] = 11;
	end

	always @(posedge inc_day or negedge rst_n) begin
		if(~rst_n) begin
			out_day <= 1;
			out_mon <= 1;
			out_year <= 1;
		end else begin
			for (i = 0; i < 7; i=i+1) begin
				if(out_mon == arr_mon_31[i]) begin
					rst_numb_day <= 6;
				end else begin
					for (j = 0; j < 4; j=j+1) begin
						if (out_mon == arr_mon_30[j]) begin
							rst_numb_day <= 5;
						end else if(out_mon == 2)begin
							if (out_year % 4 == 0) begin
								rst_numb_day <= 4;
							end else begin
								rst_numb_day <= 3;
							end
						end
					end
				end
			end

			if (out_day == rst_numb_day) begin
				out_day <= 1;
				if (out_mon == rst_numb_mon) begin
					out_mon <= 1;
					out_year <= out_year + 1'b1;
				end else begin
					out_mon <= out_mon + 1'b1;
				end
			end else
			begin 
				out_day <= out_day + 1'b1;
			end
		end
	end
endmodule

*/

module day_of_mon(
	input rst_n,
	input [5:0] in_mon,
	input [5:0] in_year,
	output reg [5:0] rst_day
	);
	
	reg [3:0] arr_mon_31 [0:6];
	reg [3:0] arr_mon_30 [0:3];

	integer i,j;
	initial
	begin
		arr_mon_31[0] = 1;
    	arr_mon_31[1] = 3;
    	arr_mon_31[2] = 5;
    	arr_mon_31[3] = 7;
    	arr_mon_31[4] = 8;
    	arr_mon_31[5] = 10;
    	arr_mon_31[6] = 12;

    	arr_mon_30[0] = 4;
    	arr_mon_30[1] = 5;
    	arr_mon_30[2] = 9; 
    	arr_mon_30[3] = 11;
	end
	/*
	always @(negedge rst_n) begin
		if(~rst_n) begin
			rst_day <= 6;
		end
	end
	*/
	always @(*) begin
		for (i = 0; i < 7; i=i+1) begin
				if(in_mon == arr_mon_31[i]) begin
					rst_day <= 6;
				end else begin
					for (j = 0; j < 4; j=j+1) begin
						if (in_mon == arr_mon_30[j]) begin
							rst_day <= 5;
						end else if(in_mon == 2)begin
							if (in_year % 4 == 0) begin
								rst_day <= 4;
							end else begin
								rst_day <= 3;
							end
						end
					end
				end
			end
	end
endmodule
