module led_unit(
	input [5:0] unit_numb,
	output reg [6:0] abcdefg
	);
always @(*) begin
	case (unit_numb)
		0 : abcdefg = 7'b1000000;
		1 : abcdefg = 7'b1111001;
		2 : abcdefg = 7'b0100100;
		3 : abcdefg = 7'b0110000;
		4 : abcdefg = 7'b0011001;
		5 : abcdefg = 7'b0010010;
		6 : abcdefg = 7'b0000010;
		7 : abcdefg = 7'b1111000;
		8 : abcdefg = 7'b0000000;
		9 : abcdefg = 7'b0010000;
		default : abcdefg = 7'b1000000;
	endcase
end
endmodule