module Form where

import Prelude
import Effect.Class (class MonadEffect)
import Effect.Class.Console (logShow)
import Halogen as H
import Halogen.Query as HQ
import Halogen.HTML as HH
import Data.Tuple
import Data.Either
import Data.Maybe
import Data.Array (catMaybes, zip, (..), length)

import Button as Button
import Button (_button, button)
import Counter
import Defaultable as Defaultable
import Logic
import Type.Proxy (Proxy(..))
_defaultable = Proxy :: Proxy "defaultable"

-- The parent component supports one type of child component, which uses the
-- `ButtonSlot` slot type. You can have as many of this type of child component
-- as there are integers.
type Slots = ( button      :: Button.ButtonSlot Int
             , counter     :: forall query output. H.Slot query output Unit
             , defaultable :: forall query. H.Slot query Defaultable.Message Int)

-- The parent component can only evaluate one action: handling output messages
-- from the button component, of type `ButtonOutput`.
data ParentAction = HandleButton Button.ButtonOutput
                  | HandleMessage Defaultable.Message

-- The parent component maintains in local state a representation of the interview
type ParentState = World_1

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
  initialState _ = case_1a

  -- We render three buttons, handling their output messages with the `HandleButton`
  -- action. When our state changes this render function will run again, each time
  -- sending new input (which contains a new label for the child button component
  -- to use.)
  render :: ParentState -> H.ComponentHTML ParentAction Slots m
  render world = do
    let visibility = caseEval visible_1 world
        visibleWorld = catMaybes [ if visibility.age       then Just { label: "age",       value: world.age       , options: [3, 30] }              else Nothing
                                 , if visibility.height    then Just { label: "height",    value: world.height    , options: [80, 90, 100] }        else Nothing
                                 , if visibility.race      then Just { label: "race",      value: world.race      , options: [Dwarf, Elf] }         else Nothing
                                 , if visibility.sub_dwarf then Just { label: "sub_dwarf", value: world.sub_dwarf , options: [Mountain, Hill] }     else Nothing
                                 , if visibility.sub_elf   then Just { label: "sub_elf",   value: world.sub_elf   , options: [Aquatic, Dark, High, Moon, Sun] } else Nothing
                                 ]
        ziprange = (1..length visibleWorld)
    HH.div_ $ (\(Tuple n v) -> HH.slot_ _defaultable n Defaultable.component v) <$> (zip ziprange visibleWorld) -- another thing to Applicative
      -- we probably need to do something clever involving Proxies to automatically generate a component for each attribute in the record.
      -- how do we list all the keys in a record? see https://purescript-simple-json.readthedocs.io/en/latest/inferred-record-types.html


  handleAction :: ParentAction -> H.HalogenM ParentState ParentAction Slots output m Unit
  handleAction = case _ of
    HandleMessage msg -> case msg of
      Defaultable.Default x -> case x.label of
        "age" -> do H.modify_ \state -> state { age = x.value }
        _     -> do H.modify_ \state -> state

    -- We handle one action, `HandleButton`, which itself handles the output messages
    -- of our button component.
    HandleButton output -> case output of
      Button.Clicked -> do
        -- When the `Clicked` message arises we will increment our clicked count
        -- in state, then send a query to the first button to tell it to be `true`,
        -- then send a query to all the child components requesting their current
        -- enabled state, which we log to the console.
        H.modify_ \state -> state { clicked = state.clicked + 1 }
        H.tell _button 0 (Button.SetEnabled true)
        on <- HQ.requestAll _button Button.GetEnabled
        logShow on

