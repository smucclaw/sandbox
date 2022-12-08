export LD_LIBRARY_PATH=/opt/prob/lib:$LD_LIBRARY_PATH
export PATH=/opt/prob:$PATH

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

workdir="../.workdir"
mkdir -p ${workdir}

mch_file_name=${1}
formula_file_name=${2}

out_file_name=${workdir}/${mch_file_name}.${formula_file_name}.evidence

case "${formula_file_name##*.}" in
  (ltl) flag="-ltlformula" ;;
  (ctl) flag="-ctlformula" ;;
esac

probcli ../${mch_file_name}.mch -nodead -noinv \
  -p COMPRESSION true \
  -p OPERATION_REUSE true \
  -p LTSMIN ~/ltsmin-v3.0.2/bin \
  $flag "$(< ../temporal_formulas/${mch_file_name}/${formula_file_name})" \
  -p DOT_ENGINE neato \
  -dot history ${out_file_name}.dot

dot -Tsvg ${out_file_name}.dot -o ${out_file_name}.svg