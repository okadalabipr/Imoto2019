function get_derivatives(u::Vector{Float64},p::Vector{Float64})
    # derivatives: dF/d[bifurcation_param]
    dFdp::Vector{Float64} = zeros(V.NUM)

    dFdp[V.pERK] = p[C.kf]*(p[C.tERK] - u[V.pERK] - u[V.pERK_DUSP])

    return dFdp
end