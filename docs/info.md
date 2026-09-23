<!---
Datasheet for the CMOS-transistor 74181 Tiny Tapeout analog / custom-GDS project.
-->

## How it works

This project is a **second physical version** of the classic **74181 4-bit ALU**, built from a **complementary CMOS transistor netlist** (`netlist/74181_cmos.cir`, 710 MOSFETs: 355 PMOS + 355 NMOS).

It implements the same ALU idea as the digital Tiny Tapeout project
[`brightwaterfall/ALU74181`](https://github.com/brightwaterfall/ALU74181)
(Verilog / standard cells), but with a **different transistor layout style**
(static CMOS vs the earlier PTL-style CIR / vs synthesised digital).

Functional pins (digital levels on the TT digital pads):

- Inputs: `A[3:0]`, `B[3:0]`, `S[3:0]`, `M`, `Cn_n`
- Outputs: `F[3:0]`, `AeqB`, `P_n`, `G_n`, `Cn4_n`

The SPICE CIR is the source of truth for connectivity. A one-page wired
schematic is included under `schematic/`.

## How to test

1. **Netlist / schematic review:** open `schematic/74181_cmos_full.svg` (or PNG).
2. **SPICE (optional):** simulate `netlist/74181_cmos.cir` with a SPICE engine and SKY130 models when mapping to the PDK.
3. **After Magic layout + GDS:** run LVS against the CIR / extracted netlist, then replace `gds/` + `lef/` and push for TT CI.
4. **On silicon / demo board:** same pin map as the digital 74181 project; exercise S=0..15 with fixed A/B/M/Cn.

## External hardware

- Tiny Tapeout demo board (digital headers for ui/uo/uio)
- Optional: same S-sequencer test PCB concept as the digital project

## Status / next layout steps

This repository is the **analog Tiny Tapeout shell** + CMOS CIR + schematic.

Custom GDS is **not** finished yet. Follow `LAYOUT.md` to import the TT analog DEF
template into Magic, place devices from the CIR, LVS, and export
`gds/tt_um_brightwaterfall_alu74181_cmos.gds` and matching LEF.
