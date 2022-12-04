# export LD_LIBRARY_PATH=/opt/prob/lib:$LD_LIBRARY_PATH
# export PATH=/opt/prob:$PATH

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

workdir="../.workdir"

mkdir -p ${workdir}

file_name=${1}
out_file_name=${workdir}/${file_name}.state_space

probcli ../${file_name}.mch -nodead \
  -model_check \
  -p COMPRESSION true \
  -p OPERATION_REUSE full \
  -dotexpr transition_diagram "(initial_rules, dom(active_rules), breached_by)" ${out_file_name}.dot
  # -mc_with_lts_sym -p LTSMIN ~/ltsmin-v3.0.2/bin

  # -dot state_space_sfdp ${out_file_name}.dot

dot -Tsvg ${out_file_name}.dot -o ${out_file_name}.svg