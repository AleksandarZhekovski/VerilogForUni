module testbench();
  reg gate_a;
  reg gate_b;
  reg adder_carry;

  wire test_half_adder;
    half_adder u_half_adder(
      .half_adder_a(gate_a),
      .half_adder_b(gate_b),

      .half_adder_sum  (test_half_adder_sum),
      .half_adder_carry(test_half_adder_carry)
    );

  wire test_full_adder_sum;
  wire test_full_adder_carryout;
    full_adder u_full_adder(
      .full_adder_a(gate_a),
      .full_adder_b(gate_b),
      .full_adder_carry_in(adder_carry),

      .full_adder_sum(test_full_adder_sum),
      .full_adder_carry_out(test_full_adder_carryout)
    );

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);

    // all states of a and b with carry 0
    adder_carry = 1'b1;
    gate_a = 1'b1;
    gate_b = 1'b1;
    #2

    gate_a = 1'b1;
    gate_b = 1'b0;
    #2
    
    gate_a = 1'b0;
    gate_b = 1'b0;
    #2
    
    // all states of a and b with carry 1
    adder_carry = 1'b0;
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
