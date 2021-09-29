(require '[learn-cljs.odoyle-react])
(require '[clara.tools.inspect])
(require '[goog.dom :as gdom])
(require '[goog.events :as gevents])
(require '[odoyle.rules :as o])

(require '[clara.rules :refer [insert! insert retract retract! fire-rules query]])

(in-ns 'learn-cljs.odoyle-react)

(clara.tools.inspect/inspect @live-session)
(clara.tools.inspect/inspect clara-session)

(-> @live-session
    (insert (->CellUpdate "b" 16))
    (fire-rules)
    (update-live-session!))


(-> @live-session
    (insert (->Cell "b" 4))
    (fire-rules)
    (update-live-session!))

(fire-rules @live-session)

(reset! live-session clara-session)

(defquery get-cells
          []
          [?cell <- Cell])

(query @live-session get-cells)
(insert clara-session (->Cell "b" 16))
(insert *2 (->Cell "b" 16))
(fire-rules *2)
(query *1 get-cells)
(query *2 get-updates)
(query *3 get-cellos)

(def c (gdom/getElement "odoyle-cell-c"))

(def rules
  (o/ruleset
    {::query-cells
     [:what
      [id ::value x]]

     ::update-cell-value
     [:what
      [{::cell "a"} ::value v-a]
      [{::cell "b"} ::value v-b]
      :then
      (-> o/*session*
          (o/insert {::cell "c"} ::value (+ v-a v-b))
          o/reset!)]

     ::update-cell-field
     [:what
      [{::cell "c"} ::value v-c]
      :then
      (set! (.-value c) v-c)]
     }))

;; create session and add rule
(def *session
  (atom (reduce o/add-rule (o/->session) rules)))


(swap! *session
       (fn [session]
         (-> session
             (o/insert ::person ::walks false)
             (o/insert ::person ::eats false)
             (o/insert ::person ::drinks false)
             (o/insert ::person ::sings false)
             o/fire-rules)))

(o/query-all @*session ::query-person)

(o/insert *1 {::cell ""} ::value 1)

(in-ns 'learn-cljs.odoyle-react)

(defn ququ-cell [cell]
  (fn [e]
    (let [val (.. e -target -value)]
      (.log js/console val))))

(gevents/listen (gdom/getElement "odoyle-cell-d") "change" (ququ-cell "b"))

(require '[learn-cljs.odoyle-react])
(in-ns 'learn-cljs.odoyle-react)