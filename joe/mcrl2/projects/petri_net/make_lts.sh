# Create a working directory.
mkdir -p workdir

cd workdir

# Linearize all processes to a restricted Greibach normal form.
mcrl22lps -lregular2 ../petri_net_spec.mcrl2 pnet.lps

lps2lts pnet.lps pnet.lts

# Reduce the state space modulo branching bisimilarity.
ltsconvert -ebranching-bisim -n pnet.lts pnet.1.lts
mv pnet.1.lts caa.lts

ltsconvert pnet.lts pnet.dot
dot -Tsvg pnet.dot -o pnet.svg