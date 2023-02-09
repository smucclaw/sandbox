#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
workdir="../.workdir"

cd ${workdir}

~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states default \
  --format dot \
  main.maude initialConfig \
  "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"
  # "raceCondAux(rules)"
  # "all *"
  # "raceCondAux('party0 does 'action0)"