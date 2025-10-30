module full_adder #(parameter WIDTH = 1) (
  input [WIDTH-1:0] full_adder_a,
  input [WIDTH-1:0] full_adder_b,
  input [WIDTH-1:0] full_adder_carry_in,

  output [WIDTH-1:0] full_adder_sum,
  output [WIDTH-1:0] full_adder_carry_out
);
  wire xor1;

  xor_gate xor_a_b (
    .xor_a(full_adder_a),
    .xor_b(full_adder_b),
    .xor_out(xor1)
  );

  xor_gate xor_xor1_carryin (
    .xor_a(xor1),
    .xor_b(full_adder_carry_in),
    .xor_out(full_adder_sum)
  );

  wire and1;
  and_gate and_carryin_xor1 (
    .and_a(full_adder_carry_in),
    .and_b(xor1),
    .and_out(and1)
  );

  wire and2;
  and_gate and_a_b (
    .and_a(full_adder_a),
    .and_b(full_adder_b),
    .and_out(and2)
  );

  or_gate or_and1_and2(
    .or_a(and1),
    .or_b(and2),
    .or_out(full_adder_carry_out)
  );
endmodule
