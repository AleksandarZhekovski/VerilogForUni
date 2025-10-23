module d_flipflop #(parameter WIDTH = 1) (
  input wire clock,
  input wire reset,
  input wire [WIDTH-1:0] data_in,
  output reg [WIDTH-1:0] data_out
);

always @(posedge clock or negedge reset) begin
  if (reset == 1)
    data_out <= {WIDTH{1'b0}};
  else
    data_out <= data_in;
end

endmodule
