module d_flip_flop #(parameter WIDTH = 1) (
  input wire clk, reset, data_in,
  output reg data_out
  );

  always @(posedge clk or negedge reset)
  begin 
    if (!reset) 
      data_out <= 1'b0;
    else
      data_out <= data_in;
  end
  endmodule
