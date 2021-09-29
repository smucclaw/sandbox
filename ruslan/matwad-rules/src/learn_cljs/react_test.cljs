(ns ^:figwheel-hooks learn-cljs.react-test
  (:require [reagent.ratom :as ratom]                    ;; <2>
            [goog.events :as gevents]
            [learn-cljs.reagent-react :as rg]
            [odoyle.rules :as o]
            [learn-cljs.odoyle-react :as odoy]))

(gevents/listen rg/a "change" (rg/update-cell rg/a-cell))
(gevents/listen rg/b "change" (rg/update-cell rg/b-cell))

(ratom/run!
  (set! (.-value rg/c) @rg/c-cell))

(gevents/listen odoy/walks-ui "change" (odoy/update-cell ::odoy/walks))
(gevents/listen odoy/eats-ui "change" (odoy/update-cell ::odoy/eats))
(gevents/listen odoy/drinks-ui "change" (odoy/update-cell ::odoy/drinks))

(swap! odoy/*session
       (fn [session]
         (-> session
             (o/insert ::odoy/person ::odoy/walks false)
             (o/insert ::odoy/person ::odoy/eats false)
             (o/insert ::odoy/person ::odoy/drinks false)
             (o/insert ::odoy/person ::odoy/sings false)
             o/fire-rules)))


;; specify reload hook with ^;after-load metadata
(defn ^:after-load on-reload []
  ;; optionally touch your app-state to force rerendering depending on
  ;; your application
  ;; (swap! app-state update-in [:__figwheel_counter] inc)
)
