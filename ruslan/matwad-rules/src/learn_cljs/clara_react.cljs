(ns learn-cljs.clara-react
  (:require-macros [clara.macros :refer [defrule defsession defquery]])
  (:require [clara.rules :refer [insert! insert retract retract! fire-rules query]]
            [reagent.ratom :as ratom]                       ;; <2>
            [goog.dom :as gdom]
            [goog.events :as gevents]))

(def a-cell (atom 0))                                       ;; <3>
(def b-cell (atom 0))
(def c-cell (atom 0))

(defrecord Cell [id value])

(def a (gdom/getElement "clara-cell-a"))
(def b (gdom/getElement "clara-cell-b"))
(def c (gdom/getElement "clara-cell-c"))

(defrule recalculate-cell
  "Find the client representative and request support."
  [Cell (= id "a") (= ?a-value value)]
  [Cell (= id "b") (= ?b-value value)]
  =>
  (.log js/console "Notify" ?a-value "that"
        ?b-value "has a new support request!"))


(defquery get-cells
  "Query to find promotions for the purchase."
  []
  [?cell <- Cell])

(defsession clara-session 'learn-cljs.clara-react)


(defn update-cell [cell-id]
  (fn [e]
    (let [num (js/parseInt (.. e -target -value))]
      (-> @live-session
          (insert (->CellUpdate cell-id num))
          (fire-rules)
          (update-live-session!)))))

(gevents/listen a "change" (update-cell "a"))
(gevents/listen b "change" (update-cell "b"))
