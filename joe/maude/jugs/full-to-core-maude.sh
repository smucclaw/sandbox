#!/bin/bash

maude -batch -no-banner -no-tecla -no-ansi-color jugs-full.maude > jugs-core.maude
# umaudemc graph --purge-fails yes --merge-states state jugs-core "mkJugs (3 5)" "simple(4)"
# dot -Tsvg out.dot out.svg