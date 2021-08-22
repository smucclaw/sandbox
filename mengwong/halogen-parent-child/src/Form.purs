module Form where

import Prelude
import Effect.Class (class MonadEffect)
import Effect.Class.Console (logShow)
import Halogen as H
import Halogen.Query as HQ
import Halogen.HTML as HH
import Data.Either
import Data.Maybe

import Button as Button
import Button (_button, button)
import Counter
import Defaultable as Defaultable
import Type.Proxy (Proxy(..))
_defaultable = Proxy :: Proxy "defaultable"

-- The parent component supports one type of child component, which uses the
-- `ButtonSlot` slot type. You can have as many of this type of child component
-- as there are integers.
type Slots = ( button      :: Button.ButtonSlot Int
             , counter     :: forall query output. H.Slot query output Unit
             , defaultable :: forall query output. H.Slot query output Int)

-- The parent component can only evaluate one action: handling output messages
-- from the button component, of type `ButtonOutput`.
data ParentAction = HandleButton Button.ButtonOutput

-- The parent component maintains in local state the number of times all its
-- child component buttons have been clicked.
type ParentState = { clicked :: Int }

-- The parent component uses no query, input, or output types of its own. It can
-- use any monad so long as that monad can run `Effect` functions.
parent :: forall query input output m. MonadEffect m => H.Component query input output m
parent =
  H.mkComponent
    { initialState
    , render
      -- The only internal event this component can handle are actions as
      -- defined in the `ParentAction` type.
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }
  where
  initialState :: input -> ParentState
  initialState _ = { clicked: 0 }

  -- We render three buttons, handling their output messages with the `HandleButton`
  -- action. When our state changes this render function will run again, each time
  -- sending new input (which contains a new label for the child button component
  -- to use.)
  render :: ParentState -> H.ComponentHTML ParentAction Slots m
  render { clicked } = do
    let clicks = show clicked
    HH.div_
      [ -- We render our first button with the slot id 0
--        HH.slot _button 0 button { label: clicks <> " Enabled" } HandleButton
--        -- We render our second button with the slot id 1
--      , HH.slot _button 1 button { label: clicks <> " Power" } HandleButton
--        -- We render our third button with the slot id 2
--      , HH.slot _button 2 button { label: clicks <> " Switch" } HandleButton

        HH.slot_ _defaultable 1 Defaultable.component { label: "favourite colour" , value: Left (Just "brown") , options: ["pink", "blue"] }

      ]

  handleAction :: ParentAction -> H.HalogenM ParentState ParentAction Slots output m Unit
  handleAction = case _ of
    -- We handle one action, `HandleButton`, which itself handles the output messages
    -- of our button component.
    HandleButton output -> case output of
      -- There is only one output message, `Clicked`.
      Button.Clicked -> do
        -- When the `Clicked` message arises we will increment our clicked count
        -- in state, then send a query to the first button to tell it to be `true`,
        -- then send a query to all the child components requesting their current
        -- enabled state, which we log to the console.
        H.modify_ \state -> state { clicked = state.clicked + 1 }
        H.tell _button 0 (Button.SetEnabled true)
        on <- HQ.requestAll _button Button.GetEnabled
        logShow on

