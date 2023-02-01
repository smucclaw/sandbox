#!/bin/bash

maude jugs-full.maude > jugs-core.maude
# umaudemc graph jugs-core "mkJugs (3 4)" "simple(5)" > out.dot