echo "Decoder"
iverilog -o decoder.vvp decoder.v 
vvp decoder.vvp

echo "Mux"
iverilog -o multiplexer.vvp multiplexer.v 
vvp multiplexer.vvp

echo "Adder"
iverilog -o adder.vvp adder.v 
vvp adder.vvp