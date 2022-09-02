# This script uses mcrl2's model checker to verify properties/$1.mcf and
# outputs the evidence in $Dir.

Dir=workdir/verification_evidence/$1

mkdir -p $Dir
cd $Dir

if [[ ${2:-""} = "symbolic" ]]
then
  lps2pbes -f../../../properties/$1.mcf ../../caa.lps $1.pbes
  pbessymbolicbisim -v -rjittyc $1.pbes
else
  # Generate a system of parameterized boolean equations, including enough
  # information to generate witnesses (resp counter-egs) from successful
  # (resp failed) verifications.
  lps2pbes -c -f../../../properties/$1.mcf ../../caa.lps $1.pbes

  # Solve the system of equations, outputting the result to a linearized process
  # in $1.evidence.lps
  pbessolve.exe -v --threads=6 --file=../../caa.lps $1.pbes
  # Convert the output evidence to a LTS, then to dot and svg for visualization. 
  # Note that the resulting svg can be huge and thus not very useful to look at.
  lps2lts $1.pbes.evidence.lps $1.evidence.lts
  ltsconvert -etrace $1.evidence.lts $1.evidence.dot
  dot -Tsvg $1.evidence.dot -o $1.evidence.svg
fi