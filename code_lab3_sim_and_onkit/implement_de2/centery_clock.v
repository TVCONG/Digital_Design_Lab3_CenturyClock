module centery_clock (
	input clk,
	input rst_n,
	input swap,
	output [6:0] abcdefg_sec_unit, abcdefg_sec_ten
				, abcdefg_min_unit, abcdefg_min_ten
				, abcdefg_hour_unit, abcdefg_hour_ten
	/*
					, abcdefg_day_unit, abcdefg_day_ten
					, abcdefg_mon_unit, abcdefg_mon_ten
					, abcdefg_year_unit, abcdefg_year_ten
	*/
					
);
	wire [5:0] sec_numb;
	wire [5:0] sec_ten;
	wire [5:0] sec_unit;
	
	wire [5:0] min_numb;
	wire [5:0] min_ten;
	wire [5:0] min_unit;
	
	wire [5:0] hour_numb;
	wire [5:0] hour_ten;
	wire [5:0] hour_unit;
	
	wire [5:0] day_numb;
	wire [5:0] day_ten;
	wire [5:0] day_unit;
	
	wire [5:0] mon_numb;
	wire [5:0] mon_ten;
	wire [5:0] mon_unit;
	
	wire [5:0] year_numb;
	wire [5:0] year_ten;
	wire [5:0] year_unit;
	
	wire inc_sec;
	assign inc_sec = 1;
	wire inc_min;
	wire inc_hour;
	wire inc_day;
	wire inc_mon;
	wire inc_year;
	
	reg [5:0] swap_sec_day;
	reg [5:0] swap_min_mon;
	reg [5:0] swap_hour_year;
	wire [5:0] rst_numb_sec, rst_numb_min, rst_numb_hour, rst_numb_mon;
	assign rst_numb_sec = 59;
	assign rst_numb_min = 59;
	assign rst_numb_hour = 23;
	wire [5:0] rst_numb_day;
	assign rst_numb_mon = 12;
	reg clk_1Hz;
	

	convert_freq conv_freq(.clk_in(clk), .clk_out(clk_1Hz));
	counter_sec cnt_sec(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_sec(inc_sec), .rst_numb_sec(rst_numb_sec),.inc_min(inc_min), .out_sec(sec_numb));
	counter_min cnt_min(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_min(inc_min), .rst_numb_min(rst_numb_min),.inc_hour(inc_hour), .out_min(min_numb));
	counter_hour cnt_hour(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_hour(inc_hour), .rst_numb_hour(rst_numb_hour), .inc_day(inc_day), .out_hour(hour_numb));
	day_of_mon dom(.rst_n  (rst_n), .in_mon(mon_numb), .in_year(year_numb), .rst_day(rst_numb_day));
	counter_day cnt_day(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_day(inc_day), .rst_numb_day(rst_numb_day), .inc_mon(inc_mon), .out_day(day_numb));
	counter_mon cnt_mon(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_mon(inc_mon), .rst_numb_mon(rst_numb_mon),.inc_year(inc_year), .out_mon(mon_numb));
	counter_year cnt_year(.clk_1Hz(clk_1Hz), .rst_n  (rst_n), .inc_year(inc_year), .out_year(year_numb));
	
	
	
	//display second
	//extract_bit ex_sec(.numb(hour_numb), .ten_o(sec_ten), .unit_o(sec_unit));
	//led_unit led_sec_unit(.unit_numb(sec_unit), .abcdefg(abcdefg_sec_unit));
	//led_ten led_sec_ten(.ten_numb(sec_ten), .abcdefg(abcdefg_sec_ten));
	
	//display min
	//extract_bit ex_min(.numb(day_numb), .ten_o(min_ten), .unit_o(min_unit));
	//led_unit led_min_unit(.unit_numb(min_unit), .abcdefg(abcdefg_min_unit));
	//led_ten led_min_ten(.ten_numb(min_ten), .abcdefg(abcdefg_min_ten));
	
	//display hour
	//extract_bit ex_hour(.numb(mon_numb), .ten_o(hour_ten), .unit_o(hour_unit));
	//led_unit led_hour_unit(.unit_numb(hour_unit), .abcdefg(abcdefg_hour_unit));
	//led_ten led_hour_ten(.ten_numb(hour_ten), .abcdefg(abcdefg_hour_ten));
	
	always @(*) begin
		if(swap)begin
			swap_sec_day = sec_numb;
			swap_min_mon = min_numb;
			swap_hour_year = hour_numb;
		end else begin
			swap_sec_day = day_numb;
			swap_min_mon = mon_numb;
			swap_hour_year = year_numb;
		end
	end 
	


	extract_bit ex_sec_day(.numb(swap_sec_day), .ten_o(sec_ten), .unit_o(sec_unit));
	led_unit led_sec_unit(.unit_numb(sec_unit), .abcdefg(abcdefg_sec_unit));
	led_ten led_sec_ten(.ten_numb(sec_ten), .abcdefg(abcdefg_sec_ten));
	
	extract_bit ex_min_mon(.numb(swap_min_mon), .ten_o(min_ten), .unit_o(min_unit));
	led_unit led_min_unit(.unit_numb(min_unit), .abcdefg(abcdefg_min_unit));
	led_ten led_min_ten(.ten_numb(min_ten), .abcdefg(abcdefg_min_ten));
	
	extract_bit ex_hour_year(.numb(swap_hour_year), .ten_o(hour_ten), .unit_o(hour_unit));
	led_unit led_hour_unit(.unit_numb(hour_unit), .abcdefg(abcdefg_hour_unit));
	led_ten led_hour_ten(.ten_numb(hour_ten), .abcdefg(abcdefg_hour_ten));
	
	/*
	//display day
	extract_bit ex_day(.numb(year_numb), .ten_o(day_ten), .unit_o(day_unit));
	led_unit led_day_unit(.unit_numb(day_unit), .abcdefg(abcdefg_day_unit));
	led_ten led_day_ten(.ten_numb(day_ten), .abcdefg(abcdefg_day_ten));
	
	//display mon
	extract_bit ex_mon(.numb(year_numb), .ten_o(mon_ten), .unit_o(mon_unit));
	led_unit led_mon_unit(.unit_numb(mon_unit), .abcdefg(abcdefg_mon_unit));
	led_ten led_mon_ten(.ten_numb(mon_ten), .abcdefg(abcdefg_mon_ten));
	
	//display year
	extract_bit ex_year(.numb(year_numb), .ten_o(year_ten), .unit_o(year_unit));
	led_unit led_year_unit(.unit_numb(year_unit), .abcdefg(abcdefg_year_unit));
	led_ten led_year_ten(.ten_numb(year_ten), .abcdefg(abcdefg_year_ten));
	*/
	
endmodule