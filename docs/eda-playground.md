# EDA Playground Setup

The source originated from an EDA Playground workflow.

## Suggested Configuration

- HDL: SystemVerilog
- Simulator: Siemens Questa
- Design files: all files under `rtl/`
- Testbench: one testbench from `testbench/primary/` or `testbench/alternate/`

`rtl/design.sv` is a convenience include file that references the RTL modules by filename.

If using `design.sv`, make sure the RTL files are available in the same include path.

## Testbench Selection

For encoder-only verification:

- top module: `encoder_tb`

For complete encoder/decoder verification:

- top module: `viterbi_tx_rx_tb`

There are two end-to-end testbench variants. Do not compile both simultaneously because both use the same module name.

## Synthesis

The design was used with a Precision Synthesis workflow in the context of a Basys 3 / Xilinx Artix-7 FPGA target.

Generated synthesis netlists are not included in this repository.
