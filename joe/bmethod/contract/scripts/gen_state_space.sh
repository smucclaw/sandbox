export LD_LIBRARY_PATH=/opt/prob/lib:$LD_LIBRARY_PATH
export PATH=/opt/prob:$PATH

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

workdir="../.workdir"
cachedir=${workdir}/cache

mkdir -p ${cachedir}

file_name=${1}
out_file_name=${workdir}/${file_name}.state_space

probcli ../${file_name}.mch -nodead \
  -model_check \
  -p SMT true \
  -p COMPRESSION true \
  -p OPERATION_REUSE full \
  -p LTSMIN ~/ltsmin-v3.0.2/bin \
  -p DOT_ENGINE neato \
  -dotexpr transition_diagram "(breached_by, dom(active_rules), card(rules))" ${out_file_name}.dot

  # -dot state_space_sfdp ${out_file_name}.dot

dot -Tsvg ${out_file_name}.dot -o ${out_file_name}.svg