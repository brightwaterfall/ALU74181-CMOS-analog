/*
 * Copyright (c) 2026 brightwaterfall
 * SPDX-License-Identifier: Apache-2.0
 *
 * Tiny Tapeout ANALOG / custom-GDS blackbox for the CMOS-transistor 74181.
 *
 * This Verilog stub defines the pin wrapper Tiny Tapeout integrates.
 * The transistor implementation lives in netlist/74181_cmos.cir and will be
 * realized as custom layout (Magic) exported to gds/ + lef/ matching
 * top_module = tt_um_brightwaterfall_alu74181_cmos.
 *
 * Until custom GDS is provided, digital outputs are tied off (no floaters).
 */

`default_nettype none

module tt_um_brightwaterfall_alu74181_cmos (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8 V
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    inout  wire [7:0] ua,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

  // Blackbox / pre-layout: do not leave digital outputs floating.
  assign uo_out  = 8'h00;
  assign uio_out = 8'h00;
  assign uio_oe  = 8'h00;

  wire _unused = &{ena, clk, rst_n, ui_in, uio_in, ua, VGND, VDPWR, 1'b0};

endmodule
