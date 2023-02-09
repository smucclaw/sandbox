#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

workdir="../.workdir"

mkdir -p ${workdir}

maude -no-banner ../main.maude \
  | sed '0,/^Introduced\ module\ MAIN$/d' \
  | sed 's/Bye.//' \
  > ${workdir}/main.maude

# ~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states state \
#   main-core.maude initialConfig \
#   "raceCond(rules)"

  # "raceCondAux('party0 does 'action0)"
  # "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"