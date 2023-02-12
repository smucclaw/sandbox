(import
  hyrule
  maude
  graph_tool :as gt
  pyrsistent :as pyrs)

(require hyrule [-> as-> ->>])

(setv main-mod
  (do (.init maude)
      (.load maude "../.workdir/main.maude")
      (.getModule maude "MAIN")))

(setv rules
  "
  RULE 'START
  WITHIN 1 DAY PARTY 'party0 MUST DO 'action0
  LEST 'rule2
  HENCE ('rule0 AND 'rule1),

  RULE 'rule0 PARTY 'party0 SHANT WITHIN 1 DAY 'action0,

  RULE 'rule1 PARTY 'party1 MUST DO 'action1 WITHIN 2 DAY HENCE 'rule3,

  RULE 'rule2 WITHIN 2 DAY PARTY 'party2 MUST 'action2 LEST 'rule3,

  RULE 'rule3 PARTY 'party3 MUST WITHIN 4 DAY DO 'action3
  ")

(setv transpiled
  (+ "transpile (" rules ")"))

(defn eval-trace [trace-str]
  (as-> trace-str x
      (+ "rewriteTrace(" x ")")
      (.parseStrategy main-mod x)))

(setv rules-term
  (.parseTerm main-mod rules))

(setv transpiled-term
  (.parseTerm main-mod transpiled))

(let [strat (.parseStrategy main-mod "idle")]
  (as-> transpiled-term x
        (.StrategyRewriteGraph maude x strat)
        (print x)))