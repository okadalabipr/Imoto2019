using Printf;
using DelimitedFiles;
using LinearAlgebra;
using ForwardDiff: jacobian;


const SN = V.len_f_vars;     # num of state variables
const PN = 1;                # num of parameters
const VN = SN+PN;            # num of variables
const MN = SN;               # dim of Newton's method

const MC = 100000;           # maximum of counts
const IVAL = 1e-2;           # first variation
const RATE = 1e-3;           # variation rate
const NEPS = 1e-12;          # eps of Newton's method

include("gauss.jl");
include("newton.jl");
include("continuation.jl");


function bistableRegime(ev::Matrix{Float64})
    br::Vector{Int} = [];

    for i=1:size(ev,1)
        if maximum(ev[i,[2j for j=1:SN]]) > 0.0
            push!(br,i);
        end
    end

    return br
end