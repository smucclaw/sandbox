#!/bin/bash

~/.local/bin/umaudemc graph -m MAIN --purge-fails yes --merge-states state \
  main-core.maude initialConfig \
  "raceCond(rules)"
  # "raceCondAux('party0 does 'action0)"
  # "rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)"