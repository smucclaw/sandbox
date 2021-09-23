module Button where

-- We now move on to the child component, a component called `button`.
import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (class MonadEffect)
import Effect.Class.Console (logShow)
import Halogen as H
import Halogen.Query as HQ
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Type.Proxy (Proxy(..))

-- This component can accept queries of type `ButtonQuery` and send output
-- messages of type `ButtonOutput`. This slot type is exported so that other
-- components can use it when constructing their row of slots.
type ButtonSlot = H.Slot ButtonQuery ButtonOutput

-- We think our button will have the label "button" in the row where it's used,
-- so we're exporting a symbol proxy for convenience.
_button = Proxy :: Proxy "button"

-- This component accepts two queries. The first is a request-style query that
-- lets a parent component request a `Boolean` value from us. The second is a
-- tell-style query that lets a parent component send a `Boolean` value to us.
data ButtonQuery a
  = GetEnabled (Boolean -> a)
  | SetEnabled Boolean a

-- This component can notify parent components of one event, `Clicked`
data ButtonOutput
  = Clicked

-- This component can handle two internal actions. It can evaluate a `Click`
-- action and it can receive new input when its parent re-renders.
data ButtonAction
  = Click
  | Receive ButtonInput

-- This component accepts a label as input
type ButtonInput = { label :: String }

-- This component stores a label and an enabled flag in state
type ButtonState = { label :: String, enabled :: Boolean }

-- This component supports queries of type `ButtonQuery`, requires input of
-- type `ButtonInput`, and can send outputs of type `ButtonOutput`. It doesn't
-- perform any effects, which we can tell because the `m` type parameter has
-- no constraints.
button :: forall m. H.Component ButtonQuery ButtonInput ButtonOutput m
button =
  H.mkComponent
    { initialState
    , render
      -- This component can handle internal actions, handle queries sent by a
      -- parent component, and update when it receives new input.
    , eval: H.mkEval $ H.defaultEval
        { handleAction = handleAction
        , handleQuery = handleQuery
        , receive = Just <<< Receive
        }
    }
  where
  initialState :: ButtonInput -> ButtonState
  initialState { label } = { label, enabled: false }

  -- This component has no child components. When the rendered button is clicked
  -- we will evaluate the `Click` action.
  render :: ButtonState -> H.ComponentHTML ButtonAction () m
  render { label, enabled } =
    HH.button
      [ HE.onClick \_ -> Click ]
      [ HH.text $ label <> " (" <> (if enabled then "on" else "off") <> ")" ]

  handleAction
    :: ButtonAction
    -> H.HalogenM ButtonState ButtonAction () ButtonOutput m Unit
  handleAction = case _ of
    -- When we receive new input we update our `label` field in state.
    Receive input ->
      H.modify_ _ { label = input.label }

    -- When the button is clicked we update our `enabled` field in state, and
    -- we notify our parent component that the `Clicked` event happened.
    Click -> do
      H.modify_ \state -> state { enabled = not state.enabled }
      H.raise Clicked

  handleQuery
    :: forall a
     . ButtonQuery a
    -> H.HalogenM ButtonState ButtonAction () ButtonOutput m (Maybe a)
  handleQuery = case _ of
    -- When we receive a the tell-style `SetEnabled` query with a boolean, we
    -- set that value in state.
    SetEnabled value next -> do
      H.modify_ _ { enabled = value }
      pure (Just next)

    -- When we receive a the request-style `GetEnabled` query, which requires
    -- a boolean result, we get a boolean from our state and reply with it.
    GetEnabled reply -> do
      enabled <- H.gets _.enabled
      pure (Just (reply enabled))
