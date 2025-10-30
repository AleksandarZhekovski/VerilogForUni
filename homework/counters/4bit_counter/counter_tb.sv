module testbench();

  reg clk;
  reg res; 

  wire bit_1;
  wire bit_2;
  wire bit_3;
  wire bit_4;

  counter my_counter(
    .clock(clk),
    .reset(res),

    .bit_1(bit_1),
    .bit_2(bit_2),
    .bit_3(bit_3),
    .bit_4(bit_4)
    );

  always #5 clk = ~clk;

  // always @(*) 
  //   // reset when counter reaches 27 aka 11011
  // begin
  //   if (bit_1 && bit_2 && bit_4 && bit_5)
  //     res = 1'b1;
  //     #10
  //     res = 1'b0;
  // end

    
  // always #2 data_in = ~data_in;

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    res = 1'b1;
    clk = 1'b0;

    // data_in = 1'b1;
    #15
    res = 1'b0;


    #400
    $finish();

  end
endmodule

