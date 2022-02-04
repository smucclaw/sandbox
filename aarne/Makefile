all: Law.pgf

LEXCATS=A,A2,CN,Cop,Date,Item,N2,Num,PP,PPart,QCN,Ref,Time,Title,V,V2

.PHONY: Law.pgf

Law.pgf:
	gf --make -output-format=haskell -haskell=lexical -lexical=$(LEXCATS) --haskell=gadt LawEng.gf
