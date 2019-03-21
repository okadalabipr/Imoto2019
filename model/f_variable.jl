const F_V = [
    "pERK"
    "pERK_DUSP"
    "pRSK"
    "cFos"
    "Cd"
    "uRb"
    "tE2f"
    "E2f"
    "tCe"
    "CeP21"
];

#name2idx
for (index,value) in enumerate(F_V)
    eval(Meta.parse("const $value=$index"));
end