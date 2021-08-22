module Defaultable where

import Prelude
import Data.Tuple.Nested ((/\))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import Data.Maybe
import Data.Either

-- as the user fills in a form, they encounter this progression:
-- 1. we start them out with a default value, but their input has not been received: Left (Just "blue")
-- 2. or maybe there is no default colour; we don't want to be sexist.               Left Nothing
-- 3. they aver actively that they do not have a favourite colour:                   Right Nothing
-- 4. they aver actively that their favourite colour is pink:                        Right (Just "pink")
type Default a = Either (Maybe a) (Maybe a)

type MyState a = { label :: String, value :: Default a, options :: Array a }

component :: forall q o m a. Show a => H.Component q (MyState a) o m
component = Hooks.component \_ input -> Hooks.do
  state /\ countId <- Hooks.useState input
  let pickColor x = HH.button
                    [ HE.onClick \_ -> Hooks.modify_ countId \st -> st { value = Right $ Just x  } ]
                    [ HH.text $ show x ]
      dunno_en = HH.button
                 [ HE.onClick \_ -> Hooks.modify_ countId \st -> st { value = Right Nothing } ]
                 [ HH.text "I don't know" ]
      reset_en = HH.button
                 [ HE.onClick \_ -> Hooks.modify_ countId \st -> st { value = input.value } ]
                 [ HH.text "Reset to default" ]
      text_en = case state.value of
        Left Nothing   -> "You have not made a selection. There is no default."
        Left (Just x)  -> "You have not made a selection. The default is " <> show x <> "."
        Right Nothing  -> "You have averred that you have no answer."
        Right (Just x) -> "You have chosen answer " <> show x <> "."
  Hooks.pure do
    HH.div_
      [ HH.p_ ( [ HH.h2_ [ HH.text state.label ] ]
                <> (pickColor <$> input.options) <> [ dunno_en, reset_en ]
                <> [ HH.br_, HH.text text_en ]
                <> [ HH.br_, HH.text $ show state.value ]
              )
      ]


