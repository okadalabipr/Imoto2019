const F_P = [
    # Heldt et al., PNAS (2018)
    "tRb"             #AU  total level of Rb
    "Skp2"            #-  relative SCF^Skp2 level
    "kSyE2f"          #AU/min  constitutive E2F synthesis
    "kSyE2fE2f"       #AU/min  E2F-dependent E2F synthesis
    "jSyE2f"          #AU  Michealis-Menten F_P for E2F synthesis
    "kAsRbE2f"        #1/(AU*min)  association of Rb and E2F
    "kDsRbE2f"        #1/min  dissociation of Rb:E2F complexes
    "kDeE2f"          #1/min  constiutive E2F degradation
    "kPhRbCd"         #1/(AU*min)  CycD:CDK4/6-mediated Rb phosphorylation
    "kPhRbCe"         #1/(AU*min)  CycE:CDK2-mediated Rb phosphorylation
    "kDpRb"           #1/min  dephosphorylation of Rb
    "kDeP21"          #1/min  constitutive p21 degradation
    "kDeP21Cy"        #1/(AU*min)  cyclin:CDK2-mediated p21 degradation (Skp2-dependent)
    "kSyCe"           #1/min  constitutive CycE synthesis
    "kAsCyP21"        #1/(AU*min)  association of cyclin:CDK2 and p21
    "kDsCyP21"        #1/min  dissociation of cyclin:CDK2:p21 complexes
    "kDeCe"           #1/min  constitutive CycE degradation
    "tP21"
    # Added
    "mitogen"
    "pAkt"
    "DUSP"
    "kfRSK"
    "krRSK"
    "kSyCd"
    "kDeCd"
    "kon"
    "koff"
    "kf"
    "kr"
    "tERK"
    "KmRSK"
    "kfFOS"
    "krFOS"
    "KmFOS"
];

#name2idx
for (index,value) in enumerate(F_P)
    eval(Meta.parse("const $value=$index"));
end

function f_params()
    p::Vector{Float64} = zeros(length(F_P));

    p[tRb] = 5.000e+00;
    p[Skp2] = 1.000e+00;
    p[kSyE2f] = 3.000e-02;
    p[kSyE2fE2f] = 4.000e-02;
    p[jSyE2f] = 2.000e-01;
    p[kAsRbE2f] = 5.000e+00;
    p[kDsRbE2f] = 5.000e-03;
    p[kDeE2f] = 5.000e-02;
    p[kPhRbCd] = 2.000e-01;
    p[kPhRbCe] = 3.000e-01;
    p[kDpRb] = 5.000e-02;
    p[kDeP21] = 2.500e-03;
    p[kDeP21Cy] = 7.000e-03;
    p[kSyCe] = 1.000e-02;
    p[kAsCyP21] = 1.000e+00;
    p[kDsCyP21] = 5.000e-02;
    p[kDeCe] = 4.000e-03;
    p[tP21] = 1.500e+00;

    p[mitogen] = 1.000e+01;
    p[DUSP] = 1.000e+00;
    p[pAkt] = 1.000e+00;
    p[kfRSK] = 1.735e+00;
    p[krRSK] = 9.034e-01;
    p[kSyCd] = 4.500e-3;
    p[kDeCd] = 9.000e-3;
    p[kon] = 1.000e-02;
    p[koff] = 2.281e-03;
    p[kf] = 4.650e-02;
    p[kr] = 9.564e-02;
    p[tERK] = 7.236e+01;
    p[KmRSK] = 9.936e+01;
    p[kfFOS] = 6.149e-03;
    p[krFOS] = 1.475e-02;
    p[KmFOS] = 1.123e-01;

    return p
end
