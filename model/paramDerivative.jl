function getDerivatives(u::Vector{Float64},p::Vector{Float64})
    # derivatives: dF/d[bifurcation_param]
    dFdp::Vector{Float64} = zeros(V.len_f_vars);

    dFdp[V.pERK] = p[C.kf]*(p[C.tERK] - u[V.pERK] - u[V.pERK_DUSP]);

    return dFdp
end