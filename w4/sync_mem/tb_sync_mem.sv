module testbench #(
parameter DEPTH = 4,
parameter WIDTH = 8
);
  reg clk;

  reg               writeEnable;
  reg [DEPTH-1 : 0] address;
  reg [WIDTH-1 : 0] writeData;

  reg [WIDTH-1 : 0] readData;

  sync_mem myMemory(
    .clock(clk),
    .writeEnable(writeEnable),
    .writeData(writeData),
    .address(address),

    .readData(readData)
    );

  always #5 clk = ~clk;

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    clk = 1'b0;
    // begin with write disable
    writeEnable = 1'b0;
    address = 4'b0000;
    writeData = 8'b00000001;

    #5 // pos clk: Should write 00000011
    writeEnable = 1'b1;
    writeData = 8'b00000011;

    #5 // neg clk:

    writeEnable = 1'b0;

    #5 // pos clk: input data changes, but writeEnable is still off

    writeData = 8'b00000111;

    #5 // neg clk: no changes

    writeData = 8'b00001111;

    #5 // pos clk: now writeEnable is on so it should write it

    writeEnable = 1'b1;

    #5 // neg clk: close writeEnable

    writeEnable = 1'b0;

    #5 // pos clk: now readData should change to 00001111

    #5 // neg clk: no changes

    $finish();

  end
endmodule


