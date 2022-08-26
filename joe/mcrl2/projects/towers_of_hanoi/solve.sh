mcrl22lps -lregular2 towers_of_hanoi_spec.mcrl2 towers_of_hanoi.lps
lps2pbes -c -f ./properties/solvable.mcf towers_of_hanoi.lps towers_of_hanoi.pbes
pbessolve -v --file=towers_of_hanoi.lps towers_of_hanoi.pbes
lps2lts towers_of_hanoi.pbes.evidence.lps towers_of_hanoi.pbes.evidence.lts
ltsgraph.exe towers_of_hanoi.pbes.evidence.lts
