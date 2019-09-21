module V
const var_names = [
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
for (idx,name) in enumerate(var_names)
    eval(Meta.parse("const $name = $idx"));
end

const len_f_vars = length(var_names);

end  # module