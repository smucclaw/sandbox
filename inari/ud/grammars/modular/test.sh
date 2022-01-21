cat ../rgl-wordnet/tests/succeeds.conllu | gf-ud ud2gf UDApp Eng UDS at lin | diff -u - ../rgl-wordnet/tests/succeeds.conllu.gold
