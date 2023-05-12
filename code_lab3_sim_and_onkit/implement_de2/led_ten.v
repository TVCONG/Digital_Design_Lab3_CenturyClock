module led_ten(
	input [5:0] ten_numb,
	output reg  [6:0] abcdefg
	);
always @(*) begin
	case (ten_numb)
		0 : abcdefg = 7'b1000000;
		1 : abcdefg = 7'b1111001;
		2 : abcdefg = 7'b0100100;
		3 : abcdefg = 7'b0110000;
		4 : abcdefg = 7'b0011001;
		5 : abcdefg = 7'b0010010;
		default : abcdefg = 7'b1000000;
	endcase
end
endmodule