module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Example.Basic.Component as Basic
import Example.Async.Component as Async
import Example.Nested.Page as Nested
import Example.ExternalComponents.Page as ExternalComponents
import Example.App.Home as Home
import Example.RealWorld.Page as RealWorld
import Foreign.Object as Object
import Halogen.Aff as HA
import Halogen.HTML (text) as HH
import Halogen.Storybook (Stories, runStorybook, proxy)

stories :: Stories Aff
stories = Object.fromFoldable
  [ Tuple "" $ proxy Home.component
  , Tuple "1 basic" $ proxy Basic.component
  , Tuple "2 external-components" $ proxy ExternalComponents.component
  , Tuple "3 async" $ proxy Async.component
  , Tuple "4 nested" $ proxy Nested.component
  , Tuple "5 real-world" $ proxy RealWorld.component
  ]

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runStorybook { stories, logo: Just $ HH.text "Formless" } body
