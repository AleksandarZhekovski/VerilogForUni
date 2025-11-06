module instruction_counter #(
  parameter ICODESIZE = 4,
  parameter COUNTBITS = 4
  ) (
  input clock,
  input reset,
  input [ICODESIZE-1 : 0] icode_input

  // For testing
  // ,output reg [COUNTBITS-1 : 0] test_res_reg
  );
    reg  [ICODESIZE-1 : 0] icode_reg;

    reg [COUNTBITS-1 : 0] readData0;
    reg [COUNTBITS-1 : 0] readData1;

    // reg writeEnable0;
    // reg writeEnable1;

    sync_mem my_mem (

      .clock(clock),
      
      .writeEnable0(1'b0),
      .address0    (icode_reg), // 
      .writeData0  (),
      .readData0   (readData0),

      .writeEnable1(1'b1),
      .address1    (icode_reg),
      .writeData1  (resault_reg),
      .readData1   ()
      );


    reg [COUNTBITS-1 : 0] resault_reg;
    always @(posedge clock or negedge reset) begin
      if (reset) begin
        resault_reg <= readData0 + 1;
        // For testing
        // test_res_reg = readData0 + 1;
      end

      if (!reset) begin
        resault_reg = 4'b0000;
      end
    end 
endmodule
