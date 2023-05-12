module extract_bit(
	input [5:0] numb,
	output reg [5:0] ten_o,
	output reg [5:0] unit_o
);
always @ (numb)
begin
    ten_o <= numb / 6'd10;
    unit_o <= numb % 6'd10;
end

endmodule