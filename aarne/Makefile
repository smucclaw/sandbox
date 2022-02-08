all: Law.pgf

LEXCATS=A,A2,CN,Cop,Date,Item,N2,Num,PP,PP2,PPart,QCN,Ref,Time,Title,VP,VP2

.PHONY: Law.pgf

Law.pgf:
	gf --make -output-format=haskell -haskell=lexical -lexical=$(LEXCATS) --haskell=gadt LawEng.gf
