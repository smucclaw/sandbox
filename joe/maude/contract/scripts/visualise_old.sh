#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
workdir="${parent_path}/../.workdir"

cd "${workdir}"

# https://superuser.com/questions/380772/removing-ansi-color-codes-from-text-stream
~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states state \
  --format dot \
  main.maude initialConfig \
  "all *" | sed -e 's/\x1b\[[0-9;]*m//g' > out.dot
  
dot -Tsvg out.dot -o out.svg
  # "raceCondAux(getAllActions rules)"
  # "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"
  # > out.dot
  # "raceCondAux(rules)"
  # "all *"
  # "raceCondAux('party0 does 'action0)"