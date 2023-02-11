(import hyrule)
(import maude)

(require hyrule [->])

(defn eval-trace [trace-str]
  (-> trace-str
      ()))

(.init maude)
(.load maude "../.workdir/main.maude")