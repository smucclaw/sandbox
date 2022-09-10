# Create a working directory.
mkdir -p workdir

cd workdir

# Linearize all processes to a restricted Greibach normal form.
mcrl22lps -lregular2 ../petri_net_spec.mcrl2 pnet.lps

# Remove superfluous sums.
# This doesn't do anything here.
# lpssumelm -v pnet.lps pnet.1.lps

# Instantiate sums.
# This provides a huge speedup to lps2lts.
lpssuminst -v pnet.lps pnet.1.lps

# Not sure if this helps speed things up later on.
lpsrewr -v -pquantifier-one-point pnet.1.lps pnet.lps

mv pnet.1.lps pnet.lps

lps2lts pnet.lps pnet.lts

# Reduce the state space modulo strong bisimilarity.
ltsconvert -ebisim -n pnet.lts pnet.1.lts
mv pnet.1.lts pnet.lts

lts2lps pnet.lts pnet.lps 

ltsconvert pnet.lts pnet.dot
dot -Tsvg pnet.dot -o pnet.svg