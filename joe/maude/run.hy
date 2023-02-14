(import
 hyrule
 maude
 networkx :as nx
 pyrsistent :as pyrs)

(require hyrule [-> as-> ->> branch case loop])

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

; (defn split-pdeque [queue]
;   (if (= (len queue) 0)
;     None
;     #((get queue 0) (.popleft queue))))

(defn rewrite-graph->graph [rewrite-graph]
  (setv vertex-queue (.pdeque pyrs [0])
        vertices (.pset pyrs)
        edges (.pset pyrs))
  (while (> (len vertex-queue) 0)
    (setv curr-vertex (-> vertex-queue (get 0))
          vertices (.add vertices curr-vertex)
          vertex-queue (.popleft vertex-queue)
          succ-index 0)
    (while True
      (let [new-vertex (.getNextState rewrite-graph curr-vertex succ-index)]
        (if (or (= new-vertex -1) (in new-vertex vertices))
          (break)
          (setv succ-index (+ 1 succ-index)
                vertex-queue (.append vertex-queue new-vertex)
                edges (.add edges #(curr-vertex new-vertex)))))))
  edges) 

; (defn -strat-graph->edges
;   [strat-graph vertex-queue edges]
;   (-> vertex-queue
;       split-pdeque
;       (match
;        None edges

;        #(curr-vertex vertex-queue)
;        (do
;          (setv index 0
;                vertex-queue1 vertex-queue
;                edges1 edges)
;          (while True
;            (let [new-state-num (.getNextState strat-graph curr-vertex index)]
;              (if (in new-state-num #{curr-vertex -1})
;                (break)
;                (do
;                  (setv index (+ index 1)
;                        vertex-queue1 (.append vertex-queue1 new-state-num)
;                        edges1 (.add edges1 #(curr-vertex new-state-num)))))))
;          (-strat-graph->edges strat-graph vertex-queue1 edges1)))))

; (defn strat-graph->edges [strat-graph]
;   (-strat-graph->edges strat-graph (.pdeque pyrs [0]) (.pset pyrs)))

(defn term-strat->graph [term strat]
  (-> maude
      (.StrategyRewriteGraph term strat)
      rewrite-graph->graph))

(defn edges->graph [edges]
  (-> (.Graph nx)))

(print (term-strat->graph transpiled-term (.parseStrategy main-mod "all ; all")))

; (as-> "all" it
;   ; (trace-str->strat main-mod it)
;   (.parseStrategy main-mod it)
;   (.StrategyRewriteGraph maude transpiled-term it)
;   (do (.getNextState it 0 0) it)
;   (do (.getNextState it 0 1) it)
;   (.getNextState it 0 0)
;   ; (.getTransition it 1 1)
;   ; (.getNrRealStates it)
;   ; (.getStateTerm it 0)
;   ; (do
;   ;   (for [index (range 2)]
;   ;     (.getNextState it index (+ index 1)))
;   ;   it)
;   ; (.getStateTerm it 1)
;   ; (.getNrStates it)
;   (print it))