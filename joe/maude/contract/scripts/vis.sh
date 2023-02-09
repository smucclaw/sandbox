#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
workdir="../.workdir"

cd ${workdir}

~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states default \
  -o out.dot --format dot \
  main.maude initialConfig \
  "all *"
  # "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"
  # "raceCond(rules)"
  # "raceCondAux('party0 does 'action0)"