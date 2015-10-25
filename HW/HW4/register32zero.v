module register32zero
	(
		output reg	[31:0] q,
		input		[31:0] d,
		input		wrenable,
		input		clk
	);

	assign q = 32'b0;

endmodule