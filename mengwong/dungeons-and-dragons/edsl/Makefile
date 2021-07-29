
# see also smucclaw/dsl/caseStudies/Synchronization/Makefile

demo : rundir run/ccSimple.org run/ccMedium.org run/charCreator.org #  pcc safePost

rundir :
	@mkdir -p run viz

%.org : src/Lib.hs src/Petri.hs
	stack run edsl-exe -- --out viz/$(*F) --sketch $(*F) --events events/$(*F).hs > $@

%.png : %.dot
	dot -T png $< -o $@.tmp && mv $@.tmp $@


