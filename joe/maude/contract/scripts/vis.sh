#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
workdir="${parent_path}/../.workdir"

cd "${workdir}"

~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states default \
  --format dot \
  main.maude initialConfig \
  "raceCondAux(getAllActions rules)"
  # "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"
  # > out.dot
  # "raceCondAux(rules)"
  # "all *"
  # "raceCondAux('party0 does 'action0)"