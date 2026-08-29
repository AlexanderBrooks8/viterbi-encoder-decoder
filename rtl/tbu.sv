module tbu
(
   input       clk,
   input       rst,
   input       enable,
   input       selection,
   input [7:0] d_in_0,
   input [7:0] d_in_1,
   output logic  d_o,
   output logic  wr_en);

   logic         d_o_reg;
   logic         wr_en_reg;

   logic   [2:0] pstate;
   logic   [2:0] nstate;

   logic         selection_buf;

   always @(posedge clk)    begin
      selection_buf  <= selection;
      wr_en          <= wr_en_reg;
      d_o            <= d_o_reg;
   end
   always @(posedge clk, negedge rst) begin
      if(!rst)
         pstate <= 3'b000;
      else if(enable)
         pstate <= nstate;
      else
         pstate <= pstate;
   end


	always_comb begin
      wr_en_reg = selection;

      if(selection)
         d_o_reg = d_in_1[pstate];
      else
         d_o_reg = 1'b0;

      if(selection == 1'b0) begin
         if(d_in_0[pstate] == 1'b0) begin
            case(pstate)
               3'b000: nstate = 3'b000;
               3'b001: nstate = 3'b011;
               3'b010: nstate = 3'b100;
               3'b011: nstate = 3'b111;
               3'b100: nstate = 3'b001;
               3'b101: nstate = 3'b010;
               3'b110: nstate = 3'b101;
               3'b111: nstate = 3'b110;
            endcase
         end
         else begin
            case(pstate)
               3'b000: nstate = 3'b001;
               3'b001: nstate = 3'b010;
               3'b010: nstate = 3'b101;
               3'b011: nstate = 3'b110;
               3'b100: nstate = 3'b000;
               3'b101: nstate = 3'b011;
               3'b110: nstate = 3'b100;
               3'b111: nstate = 3'b111;
            endcase
         end
      end
      else begin
         if(d_in_1[pstate] == 1'b0) begin
            case(pstate)
               3'b000: nstate = 3'b000;
               3'b001: nstate = 3'b011;
               3'b010: nstate = 3'b100;
               3'b011: nstate = 3'b111;
               3'b100: nstate = 3'b001;
               3'b101: nstate = 3'b010;
               3'b110: nstate = 3'b101;
               3'b111: nstate = 3'b110;
            endcase
         end
         else begin
            case(pstate)
               3'b000: nstate = 3'b001;
               3'b001: nstate = 3'b010;
               3'b010: nstate = 3'b101;
               3'b011: nstate = 3'b110;
               3'b100: nstate = 3'b000;
               3'b101: nstate = 3'b011;
               3'b110: nstate = 3'b100;
               3'b111: nstate = 3'b111;
            endcase
         end
      end
   end

endmodule
