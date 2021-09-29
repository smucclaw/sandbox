(ns learn-cljs.odoyle-react
  (:require [odoyle.rules :as o]
            [goog.dom :as gdom]))

(def walks-ui (gdom/getElement "walks-p"))
(def eats-ui (gdom/getElement "eats-p"))
(def drinks-ui (gdom/getElement "drinks-p"))
(def sings-ui (gdom/getElement "sings-p"))

(def rules
  (o/ruleset
    {::query-person
     [:what
      [::person ::walks walks?]
      [::person ::drinks drinks?]
      [::person ::eats eats?]
      [::person ::sings sings?]
      :then
      (.log js/console
            "walks:" walks?
            "drinks:" drinks?
            "eats:" eats?
            "sings:" sings?)]

     ::update-sings-value
     [:what
      [::person ::walks walks?]
      [::person ::drinks drinks?]
      [::person ::eats eats?]
      :then
      (-> o/*session*
          (o/insert ::person ::sings (and walks? (or drinks? eats?)))
          o/reset!)]

     ::update-sings-ui
     [:what
      [::person ::sings sings?]
      :then
      (set! (.-value sings-ui) (if sings? "yes" "no"))]
     }))

(def *session
  (atom (reduce o/add-rule (o/->session) rules)))

(defn update-cell [cell]
  (fn [e]
    (let [val (= "yes" (.. e -target -value))]
      (swap! *session
             (fn [session]
               (-> session
                   (o/insert ::person cell val)
                   o/fire-rules))))))
