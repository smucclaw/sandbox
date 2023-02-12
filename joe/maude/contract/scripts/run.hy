(import hyrule)
(import maude)

(require hyrule)

(defn eval-trace [trace-str]
  (as-> trace-str x
      (+ "rewriteTrace(" x ")")
      (.parseStrategy main_mod x)))

(.init maude)
(.load maude "../.workdir/main.maude")