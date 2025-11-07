module testbench();

  reg clk;
  reg res; 

  reg writeEnable0;
  reg writeEnable1;

  reg [3:0] my_icode;
  reg [3:0] my_reg;

  instruction_counter my_IC(
    .clock(clk),
    .reset(res),

    // .writeEnable0(writeEnable0),
    // .writeEnable1(writeEnable1),

    .icode_input(my_icode)

    // ,
    // .test_res_reg(my_reg)
  );

  always #5 clk = ~clk;

  // always @(*) begin
  //
  // end
    

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0);
    res = 1'b0;
    clk = 1'b0;

    #15
    res = 1'b1;
    #5

    my_icode = 4'b0001;
    #5

    my_icode = 4'b0011;
    #5

    my_icode = 4'b0010;
    #5

    #15

    my_icode = 4'b0011;
    #5

    #15

    my_icode = 4'b0011;
    #5
    #400

    
    $finish();

  end
endmodule
