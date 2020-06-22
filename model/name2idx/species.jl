module V
const NAMES = [
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
]

#name2idx
for (idx,name) in enumerate(NAMES)
    eval(Meta.parse("const $name = $idx"))
end

const NUM = length(NAMES)

end  # module