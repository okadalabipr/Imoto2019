#---
include("model/f_parameter.jl");
include("model/f_variable.jl");
include("model/param_derivative.jl");
include("model/steady_state.jl");
include("model/differential_equation.jl");
include("Bifurcation/bifurcation.jl");

# BP: name(index) of bifurcation parameter
const BP = mitogen;

p = f_params();

newCurve(p);
fp = readdlm("./Data/fp.dat",'\t',Float64,'\n');
ev = readdlm("./Data/ev.dat",'\t',Float64,'\n');
br = bistable_regime(ev);
include("plotFunc.jl");
savefig("./activeE2F.png",bbox_inches="tight");
