module Counter where

import Prelude
import Data.Tuple.Nested ((/\))
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))

counter = Hooks.component \_ _ -> Hooks.do
  count /\ countId <- Hooks.useState 0
  Hooks.pure do
    HH.div_
      [ HH.p_ [ HH.text $ "Counter = " <> show count <> "." ]
      , HH.button
           [ HE.onClick \_ -> Hooks.modify_ countId (_ + 1) ]
           [ HH.text "Increment" ]
      , HH.button
           [ HE.onClick \_ -> Hooks.modify_ countId (_ - 1) ]
           [ HH.text "Decrement" ]
      ]

_counter = Proxy :: Proxy "counter"

