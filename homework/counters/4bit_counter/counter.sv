module counter_bit(
  input clock,
  input reset,
  input adder_a,

  input  counter_bit_carry_in,
  output counter_bit_carry_out,
  
  output reg ff_out
  );

  //
  wire adder_to_ff;
  wire ff_to_adder;

  full_adder full_adder(
    .full_adder_a(adder_a),
    .full_adder_b(ff_to_adder),
    .full_adder_carry_in(counter_bit_carry_in),

    .full_adder_sum(adder_to_ff),
    .full_adder_carry_out(counter_bit_carry_out)
    );

  d_flipflop d_ff(
    .clock(clock),
    .reset(reset),

    .data_in(adder_to_ff),
    .data_out(ff_to_adder)
    );

  assign ff_out = ff_to_adder;
endmodule


module counter(
  input clock,
  input reset,

  output bit_1,
  output bit_2,
  output bit_3,
  output bit_4
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

  // wire to_cb_5;
  counter_bit forth_cb(
    .clock(clock),
    .reset(reset),

    .adder_a(1'b0),
    .counter_bit_carry_in(to_cb_4),
    .counter_bit_carry_out(to_cb_5),
    .ff_out(bit_4)
  );

endmodule

  // //
  // wire 2_adder_to_2_ff;
  // wire 2_ff_to_2_adder;
  // wire 2_adder_to_3_adder;
  //
  // full_adder 2nd_fa(
  //   .full_adder_a(1'b0),
  //   .full_adder_b(2_ff_to_2_adder),
  //   .full_adder_carry_in(1_adder_to_2_adder),
  //
  //   .full_adder_sum(1_adder_to_2adder),
  //   .full_adder_carry_out(2_adder_to_3_adder)
  //   );
  //
  // d_ff 2nd_d_ff(
  //   .clk(clock),
  //   .res(reset),
  //   .data_in(2_adder_to_2_ff),
  //   .data_out(2_ff_to_2_adder)
  //   );
  //
  //   //
  // wire 3_adder_to_3_ff;
  // wire 3_ff_to_3_adder;
  // wire 3_adder_to_4_adder;
  //
  // full_adder 3rd_fa(
  //   .full_adder_a(1'b0),
  //   .full_adder_b(3_ff_to_3_adder),
  //   .full_adder_carry_in(2_adder_to_3_adder),
  //
  //   .full_adder_sum(3_adder_to_3adder),
  //   .full_adder_carry_out(3_adder_to_4_adder)
  //   );
  //
  // d_ff 2nd_d_ff(
  //   .clk(clock),
  //   .res(reset),
  //   .data_in(3_adder_to_3_ff),
  //   .data_out(3_ff_to_3_adder)
  //   );
  //
  //
  // //
  // wire 4_adder_to_4_ff;
  // wire 4_ff_to_4_adder;
  //
  // full_adder 3rd_fa(
  //   .full_adder_a(1'b0),
  //   .full_adder_b(4_ff_to_4_adder),
  //   .full_adder_carry_in(3_adder_to_4_adder),
  //
  //   .full_adder_sum(4_adder_to_4_ff),
  //   .full_adder_carry_out()
  //   );
  //
  // d_ff 2nd_d_ff(
  //   .clk(clock),
  //   .res(reset),
  //   .data_in(4_adder_to_4_ff),
  //
  //   .data_out(4_ff_to_4_adder)
  //   );

// endmodule
