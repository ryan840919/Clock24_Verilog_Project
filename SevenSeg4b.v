module SevenSeg4b (
	input [3:0] timecnt,
	output reg [6:0] seg
);

always @(*) begin
	case (timecnt)
		4'b0000 : seg =7'b100_0000; //0
		4'b0001 : seg =7'b111_1001; //1
		4'b0010 : seg =7'b010_0100; //2
		4'b0011 : seg =7'b011_0000; //3
		4'b0100 : seg =7'b001_1001; //4
		4'b0101 : seg =7'b001_0010; //5 
		4'b0110 : seg =7'b000_0010; //6
		4'b0111 : seg =7'b111_1000; //7
		4'b1000 : seg =7'b000_0000; //8
		4'b1001 : seg =7'b001_0000; //9
		default : seg =7'b111_1111;
	endcase
end

endmodule