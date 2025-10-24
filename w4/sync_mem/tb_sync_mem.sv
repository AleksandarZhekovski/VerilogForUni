module testbench #(
  parameter DEPTH = 4,
  parameter WIDTH = 8
);

  reg writeEnable;
  reg [DEPTH-1 : 0] address;
  reg [WIDTH-1 : 0] writeData;

  reg [WIDTH-1 : 0] readData;

  async_mem myMemory(
    .writeEnable(writeEnable),
    .writeData(writeData),
    .address(address),

    .readData(readData)
    );

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    writeEnable = 1'b0;
    address = 4'b0000;
    writeData = 8'b00000001;

    #2
    writeData = 8'b11111111;

    #2
    writeData = 8'b00000000;

    #2
    writeEnable = 1'b1;

    #2
    writeData = 8'b11111111;

    #2
    writeEnable = 1'b0;

    #10
    $finish();

  end
endmodule


