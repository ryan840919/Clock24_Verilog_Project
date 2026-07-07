module TimeCounter #(
	parameter cntmax1 = 6,
	parameter cntmax2 = 10,
	parameter cntwid = 4
)(
	input clk,
	input rst,
	output reg [cntwid-1:0] timecnt1, timecnt2
);

always @(posedge clk, negedge rst) begin
	if (!rst) begin
		timecnt1 <= {cntwid{1'b0}};
		timecnt2 <= {cntwid{1'b0}};
	end
	else if (timecnt1 != cntmax1-1 && timecnt2 == cntmax2-1) begin
		timecnt1 <= timecnt1 + 1'b1;
		timecnt2 <= {cntwid{1'b0}};
	end
	else if (timecnt1 == cntmax1-1 && timecnt2 == cntmax2-1) begin
		timecnt1 <= {cntwid{1'b0}};
		timecnt2 <= {cntwid{1'b0}};
	end
	else begin
		timecnt2 <= timecnt2 + 1'b1;
	end
end

endmodule