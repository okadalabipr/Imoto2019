function f_params()::Vector{Float64}
    p::Vector{Float64} = zeros(C.len_f_params);

    p[C.tRb] = 5.000e+00;
    p[C.Skp2] = 1.000e+00;
    p[C.kSyE2f] = 3.000e-02;
    p[C.kSyE2fE2f] = 4.000e-02;
    p[C.jSyE2f] = 2.000e-01;
    p[C.kAsRbE2f] = 5.000e+00;
    p[C.kDsRbE2f] = 5.000e-03;
    p[C.kDeE2f] = 5.000e-02;
    p[C.kPhRbCd] = 2.000e-01;
    p[C.kPhRbCe] = 3.000e-01;
    p[C.kDpRb] = 5.000e-02;
    p[C.kDeP21] = 2.500e-03;
    p[C.kDeP21Cy] = 7.000e-03;
    p[C.kSyCe] = 1.000e-02;
    p[C.kAsCyP21] = 1.000e+00;
    p[C.kDsCyP21] = 5.000e-02;
    p[C.kDeCe] = 4.000e-03;
    p[C.tP21] = 1.500e+00;

    p[C.mitogen] = 1.000e+01;
    p[C.DUSP] = 1.000e+00;
    p[C.pAkt] = 1.000e+00;
    p[C.kfRSK] = 1.735e+00;
    p[C.krRSK] = 9.034e-01;
    p[C.kSyCd] = 4.500e-3;
    p[C.kDeCd] = 9.000e-3;
    p[C.kon] = 1.000e-02;
    p[C.koff] = 2.281e-03;
    p[C.kf] = 4.650e-02;
    p[C.kr] = 9.564e-02;
    p[C.tERK] = 7.236e+01;
    p[C.KmRSK] = 9.936e+01;
    p[C.kfFOS] = 6.149e-03;
    p[C.krFOS] = 1.475e-02;
    p[C.KmFOS] = 1.123e-01;

    return p
end