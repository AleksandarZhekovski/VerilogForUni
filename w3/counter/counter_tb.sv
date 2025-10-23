module testbench();

  reg clk;
  reg res; 

  wire [3:0]x_bit;

  counter my_counter(
    .clock(clk),
    .reset(res),

    .bit_1(bit_1),
    .bit_2(bit_2),
    .bit_3(bit_3),
    .bit_4(bit_4)
    );

  always #5 clk = ~clk;
  always #2 data_in = ~data_in;

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    res = 1'b1;
    clk = 1'b0;

    data_in = 1'b1;
    #15
    res = 1'b0;


    #50
    $finish();

  end
endmodule

