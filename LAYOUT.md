# Layout path (Magic / custom GDS)

This is an **analog / custom-GDS** Tiny Tapeout project. GitHub Actions will not
auto-synthesize the CMOS CIR into transistors. You (or the layout flow) must
produce GDS/LEF.

## Specs (SKY130)

- Template size: **2x2** (see `info.yaml`)
- Top cell: `tt_um_brightwaterfall_alu74181_cmos`
- DEF templates:
  https://github.com/TinyTapeout/tt-support-tools/tree/main/tech/sky130A/def/analog
  Use `tt_analog_2x2.def` (1.8 V VDPWR; no VAPWR for this config)
- Official analog instructions:
  https://tinytapeout.com/specs/analog/

## Steps

1. Install Magic matching the sky130A PDK.
2. Download `tt_analog_2x2.def` and start from it (do not move pins).
3. Map `74181_cmos.cir` devices into layout (or hierarchical cells).
4. Connect power stripes per TT analog power rules (met4, etc.).
5. LVS against the CIR / extracted SPICE.
6. Export:

```
lef write ../lef/tt_um_brightwaterfall_alu74181_cmos.lef -pinonly
gds write ../gds/tt_um_brightwaterfall_alu74181_cmos.gds
```

7. Commit `gds/` and `lef/` (filenames must match `top_module`), push, and submit
   as a **separate** project on app.tinytapeout.com (SKY shuttle, analog tiles).

## Relation to digital project

| Repo | Style | TT type |
|------|-------|---------|
| `brightwaterfall/ALU74181` | Digital Verilog ALU | Digital 1x1 |
| `brightwaterfall/ALU74181-CMOS-analog` (this) | CMOS transistor CIR | Analog / custom GDS 2x2 |

Same ALU function; different implementation path and **separate shuttle submission**.
