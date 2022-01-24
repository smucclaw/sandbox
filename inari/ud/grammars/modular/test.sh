echo "basic tests"
cat ../rgl-wordnet/tests/basic.conllu | gf-ud ud2gf UDApp Eng UDS at lin | diff -u - ../rgl-wordnet/tests/basic.conllu.gold

echo ""
echo "more complex tests"
cat ../rgl-wordnet/tests/succeeds.conllu | gf-ud ud2gf UDApp Eng UDS at lin | diff -u - ../rgl-wordnet/tests/succeeds.conllu.gold
