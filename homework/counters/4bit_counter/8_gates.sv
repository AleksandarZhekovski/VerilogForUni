// 1: AND (only if both)
module and_gate (
    input and_a,
    input and_b,

    output and_out
);

  assign and_out = and_a && and_b;
endmodule

// 2: OR (if either)
module or_gate (
    input or_a,
    input or_b,

    output or_out
);

  assign or_out = or_a || or_b;
endmodule

// 3: NOT (inverts the input
module not_gate (
    input not_a,

    output not_out
);

  assign not_out = !not_a;
endmodule

// 4: NAND (if both then off, on otherwise)
module nand_gate (
    input nand_a,
    input nand_b,

    output nand_out
);

  assign nand_out = !(nand_a && nand_b);
endmodule

// 5: NOR (only if both off)
module nor_gate (
    input nor_a,
    input nor_b,

    output nor_out
);

  assign nor_out = !(nor_a || nor_b);
endmodule

// 6: XOR (either one, but not both)
module xor_gate (
    input xor_a,
    input xor_b,

    output xor_out
);

  assign xor_out = (xor_a || xor_b) && !(xor_a && xor_b);
endmodule

// 7: XNOR (either both on, or both off)
module xnor_gate (
    input xnor_a,
    input xnor_b,

    output xnor_out
);

  assign xnor_out = !((xnor_a || xnor_b) && !(xnor_a && xnor_b));
endmodule

// 8: BUFFER (returns the inputs)
module buff_gate (
    input buff_a,

    output buff_out
);

  assign buff_out = buff_a;
endmodule

