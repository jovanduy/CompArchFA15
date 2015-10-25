# Deliverable 6 - Decoder

### Code

```verilog
module decoder1to32
(
output[31:0]	out,
input			enable,
input[4:0]		address
);
    assign out = enable<<address;
endmodule
```

### Description
This decoder's purpose is to set one of the 32 outputs to high. This is possible because since there are 5, or log<sub>2</sub>32, input addresses, the way in which these addresses are set can represent any number from d0 to d31 in binary. However, this only happens if `enable` is set to high; if `enable` is low, then the output will be zero no matter what the input addresses are set to.

This implementation of a decoder works by logically shifting left enable by whatever address is. Thus, if enable is 0, out will always be 0 since shifting left logically just appends 0s to the end of whatever is being shifted. If enable if 1, then output[address] will be 1 and all other outputs will be 0.

For example, if `address = 10000` (only address[4] is high), then enable will go from `enable = 1` to `enable = 10000` (4 0s are appended to the end), which is the same representation given by the addresses. All of the bits of output will be set to 0, except for whatever bit of enable has been set to 1. 
