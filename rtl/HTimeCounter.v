module HTimeCounter (
	input clk,
	input rst,
	output reg [3:0] timecnt1, timecnt2
);

always @(posedge clk, negedge rst) begin
	if (!rst) begin
		timecnt1 <= {4{1'b0}};
		timecnt2 <= {4{1'b0}};
	end
	else if (timecnt1 != 4'd2 && timecnt2 == 4'd9) begin
		timecnt1 <= timecnt1 + 1'b1;
		timecnt2 <= {4{1'b0}};
	end
	else if (timecnt1 == 4'd2 && timecnt2 == 4'd3) begin
		timecnt1 <= {4{1'b0}};
		timecnt2 <= {4{1'b0}};
	end
	else begin
		timecnt2 <= timecnt2 + 1'b1;
	end
end

endmodule
