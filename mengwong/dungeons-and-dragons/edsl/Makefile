
# see also smucclaw/dsl/caseStudies/Synchronization/Makefile

demo : rundir ccSimple charCreator #  pcc safePost

rundir : run/
	@mkdir -p run

ccSimple    : run/ccSimple.org
charCreator : run/charCreator.org

%.org : src/Lib.hs src/Petri.hs
	stack run edsl-exe -- --out viz/$(*F) --sketch $(*F) --events events/$(*F).hs > $@

%.png : %.dot
	dot -T png $< -o $@.tmp && mv $@.tmp $@


