module C
const param_names = [
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
for (idx,name) in enumerate(param_names)
    eval(Meta.parse("const $name = $idx"));
end

const len_f_params = length(param_names);

end  # module