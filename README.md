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
include("model/f_parameter.jl");
include("model/f_variable.jl");
include("model/param_derivative.jl");
include("model/steady_state.jl");
include("model/differential_equation.jl");
include("bifurcation.jl");

# BP: name(index) of bifurcation parameter
const BP = mitogen;

p = f_params();

newCurve(p);
fp = readdlm("./Data/fp.dat",'\t',Float64,'\n');
ev = readdlm("./Data/ev.dat",'\t',Float64,'\n');
br = bistable_regime(ev);

include("plotFunc.jl");
# savefig("./activeE2F.png",bbox_inches="tight");
show();
```

## Installation
    $ git clone https://github.com/okadalabipr/Imoto_and_Okada_2019.git