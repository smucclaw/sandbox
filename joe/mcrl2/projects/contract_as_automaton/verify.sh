# This script uses mcrl2's model checker to verify properties/$1.mcf and
# outputs the evidence in $Dir.

Dir=workdir/verification_evidence/$1

mkdir -p $Dir
cd $Dir

if [[ ${2:-""} = "symbolic" ]]
then
  lts2pbes -f../../../properties/$1.mcf ../../caa.lts $1.pbes
  pbessymbolicbisim -v $1.pbes
else
  # Generate a system of parameterized boolean equations, including enough
  # information to generate witnesses (resp counter-egs) from successful
  # (resp failed) verifications.
  lts2pbes -v -c -f../../../properties/$1.mcf ../../caa.lts $1.pbes

  # Solve the system of equations, outputting the result to a linearized process
  # in $1.evidence.lps
  pbessolve -v --file=../../caa.lts $1.pbes

  # Convert the output evidence to a LTS, then to dot and svg for visualization. 
  # Note that the resulting svg can be huge and so may not be very useful.
  ltsconvert -ebisim $1.pbes.evidence.lts $1.evidence.dot
  dot -Tsvg $1.evidence.dot -o $1.evidence.svg
fi