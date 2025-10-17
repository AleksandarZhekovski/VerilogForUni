module d_ff #(parameter WIDTH = 1) (
  input clk,
  input rst,
  input [WIDTH-1:0] data_in,
  output reg [WIDTH-1:0] data_out
);

always @(posedge clk) begin
  if (rst)
    data_out <= {WIDTH{1'b0}};
  else
    data_out <= data_in;
end

endmodule
