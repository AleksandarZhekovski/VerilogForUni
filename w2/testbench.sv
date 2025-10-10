module testbench();
  reg gate_a;
  reg gate_b;

  wire test_half_adder;
    half_adder u_half_adder(
      .half_adder_a(gate_a),
      .half_adder_b(gate_b),
      .half_adder_sum(test_half_adder_sum),
      .half_adder_carry(test_half_adder_carry)
      );

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    gate_a = 1'b1;
    gate_b = 1'b1;
    #2

    gate_a = 1'b1;
    gate_b = 1'b0;
    #2
    
    gate_a = 1'b0;
    gate_b = 1'b0;
    #2

    $finish;

  end

endmodule
