module async_mem (
  parameter WIDTH = 8 
  parameter DEPTH = 4
  ) (
    input writeEnable,
    input [WIDTH-1: 0] writeData,
    input [DEPTH-1: 0] address,

    output [WIDTH-1: 0] readData
    );

  reg [WIDTH-1 : 0] memory [0 : 2**DEPTH -1];

  always @(*


