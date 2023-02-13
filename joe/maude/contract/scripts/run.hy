(import
  hyrule
  maude
  graph_tool :as gt
  pyrsistent :as pyrs)

(require hyrule [-> as-> ->>])

(do
  (.init maude)
  (.load maude "../.workdir/main.maude"))

(setv
 main-mod (.getModule maude "MAIN")

 rules
 "
  RULE 'START
  WITHIN 1 DAY PARTY 'party0 MUST DO 'action0
  LEST 'rule2
  HENCE ('rule0 AND 'rule1),

  RULE 'rule0 PARTY 'party0 SHANT WITHIN 1 DAY 'action0,

  RULE 'rule1 PARTY 'party1 MUST DO 'action1 WITHIN 2 DAY HENCE 'rule3,

  RULE 'rule2 WITHIN 2 DAY PARTY 'party2 MUST 'action2 LEST 'rule3,

  RULE 'rule3 PARTY 'party3 MUST WITHIN 4 DAY DO 'action3
  "

 transpiled f"transpile({rules})"

 rules-term (.parseTerm main-mod rules)
 transpiled-term (.parseTerm main-mod transpiled))

(defn trace-str->strat [mod trace-str]
  (->> f"rewriteTrace({trace-str})"
      (.parseStrategy mod)))

(as-> "all" it
  ; (trace-str->strat main-mod it)
  (.parseStrategy main-mod it)
  (.StrategyRewriteGraph maude transpiled-term it)
  (do (.getNextState it 0 0) it)
  (do (.getNextState it 0 1) it)
  ; (.getNextState it 1 0)
  (.getTransition it 1 1)
  ; (.getNrRealStates it)
  ; (.getStateTerm it 0)
  ; (do
  ;   (for [index (range 2)]
  ;     (.getNextState it index (+ index 1)))
  ;   it)
  ; (.getStateTerm it 1)
  ; (.getNrStates it)
  (print it))