// Code your testbench here
// or browse Examples
module tb();
  reg gate_a;
  reg gate_b;
  
  // AND test
  wire and_gate_out;
  and_gate u_and_gate(
    .and_a(gate_a),
    .and_b(gate_b),
    .and_out(and_gate_out)
  );
  
  // OR test
  wire or_gate_out;
  or_gate u_or_gate(
    .or_a(gate_a),
    .or_b(gate_b),
    .or_out(or_gate_out)
  );

  // NOT test
  wire not_gate_out;
  not_gate u_not_gate(
    .not_a(gate_a),
    .not_out(not_gate_out)
  );

  // Nand test
  wire nand_gate_out;
  nand_gate u_nand_gate(
    .nand_a(gate_a),
    .nand_b(gate_b),
    .nand_out(nand_gate_out)
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
