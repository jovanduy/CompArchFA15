//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
<<<<<<< HEAD
	output[31:0]	ReadData1,	// Contents of first register read
	output[31:0]	ReadData2,	// Contents of second register read
	input[31:0]		WriteData,	// Contents to write to register
	input[4:0]		ReadRegister1,	// Address of first register to read
	input[4:0]		ReadRegister2,	// Address of second register to read
	input[4:0]		WriteRegister,	// Address of register to write
	input			RegWrite,	// Enable writing of register when High
	input			Clk		// Clock (Positive Edge Triggered)
);
	wire[31:0] wrenable;
	wire[31:0] q[31:0];
	wire[31:0] d[31:0];

	decoder1to32 decoder(wrenable, RegWrite, WriteRegister);
	register32zero regZero(q[0], WriteData, wrenable[0], Clk);
	integer i;
	generate
		genvar i;
		for (i=1; i<32; i=i+1) begin : regGenerator
			register32 reg32(q[i], WriteData, wrenable[i], Clk);
		end
	endgenerate
	mux32to1by32 mux1(ReadData1, ReadRegister1, q);
	mux32to1by32 mux2(ReadData2, ReadRegister2, q);



	// These two lines are clearly wrong.  They are included to showcase how the 
	// test harness works. Delete them after you understand the testing process, 
	// and replace them with your actual code.
	// assign ReadData1 = 42;
	// assign ReadData2 = 42;

endmodule

// module mux2to1
// (
// 	output 		out,
// 	input 	   	address,
// 	input[1:0] 	inputs
// );

// 	assign out = inputs[address];

// endmodule
=======
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
  assign ReadData1 = 42;
  assign ReadData2 = 42;

endmodule
>>>>>>> b02a2a5a6f7203d7aa9b61090a81e56d76216bea
