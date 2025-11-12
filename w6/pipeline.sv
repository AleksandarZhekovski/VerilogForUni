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

  // stage registers
  reg  [ICODESIZE-1 : 0] s1_icode_reg;
  always @(posedge clock or negedge reset) s1_icode_reg <= (!reset) ? (4'b0000) : (icode_input);

  reg  [ICODESIZE-1 : 0] s2_icode_reg;
  always @(posedge clock or negedge reset) s2_icode_reg <= (!reset) ? (4'b0000) : (s1_icode_reg);

  reg  [ICODESIZE-1 : 0] s3_icode_reg;
  always @(posedge clock or negedge reset) s3_icode_reg <= (!reset) ? (4'b0000) : (s2_icode_reg);

  reg  [ICODESIZE-1 : 0] s4_icode_reg;
  always @(posedge clock or negedge reset) s4_icode_reg <= (!reset) ? (4'b0000) : (s3_icode_reg);


  // memory
  wire [COUNTBITS-1 : 0] readData0;
  wire [COUNTBITS-1 : 0] readData1;

  sync_mem my_mem (
    .clock(clock),
    .reset(reset),
    
    .writeEnable0(1'b0),
    .address0    (s2_icode_reg), // 
    .writeData0  (),
    .readData0   (readData0),

    .writeEnable1(1'b1),
    .address1    (s4_icode_reg),
    .writeData1  (pipeline_resault_reg),
    .readData1   ()
  );

  reg [COUNTBITS-1 : 0] mem_out_reg; 
  // Data hazard 2: if icode s2 = s4
  wire [COUNTBITS-1 : 0] mux_s2_s4;
  assign mux_s2_s4 = (s2_icode_reg == s4_icode_reg) ? readData0 : pipeline_resault_reg; 
  always @(posedge clock or negedge reset) mem_out_reg = (!reset) ? (4'b000) : (mux_s2_s4);

  reg [COUNTBITS-1 : 0] pipeline_resault_reg; 
  // Data hazard 1: if icode s3 = s4, itarete from pipeline_res_reg instead of
  // mem_out_reg
  wire [COUNTBITS-1 : 0] mux_s3_s4;
  assign mux_s3_s4 = (s3_icode_reg == s4_icode_reg) ? mem_out_reg : pipeline_resault_reg;
  always @(posedge clock or negedge reset) pipeline_resault_reg = (!reset) ? (4'b000) : (mux_s3_s4 + 1);

endmodule

