include("model/f_parameter.jl");
include("model/f_variable.jl");
include("model/param_derivative.jl");
include("model/steady_state.jl");
include("model/differential_equation.jl");
include("bifurcation.jl");

# BP: name(index) of bifurcation parameter
const BP = mitogen;

p = f_params();

newCurve!(p);

const fp = readdlm("./Data/fp.dat",'\t',Float64,'\n');
const ev = readdlm("./Data/ev.dat",'\t',Float64,'\n');
const br = bistable_regime(ev);