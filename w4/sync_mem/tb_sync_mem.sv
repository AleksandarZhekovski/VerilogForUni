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

    #5
    writeEnable = 1'b1;
    writeData = 8'b00000011;

    #5

    writeEnable = 1'b0;

    #10

    $finish();

  end
endmodule


