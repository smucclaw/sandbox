(ns financial-advisor
  (:require [clara.rules :as c :refer [defrule defquery defsession]]))

;; (T -> Boolean) decls are modelled as records with single field of type T
(defrecord SavingsAccount [*]) ;; FinancialStatus
(defrecord Income [*]) ;; FinancialStatus
(defrecord Earnings [* **]) ;; Integer, EarningsStatus
(defrecord Investment [*]) ;; InvestmentStrategy
(defrecord AmountSaved [*]) ;; Integer
(defrecord Dependents [*]) ;; Integer

;; (T -> Integer) decls are modelled as functions
(defn minsavings [x]
  (* 5000 x))
(defn minincome [x]
  (+ 15000 (* 4000 x)))

;; General rules
;; 1
(defrule accInad
  [SavingsAccount (= * :inadequate)]
  =>
  (c/insert! (->Investment :savings)))

;; 2
(defrule accAdIncAd
  [SavingsAccount (= * :adequate)]
  [Income (= * :adequate)]
  =>
  (c/insert! (->Investment :stocks)))

;; 3
(defrule accAdIncInad
  [SavingsAccount (= * :adequate)]
  [Income (= * :inadequate)]
  =>
  (c/insert! (->Investment :combination)))

;; 4
(defrule savingsAd
  [AmountSaved (= ?x *)]
  [Dependents (= ?y *)]
  [:test (> ?x (minsavings ?y))]
  =>
  (c/insert! (->SavingsAccount :adequate)))

;; 5
(defrule savingsInad
  [AmountSaved (= ?x *)]
  [Dependents (= ?y *)]
  [:test (<= ?x (minsavings ?y))]
  =>
  (c/insert! (->SavingsAccount :inadequate)))

;; 6
(defrule incomeAd
  [Earnings (= ?x *) (= ** :steady)]
  [Dependents (= ?y *)]
  [:test (> ?x (minincome ?y))]
  =>
  (c/insert! (->Income :adequate)))

;; 7
(defrule incomeInadESteady
  [Earnings (= ?x *) (= ** :steady)]
  [Dependents (= ?y *)]
  [:test (<= ?x (minincome ?y))]
  =>
  (c/insert! (->Income :inadequate)))

;; 8
(defrule incomeInadEUnsteady
  [Earnings (= ?x *) (= ** :unsteady)]
  =>
  (c/insert! (->Income :inadequate)))

;; Queries
(defquery getResults []
  [Income (= ?income *)]
  [Investment (= ?investment *)])

;; Facts concerning a specific case
(-> (c/mk-session 'financial-advisor)
            (c/insert (->AmountSaved 22000))
            (c/insert (->Earnings 25000 :steady))
            (c/insert (->Dependents 3))
            (c/fire-rules)
            (c/query getResults))
;; => ({:?income :inadequate, :?investment :combination})