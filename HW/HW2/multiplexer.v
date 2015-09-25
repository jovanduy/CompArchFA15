//define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
	output out;
	input address0, address1;
	input in0, in1, in2, in3;
	wire[3:0] inputs = {in3, in2, in1, in0};
	wire[1:0] address = {address1, address0};
	assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
	output out;
	input address0, address1;
	input in0, in1, in2, in3;

	wire nA0;
	wire nA1;
	wire I0andnA0andnA1;
	wire I1andA0andnA1;
	wire I2andnA0andA1;
	wire I3andA0andA1;

	`NOT(nA0, address0);
	`NOT(nA1, address1);

	`AND(I0andnA0andnA1, in0, nA0, nA1);
	`AND(I1andA0andnA1, in1, address0, nA1);
	`AND(I2andnA0andA1, in2, nA0, address1);
	`AND(I3andA0andA1, in3, address0, address1);

	`OR(out, I0andnA0andnA1, I1andA0andnA1, I2andnA0andA1, I3andA0andA1);


endmodule


module testMultiplexer;
	reg address0, address1;
	reg in0, in1, in2, in3;
	wire out;
	// behavioralMultiplexer multiplexer (out,address0,address1,in0,in1,in2,in3);
	structuralMultiplexer multiplexer (out,address0,address1,in0,in1,in2,in3);
	initial begin
		$dumpfile("multiplexer.vcd");
		$dumpvars(0, testMultiplexer);

		$display("A1 A0 | I3 I2 I1 I0 | Out | Expected Output");
		address1=0;address0=0;in3=1'bX;in2=1'bX;in1=1'bX;in0=0; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | false", address1, address0, in3, in2, in1, in0, out);
		address1=0;address0=0;in3=1'bX;in2=1'bX;in1=1'bX;in0=1; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | true", address1, address0, in3, in2, in1, in0, out);
		address1=0;address0=1;in3=1'bX;in2=1'bX;in1=0;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | false", address1, address0, in3, in2, in1, in0, out);
		address1=0;address0=1;in3=1'bX;in2=1'bX;in1=1;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | true", address1, address0, in3, in2, in1, in0, out);
		address1=1;address0=0;in3=1'bX;in2=0;in1=1'bX;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | false", address1, address0, in3, in2, in1, in0, out);
		address1=1;address0=0;in3=1'bX;in2=1;in1=1'bX;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | true", address1, address0, in3, in2, in1, in0, out);
		address1=1;address0=1;in3=0;in2=1'bX;in1=1'bX;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | false", address1, address0, in3, in2, in1, in0, out);
		address1=1;address0=1;in3=1;in2=1'bX;in1=1'bX;in0=1'bX; #1000
		$display("%b  %b  | %b  %b  %b  %b  |  %b  | true", address1, address0, in3, in2, in1, in0, out);
	end
endmodule
