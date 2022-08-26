mcrl22lps -lregular2 towers_of_hanoi_spec.mcrl2 towers_of_hanoi.lps
lps2lts towers_of_hanoi.lps towers_of_hanoi.lts
ltsconvert -ebisim towers_of_hanoi.lts towers_of_hanoi.bisim.lts
ltsgraph.exe towers_of_hanoi.bisim.lts
