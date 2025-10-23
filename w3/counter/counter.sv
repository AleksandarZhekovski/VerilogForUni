  //a;sldjfk;asfdj
module 4b_counter(
  input dream,
  input notdream
  );

  // //
  // wire 1_adder_to_1_ff;
  // wire 1_ff_to_1_adder;
  // wire 1_adder_to_2_adder;
  //
  // full_adder 1st_fa(
  //   .full_adder_a(1'b1),
  //   .full_adder_b(1_ff_to_1_adder),
  //   .full_adder_carry_in(1'b0),
  //
  //   .full_adder_sum(1_adder_to_1_ff),
  //   .full_adder_carry_out(1_adder_to_2_adder)
  //   );
  //
  // d_ff 1st_d_ff(
  //   .clk(clock),
  //   .res(reset),
  //   .data_in(1_adder_to_1_ff),
  //   .data_out(1_ff_to_1_adder)
  //   );
  //
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
  //
endmodule
