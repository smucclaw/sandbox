# Create a working directory.
mkdir -p workdir

cd workdir

# Linearize all processes.
#  mcrl22lps ../contract_spec.mcrl2 -lregular2 contract.lps

mcrl22lps ../contract_spec_timed.mcrl2 --timed -lregular2 contract.lps

# Convert the linearized process into a labelled transition system, while
# giving priority to internal tau actions/transitions.
# This means the LTS will automatically take tau transitions when they're
# available, so that the resulting LTS will no longer have any such transitions.
# lps2lts -ctau contract.lps contract.lts

# Reduce the state space modulo strong bisimilarity.
# ltsconvert -ebisim -n contract.lts contract.1.lts
# mv contract.1.lts contract.lts

# Convert LTS -> dot -> svg for visualization.
# Note that the resulting svg will be big and difficult to read.
# ltsconvert contract.lts contract.dot
# dot -Tsvg contract.dot -o contract.svg

# Convert the LTS back to a linearized process so that we can simulate it using
# lpssim and lpsxsim.
# lts2lps contract.lts contract.lps