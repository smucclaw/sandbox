# Create a working directory.
mkdir -p workdir

cd workdir

# Linearize all processes.
mcrl22lps ../contract_as_automaton_spec.mcrl2 caa.lps

# Convert the linearized process into a labelled transition system, while
# giving priority to internal tau actions/transitions.
# This means the LTS will automatically take tau transitions when they're
# available, so that the resulting LTS will no longer have any such transitions.
lps2lts -ctau caa.lps caa.lts

# Reduce the state space modulo branching bisimilarity.
ltsconvert -ebranching-bisim -n caa.lts caa.1.lts
mv caa.1.lts caa.lts

# Convert LTS -> dot -> svg for visualization.
# Note that the resulting svg will be big and difficult to read.
ltsconvert caa.lts caa.dot
dot -Tsvg caa.dot -o caa.svg

# Convert the LTS back to a linearized process so that we can simulate it using
# lpssim and lpsxsim.
lts2lps caa.lts caa.lps