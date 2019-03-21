#---
include("model/f_parameter.jl");
include("model/f_variable.jl");
include("model/param_derivative.jl");
include("model/steadystate.jl");
include("model/differential_equation.jl");
include("Bifurcation/bifurcation.jl");

# BP: name(index) of bifurcation parameter
const BP = mitogen;

p = f_params();
p[kon] = 1.0e-2;
p[pAkt] = 1.0;

newCurve(p);
fp = readdlm("./Data/fp.dat",'\t',Float64,'\n');
ev = readdlm("./Data/ev.dat",'\t',Float64,'\n');
br = bistable_regime(ev);
include("plot_func.jl");
savefig("./activeE2F.png",bbox_inches="tight");
