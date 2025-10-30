module sync_mem #(
  parameter DEPTH = 4,
  parameter WIDTH = 8
  ) (
    input               clock,
    input               writeEnable,
    input [WIDTH-1 : 0] writeData,
    input [DEPTH-1 : 0] address,

    output reg [WIDTH-1: 0] readData
    );

  reg [WIDTH-1 : 0] memory [0 : 2**DEPTH -1];


  always @(posedge clock) begin 
    if (writeEnable) begin
      memory[address] <= writeData;
    end

    if (!writeEnable) begin
      readData <= memory[address];
    end
  end

  // always @(posedge clock) begin
  //   if (!writeEnable) begin
  //     readData <= memory[address];
  //   end
  // end

  endmodule
