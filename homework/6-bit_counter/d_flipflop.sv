module d_flipflop #(parameter WIDTH = 1) (
  input wire clock,
  input wire reset,
  input wire data_in,
  output reg data_out
);

always @(posedge clock or posedge reset)
begin
  if (reset)
    data_out <= 1'b0;
  else
    data_out <= data_in;
end

endmodule
