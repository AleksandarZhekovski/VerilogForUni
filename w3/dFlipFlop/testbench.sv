module testbench();

  reg clk;
  reg res; 
  reg data_in;

  wire data_out;

  d_ff u_d_flip_flop(
    .clk(clk),
    .rst(res),
    .data_in(data_in),
    .data_out(data_out)
    );


  always #5 clk = ~clk;
  always #2 data_in = ~data_in;

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    res = 1'b1;
    clk = 1'b0;
    
    data_in = 1'b0;

    #1
    res = 1'b0;


    #50
    $finish();

  end
endmodule

