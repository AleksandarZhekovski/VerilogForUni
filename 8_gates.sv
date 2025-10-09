// 1: AND
module and_gate (
    input and_a,
    input and_b,

    output and_out
);

  assign and_out = and_a && and_b;
endmodule

// 2: OR
module or_gate (
    input or_a,
    input or_b,

    output or_out
);

  assign or_out = or_a || or_b;
endmodule

// 3: NOT
module not_gate (
    input not_a,

    output not_out
);

  assign not_out = !not_a;
endmodule

// 4: NAND
module nand_gate (
    input nand_a,
    input nand_b,

    output nand_out
);

  assign nand_out = !(nand_a && nand_b);
endmodule

// 5: NOR
module nor_gate (
    input nor_a,
    input nor_b,

    output nor_out
);

  assign nor_out = !(nor_a || nor_b);
endmodule

// 6: XOR
module xor_gate (
    input xor_a,
    input xor_b,

    output xor_out
);

  assign xor_out = (xor_a || xor_b) && !(xor_a && xor_b);
endmodule

// 7: XNOR
module xnor_gate (
    input xnor_a,
    input xnor_b,

    output xnor_out
);

  assign xnor_out = !((xnor_a || xnor_b) && !(xnor_a && xnor_b));
endmodule

// 8: BUFFER
module buff_gate (
    input buff_a,

    output buff_out
);

  assign buff_out = buff_a;
endmodule

