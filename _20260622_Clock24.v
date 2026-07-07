module _20260622_Clock24 (
	input CLOCK_50,
	input [3:0] KEY,
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
);

wire sclk, mclk, hclk;
wire [3:0] stimecnt1, stimecnt2, mtimecnt1, mtimecnt2, htimecnt1, htimecnt2;

FreDiv SFreDiv(.clk(CLOCK_50), .rst(KEY[0]), .clkout(sclk));
TimeCounter STimeCounter(.clk(sclk), .rst(KEY[0]), .timecnt1(stimecnt1), .timecnt2(stimecnt2));
SevenSeg4b S1SevenSeg4b(.timecnt(stimecnt1), .seg(HEX1));
SevenSeg4b S2SevenSeg4b(.timecnt(stimecnt2), .seg(HEX0));

FreDiv #(.cntmax(32'd3_000_000_000), .cnthlf(32'd1_500_000_000), .cntwid(32)) MFreDiv(.clk(CLOCK_50), .rst(KEY[0]), .clkout(mclk));
TimeCounter MTimeCounter(.clk(mclk), .rst(KEY[0]), .timecnt1(mtimecnt1), .timecnt2(mtimecnt2));
SevenSeg4b M1SevenSeg4b(.timecnt(mtimecnt1), .seg(HEX3));
SevenSeg4b M2SevenSeg4b(.timecnt(mtimecnt2), .seg(HEX2));

FreDiv #(.cntmax(38'd180_000_000_000), .cnthlf(38'd90_000_000_000), .cntwid(38)) HFreDiv(.clk(CLOCK_50), .rst(KEY[0]), .clkout(hclk));
HTimeCounter HTimeCounter(.clk(hclk), .rst(KEY[0]), .timecnt1(htimecnt1), .timecnt2(htimecnt2));
SevenSeg4b H1SevenSeg4b(.timecnt(htimecnt1), .seg(HEX5));
SevenSeg4b H2SevenSeg4b(.timecnt(htimecnt2), .seg(HEX4));

endmodule