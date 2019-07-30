# Imoto_and_Okada_2019
Imoto, H. & Okada, M. Signal-dependent regulation of early-response genes and cell cycle: a quantitative view. *Curr. Opin. Syst. Biol.* **15**, 100–108 (2019). https://doi.org/10.1016/j.coisb.2019.04.003

## Requirement
- **[Julia 1.0+](https://julialang.org)**
    - [SteadyStateDiffEq](https://github.com/JuliaDiffEq/SteadyStateDiffEq.jl)
    - [Sundials](https://github.com/JuliaDiffEq/Sundials.jl)
    - [ForwardDiff](https://github.com/JuliaDiff/ForwardDiff.jl)
    - [PyPlot](https://github.com/JuliaPy/PyPlot.jl)

## Run Simulation and View Results
```julia
include("bifurcation.jl")
using .Bifurcation

Bifurcation.analysis()
Bifurcation.diagram()
```

## Installation
    $ git clone https://github.com/okadalabipr/Imoto_and_Okada_2019.git