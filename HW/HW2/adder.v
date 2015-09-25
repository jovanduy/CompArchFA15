//define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
	output sum, carryout;
	input a, b, carryin;
	assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
	output out, carryout;
	input a, b, carryin;

	wire AxorB;
	wire CinandAxorB;
	wire AandB;

	`XOR(AxorB, a, b);
	`XOR(out, AxorB, carryin);
	`AND(CinandAxorB, AxorB, carryin);
	`AND(AandB, a, b);
	`OR(carryout, CinandAxorB, AandB);
endmodule

module testFullAdder;
	reg a, b, carryin;
	wire sum, carryout;
	// behavioralFullAdder adder (sum, carryout, a, b, carryin);
	structuralFullAdder adder (sum, carryout, a, b, carryin);
	 
	initial begin
		$dumpfile("adder.vcd");
		$dumpvars(0, testFullAdder);

		$display("A B Cin | S Cout | Expected Output");
		a=0;b=0;carryin=0; #1000
		$display("%b  %b  %b | %b   %b  | All false", a, b, carryin, sum, carryout);
		a=0;b=0;carryin=1; #1000
		$display("%b  %b  %b | %b   %b  | S only", a, b, carryin, sum, carryout);
		a=0;b=1;carryin=0; #1000
		$display("%b  %b  %b | %b   %b  | S only", a, b, carryin, sum, carryout);
		a=0;b=1;carryin=1; #1000
		$display("%b  %b  %b | %b   %b  | Cout only", a, b, carryin, sum, carryout);
		a=1;b=0;carryin=0; #1000
		$display("%b  %b  %b | %b   %b  | S only", a, b, carryin, sum, carryout);
		a=1;b=0;carryin=1; #1000
		$display("%b  %b  %b | %b   %b  | Cout only", a, b, carryin, sum, carryout);
		a=1;b=1;carryin=0; #1000
		$display("%b  %b  %b | %b   %b  | Cout only", a, b, carryin, sum, carryout);
		a=1;b=1;carryin=1; #1000
		$display("%b  %b  %b | %b   %b  | Both", a, b, carryin, sum, carryout);
	end
endmodule
