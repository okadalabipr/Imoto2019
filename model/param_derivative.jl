function get_derivatives(u::Vector{Float64},p::Vector{Float64})
    # derivatives: dF/d[bifurcation_param]
    dFdp::Vector{Float64} = zeros(SN);

    dFdp[pERK] = p[kf]*(p[tERK] - u[pERK] - u[pERK_DUSP]);

    return dFdp
end