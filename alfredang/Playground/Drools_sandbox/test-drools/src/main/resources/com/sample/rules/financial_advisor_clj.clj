(ns clarafa
  (:require [clara.rules :as c]))

(defrecord SavingsAccount [arg0 arg1 arg2])
(defrecord Investment [arg0 arg1 arg2])
(defrecord Income [arg0 arg1 arg2])
(defrecord AmountSaved [arg0 arg1 arg2])
(defrecord Dependents [arg0 arg1 arg2])

(defn minsavings [x]
  (* 5000 x))
(defn minincome [x]
  (+ 15000 (* 4000 x)))

(c/defrule r1
  [SavingsAccount (= arg0 ?j) (= arg1 ?p)
   (= arg2 "inadequate")]
  =>
  (c/insert! (->Investment #:just-r1{:pri0 ?j :arg0 ?p} ?p "savings")))

(c/defrule r2
  [SavingsAccount (= arg0 ?j0) (= arg1 ?p) (= arg2 "adequate")]
  [Income (= arg0 ?j1) (= arg1 ?p) (= arg2 "adequate")]
  =>
  (c/insert! (->Investment #:just-r2{:pri0 ?j0 :pri1 ?j1 :arg0 ?p} ?p "stocks")))

(c/defrule r3
  [SavingsAccount (= arg0 ?j0) (= arg1 ?p) (= arg2 "adequate")]
  [Income (= arg0 ?j1) (= arg1 ?p) (= arg2 "inadequate")]
  =>
  (c/insert! (->Investment #:just-r3{:pri0 ?j0 :pri1 ?j1 :arg0 ?p} ?p "combination")))

(c/defrule r4
  [AmountSaved (= arg0 ?j0) (= arg1 ?p) (= arg2 ?x)]
  [Dependents (= arg0 ?j1) (= arg1 ?p) (= arg2 ?y)]
  [:test (> ?x (minsavings ?y))]
  =>
  (c/insert! (->SavingsAccount
              #:just-r4{:pri0 ?j0
                        :pri1 ?j1
                        :arg0 ?p
                        :arg1 ?x
                        :arg2 ?y}
              ?p "adequate")))

(c/defquery result
  []
  [?investment <- Investment])

(c/defsession sesh 'clarafa)

(-> sesh
    (c/insert (->AmountSaved "amount saved fact" "adam" 5001))
    (c/insert (->Dependents "deps fact" "adam" 1))
    (c/insert (->Income "income fact" "adam" "inadequate"))
    (c/fire-rules)
    (c/query result))
;; => ({:?investment
;;      {:arg0
;;       #:just-r3{:pri0
;;                 #:just-r4{:pri0 "amount saved fact",
;;                           :pri1 "deps fact",
;;                           :arg0 "adam",
;;                           :arg1 5001,
;;                           :arg2 1},
;;                 :pri1 "income fact",
;;                 :arg0 "adam"},
;;       :arg1 "adam",
;;       :arg2 "combination"}})
