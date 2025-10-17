module testbench();
  reg gate_a;
  reg gate_b;
  reg adder_carry;


  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    // all states of a and b with carry 0
    adder_carry = 1'b0;
    gate_a = 1'b0;
    gate_b = 1'b0;
    #2

    gate_a = 1'b0;
    gate_b = 1'b1;
    #2
    
    gate_a = 1'b1;
    gate_b = 1'b0;
    #2

    gate_a = 1'b1;
    gate_b = 1'b1;
    #2
    
    // all states of a and b with carry 1
    adder_carry = 1'b1;
    gate_a = 1'b0;
    gate_b = 1'b0;
    #2

    gate_a = 1'b0;
    gate_b = 1'b1;
    #2
    
    gate_a = 1'b1;
    gate_b = 1'b0;
    #2

    gate_a = 1'b1;
    gate_b = 1'b1;
    #2

    $finish;

  end
endmodule

