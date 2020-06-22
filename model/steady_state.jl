function diffeq(du,u,p,t)
    Rb    = u[V.uRb]  - u[V.tE2f]  + u[V.E2f]
    pRb   = p[C.tRb]  - u[V.uRb]
    RbE2f = u[V.tE2f] - u[V.E2f]

    uERK = p[C.tERK] - u[V.pERK] - u[V.pERK_DUSP]

    Ce  = u[V.tCe]  - u[V.CeP21]

    P21 = p[C.tP21]-u[V.CeP21]
    ###
    rSyE2f = p[C.kSyE2f] + p[C.kSyE2fE2f]*u[V.E2f]/(p[C.jSyE2f] + u[V.E2f])
    rPhRb  = p[C.kPhRbCd]*u[V.Cd] + p[C.kPhRbCe]*Ce
    rDeP21 = p[C.kDeP21] + p[C.kDeP21Cy]*p[C.Skp2]*Ce + p[C.pAkt]

    ###
    du[V.pERK] = (p[C.kf]*p[C.mitogen]*uERK - p[C.kr]*u[V.pERK]) - (p[C.kon]*p[C.DUSP]*u[V.pERK] - p[C.koff]*u[V.pERK_DUSP])
    du[V.pERK_DUSP] = p[C.kon]*p[C.DUSP]*u[V.pERK] - p[C.koff]*u[V.pERK_DUSP]
    du[V.pRSK] = p[C.kfRSK]*u[V.pERK]/(p[C.KmRSK]+u[V.pERK]) - p[C.krRSK]*u[V.pRSK]
    du[V.cFos] = p[C.kfFOS]*u[V.pERK]*u[V.pRSK]/(p[C.KmFOS]+u[V.pRSK]) - p[C.krFOS]*u[V.cFos]
    du[V.Cd] = p[C.kSyCd]*u[V.cFos] - p[C.kDeCd]*u[V.Cd]
    du[V.uRb]  = - rPhRb*u[V.uRb] + p[C.kDpRb]*pRb
    du[V.tE2f] = rSyE2f - p[C.kDeE2f]*u[V.tE2f]
    du[V.E2f]  = rSyE2f - p[C.kDeE2f]*u[V.E2f] - p[C.kAsRbE2f]*Rb*u[V.E2f] + (p[C.kDsRbE2f]+rPhRb)*RbE2f
    du[V.tCe]  = p[C.kSyCe] *u[V.E2f] - p[C.kDeCe]*u[V.tCe]
    du[V.CeP21] = p[C.kAsCyP21]*P21*Ce - (p[C.kDsCyP21]+p[C.kDeCe]+rDeP21)*u[V.CeP21]

end

function get_steady_state(p::Vector{Float64})
    tspan_ss::Tuple{Float64,Float64} = (0.0,Inf)
    u0::Vector{Float64} = zeros(V.NUM)

    prob = ODEProblem(diffeq,u0,tspan_ss,p)
    prob = SteadyStateProblem(prob)
    sol = solve(prob,DynamicSS(CVODE_BDF()),dt=1.0)

    return sol.u
end