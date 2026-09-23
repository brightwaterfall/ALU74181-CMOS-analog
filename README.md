![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# Tiny Tapeout Analog — 74181 CMOS transistor ALU

Separate Tiny Tapeout project for the **CMOS transistor-layout** version of the 74181 ALU.

- **Digital sibling (already submitted path):** https://github.com/brightwaterfall/ALU74181  
- **This repo:** analog / custom-GDS shell + `74181_cmos.cir` + schematic  
- **Docs:** [docs/info.md](docs/info.md) · [LAYOUT.md](LAYOUT.md) · [SUBMIT_ANALOG.txt](SUBMIT_ANALOG.txt)

## What’s included

| Path | Contents |
|------|----------|
| `netlist/74181_cmos.cir` | 710-MOSFET complementary CMOS ALU netlist |
| `schematic/` | Wired SVG/PNG of the CIR |
| `src/project.v` | TT analog blackbox wrapper |
| `info.yaml` | Analog project metadata (2x2, top module) |
| `gds/` `lef/` | Place finished Magic exports here |

## Important

Custom transistor GDS is **not** auto-generated from the CIR. Follow `LAYOUT.md` before a final shuttle lock. Until then outputs are tied off in the Verilog stub (safe blackbox).

## Tiny Tapeout

Create a **new** project on https://app.tinytapeout.com/ under **SKY** (analog tiles), link **this** repo — do not reuse the digital project’s tile allocation.
