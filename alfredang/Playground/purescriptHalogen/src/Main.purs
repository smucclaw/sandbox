module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Control.Monad.State (class MonadState)

import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI component unit body

data Action = Increment | Decrement

component :: forall t43 t44 t60 t63. H.Component t60 t63 t43 t44
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }
  where
  initialState _ = 0

render :: forall t3 t18. Show t18 => t18 -> HH.HTML t3 Action
render state = 
  HH.div_
    [ HH.button [ HE.onClick \_ -> Decrement ] [ HH.text "-" ]
    , HH.div_ [ HH.text $ show state ]
    , HH.button [ HE.onClick \_ -> Increment ] [ HH.text "+" ] 
    ]

handleAction :: forall t30. MonadState Int t30 => Action -> t30 Unit
handleAction = case _ of 
  Increment -> H.modify_ \state -> state + 1
  Decrement -> H.modify_ \state -> state - 1