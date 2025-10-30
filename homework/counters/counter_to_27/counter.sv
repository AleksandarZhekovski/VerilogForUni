module counter_bit(
  input clock,
  input reset,
  input adder_a,

  input  counter_bit_carry_in,
  output counter_bit_carry_out,

  output ff_out
  );

  reg adder_to_ff;
  reg ff_to_adder;
  
  // This is the first XOR in a full adder, should go into 
  // the second XOR and the first AND
  wire xor1;
  assign xor1 = adder_a ^ ff_to_adder;

  // Second XOR should go into the flipflop
  assign adder_to_ff = xor1 ^ counter_bit_carry_in;

  // First AND takes the first XOR and the carry in
  wire and1;
  assign and1 = counter_bit_carry_in & xor1;

  // Second AND is takes adder_a and flipflop output
  wire and2;
  assign and2 = adder_a & ff_to_adder;

  // Just ORs the two ANDs and sends them to carry_out
  assign counter_bit_carry_out = and1 | and2;


always @(posedge clock or posedge reset)
begin
  if (reset)
    ff_to_adder <= 1'b0;
  else
    ff_to_adder <= adder_to_ff;
end

  assign ff_out = ff_to_adder;
endmodule

module counter(
  input clock,
  input reset,

  output bit_1,
  output bit_2,
  output bit_3,
  output bit_4,
  output bit_5

);

  wire to_cb_2;
  counter_bit first_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b1),
    .counter_bit_carry_in(1'b0),
    .counter_bit_carry_out(to_cb_2),
    .ff_out(bit_1)
  );
  

  wire to_cb_3;
  counter_bit second_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b0),
    .counter_bit_carry_in(to_cb_2),
    .counter_bit_carry_out(to_cb_3),
    .ff_out(bit_2)
  );

  wire to_cb_4;
  counter_bit third_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b0),
    .counter_bit_carry_in(to_cb_3),
    .counter_bit_carry_out(to_cb_4),
    .ff_out(bit_3)
    );

  wire to_cb_5;
  counter_bit forth_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b0),
    .counter_bit_carry_in(to_cb_4),
    .counter_bit_carry_out(to_cb_5),
    .ff_out(bit_4)
  );

  // wire to_cb_6;
  counter_bit fifth_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b0),
    .counter_bit_carry_in(to_cb_5),
    .counter_bit_carry_out(to_cb_6),
    .ff_out(bit_5)
  );
endmodule
