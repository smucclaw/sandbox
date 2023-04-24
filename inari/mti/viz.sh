#!/bin/bash

# $1 = anzscep or safta
# produce
stack run -- $1.md

cat $1.dot | \
  sed 's/\"\\\"/"/ ; s/\\\"\"/"/ ; s/\\8220/“/ ; s/\\8221/”/' | \
  sed -E 's/(ConsS|BaseS)/__/ ; s/ConjS/|/ ; s/mkS/°/' | \
  sed 's/MEANS_EXCEPT_/MEANS EXCEPT/g ; s/BUT_DOES_NOT_INCLUDE/BUT DOES NOT INCLUDE/g' | \
  sed -E 's/\\n/∞/g' | tr '∞' '\n' > /tmp/$1.dot

dot -Tpng /tmp/$1.dot > $1.png
echo "created $1.png"