# Verification

## Encoder Testbench

`testbench/primary/encoder_tb.sv` exercises the convolutional encoder with a fixed input-bit sequence while observing the encoded 2-bit output and valid signal.

## End-to-End Testbench

`testbench/primary/viterbi_tx_rx_tb.sv` verifies the complete encode/decode chain.

The testbench:

- generates a periodic clock;
- drives a mixture of deterministic and randomized source bits;
- records the transmitted source-bit history;
- waits for decoder pipeline / traceback latency;
- records the decoded-bit history;
- compares 256 recovered bits against the corresponding source bits;
- reports good and bad comparisons.

A VCD waveform dump is also enabled for waveform inspection.

## Error Injection

The end-to-end wrapper deliberately corrupts the encoded stream before the decoder. In the supplied verification configuration, both encoded bits are inverted for two consecutive word positions.

This creates a repeatable transmission-error condition for checking the decoder's error-correction behavior.

## Alternate Testbench

`testbench/alternate/testbench.sv` is an alternate end-to-end testbench variant.

Both end-to-end files declare the same `viterbi_tx_rx_tb` module name, so compile only one at a time.
