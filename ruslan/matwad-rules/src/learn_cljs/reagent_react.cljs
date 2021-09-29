(ns learn-cljs.reagent-react
  (:require [reagent.core :as r]                         ;; <1>
            [reagent.ratom :as ratom]                    ;; <2>
            [goog.dom :as gdom]))

(def a-cell (r/atom 0))                                    ;; <3>
(def b-cell (r/atom 0))
(def c-cell
  (ratom/make-reaction                                     ;; <4>
    #(+ @a-cell @b-cell)))

(def a (gdom/getElement "cell-a"))
(def b (gdom/getElement "cell-b"))
(def c (gdom/getElement "cell-c"))

(defn update-cell [cell]
  (fn [e]
    (let [num (js/parseInt (.. e -target -value))]
      (reset! cell num))))
