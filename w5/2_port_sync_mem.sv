module sync_mem #(
  parameter DEPTH = 4,
  parameter WIDTH = 4
  ) (
    input               clock,
    input reset,

    // Port 1
    input                    writeEnable0,
    input      [WIDTH-1 : 0] writeData0,
    input      [DEPTH-1 : 0] address0,
    output reg [WIDTH-1 : 0] readData0,

    // Port 2 
    input                    writeEnable1,
    input      [WIDTH-1 : 0] writeData1,
    input      [DEPTH-1 : 0] address1,
    output reg [WIDTH-1 : 0] readData1
    
    // For testing
    );

  reg [WIDTH-1 : 0] memory [0 : 2**DEPTH -1];

  always @(posedge clock) begin 
    if (!reset);


    // PORT 0
    if (writeEnable0) begin
      memory[address0] <= writeData0;
    end
    if (!writeEnable0) begin
      readData0 <= memory[address0];
    end

    //PORT 1
    if (writeEnable1) begin
      memory[address1] <= writeData1;
    end
    if (!writeEnable1) begin
      readData1 <= memory[address1];
    end
  end

  // always @(posedge clock) begin
  //   if (!writeEnable) begin
  //     readData <= memory[address];
  //   end
  // end

  endmodule

