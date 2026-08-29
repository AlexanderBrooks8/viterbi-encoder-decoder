module ACS
(  input       path_0_valid,
   input       path_1_valid,
   input [1:0] path_0_bmc,
   input [1:0] path_1_bmc,
   input [7:0] path_0_pmc,
   input [7:0] path_1_pmc,

   output logic        selection,
   output logic        valid_o,
   output      [7:0] path_cost);

   wire  [7:0] path_cost_0;
   wire  [7:0] path_cost_1;


  assign path_cost_0 = path_0_pmc + path_0_bmc;
  assign path_cost_1 = path_1_pmc + path_1_bmc;

  always_comb begin
    if (!path_0_valid && !path_1_valid) begin
      selection = 1'b0;
    end
    if (!path_0_valid && path_1_valid) begin
      selection = 1'b1;
    end
    if (path_0_valid && !path_1_valid) begin
      selection = 1'b0;
    end
    if ((path_0_valid && path_1_valid) && (path_cost_0 > path_cost_1)) begin
      selection = 1'b1;
    end
    if ((path_0_valid && path_1_valid) && (path_cost_0 <= path_cost_1)) begin
      selection = 1'b0;
    end
  end

  assign valid_o = (path_0_valid | path_1_valid) ?  1'b1 : 1'b0;
  assign path_cost = (valid_o) ? ((selection == 1'b1) ? path_cost_1 : path_cost_0) : 8'b0;


endmodule
