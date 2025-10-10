module half_adder #(parameter WIDTH = 1) (
  input [WIDTH-1:0] half_adder_a,
  input [WIDTH-1:0] half_adder_b,

  output [WIDTH-1:0] half_adder_sum,
  output [WIDTH-1:0] half_adder_carry
);

    and_gate #(WIDTH) and1 (
      .and_a(half_adder_a),
      .and_b(half_adder_b),
      .and_out(half_adder_carry)
      );

    xor_gate #(WIDTH) xor1 (
      .xor_a(half_adder_a),
      .xor_b(half_adder_b),
      .xor_out(half_adder_sum)
      );

endmodule
