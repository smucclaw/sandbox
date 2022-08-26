mcrl22lps -lregular2 contract_as_automaton_spec.mcrl2 caa.lps
lps2pbes -f ./properties/prop3.mcf caa.lps caa.pbes
pbessolvesymbolic -v caa.pbes
# lps2lts caa.pbes.evidence.lps caa.pbes.evidence.lts
# ltsgraph.exe caa.pbes.evidence.lts
