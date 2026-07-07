module FreDiv #(
	parameter cntmax = 50_000_000,
	parameter cnthlf = 25_000_000,
	parameter cntwid = 26
)(
	input clk,
	input rst,
	output reg clkout
);

reg [cntwid-1:0] count;

always @(posedge clk, negedge rst) begin
	if (!rst)
		count <= {cntwid{1'b0}};
	else if (count == cntmax-1)
		count <= {cntwid{1'b0}};
	else
		count <= count + 1'b1;
end

always @(posedge clk, negedge rst) begin
	if (!rst)
		clkout <= 1'b1;
	else if (count > cnthlf-1)
		clkout <= 1'b0;
	else
		clkout <= 1'b1;
end

endmodule