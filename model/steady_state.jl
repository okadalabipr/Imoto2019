function diffeq_ss(du,u,p,t)
    Rb    = u[uRb]  - u[tE2f]  + u[E2f];
    pRb   = p[tRb]  - u[uRb];
    RbE2f = u[tE2f] - u[E2f];

    uERK = p[tERK] - u[pERK] - u[pERK_DUSP];

    Ce  = u[tCe]  - u[CeP21];

    P21 = p[tP21]-u[CeP21];
    ###
    rSyE2f = p[kSyE2f] + p[kSyE2fE2f]*u[E2f]/(p[jSyE2f] + u[E2f]);
    rPhRb  = p[kPhRbCd]*u[Cd] + p[kPhRbCe]*Ce;
    rDeP21 = p[kDeP21] + p[kDeP21Cy]*p[Skp2]*Ce + p[pAkt];

    ###
    du[pERK] = (p[kf]*p[mitogen]*uERK - p[kr]*u[pERK]) - (p[kon]*p[DUSP]*u[pERK] - p[koff]*u[pERK_DUSP]);
    du[pERK_DUSP] = p[kon]*p[DUSP]*u[pERK] - p[koff]*u[pERK_DUSP];
    du[pRSK] = p[kfRSK]*u[pERK]/(p[KmRSK]+u[pERK]) - p[krRSK]*u[pRSK];
    du[cFos] = p[kfFOS]*u[pERK]*u[pRSK]/(p[KmFOS]+u[pRSK]) - p[krFOS]*u[cFos];
    du[Cd] = p[kSyCd]*u[cFos] - p[kDeCd]*u[Cd];
    du[uRb]  = - rPhRb*u[uRb] + p[kDpRb]*pRb;
    du[tE2f] = rSyE2f - p[kDeE2f]*u[tE2f];
    du[E2f]  = rSyE2f - p[kDeE2f]*u[E2f] - p[kAsRbE2f]*Rb*u[E2f] + (p[kDsRbE2f]+rPhRb)*RbE2f;
    du[tCe]  = p[kSyCe] *u[E2f] - p[kDeCe]*u[tCe];
    du[CeP21] = p[kAsCyP21]*P21*Ce - (p[kDsCyP21]+p[kDeCe]+rDeP21)*u[CeP21];
end

function get_steady_state(p::Vector{Float64})
    tspan_ss::Tuple{Float64,Float64} = (0.0,1000.0);
    u0::Vector{Float64} = zeros(SN);

    prob = ODEProblem(diffeq_ss,u0,tspan_ss,p);
    sol = solve(prob,CVODE_BDF());

    return sol.u[end]
end