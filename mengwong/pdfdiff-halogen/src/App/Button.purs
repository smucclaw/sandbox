module App.Button where


import Prelude
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), split)
import Effect.Class (class MonadEffect)
import Effect.Class.Console (logShow)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Type.Proxy (Proxy(..))

import Web.HTML (window)
import Web.HTML.Window as Window
import Web.HTML.HTMLDocument as HTMLDocument

-- | component architecture drama

type Slots = (button :: ButtonSlot Int)
data ParentAction = Initialize | HandleButton ButtonOutput
type ParentState = { clicked :: Int }

main :: forall query input output m. MonadEffect m => H.Component query input output m
main =
  H.mkComponent
  { initialState
  , render
  , eval: H.mkEval $ H.defaultEval { handleAction = handleAction
                                   , initialize = Just Initialize }
  }
  where
    initialState :: input -> ParentState
    initialState _ = { clicked: 0 }

    render :: ParentState -> H.ComponentHTML ParentAction Slots m
    render { clicked } = do
      let clicks = show clicked
      HH.div [ HP.class_ $ HH.ClassName "container" ]
        [ HH.section (cs "section")
          [ HH.div (cs "columns is-desktop")
            [ HH.div (cs "column is-12")
              [ HH.text "AGREEMENTS" ]
            ]
          ]
        , HH.div_
          [ HH.slot _button 0 button { label: clicks <> " Enabled" } HandleButton
          , HH.slot _button 1 button { label: clicks <> " Power"   } HandleButton
          , HH.slot _button 2 button { label: clicks <> " Switch"  } HandleButton
          , if clicked `mod` 2 /= 0
            then HH.p [ HP.id "simpleP" ] [ HH.text $ "this is a simple paragraph" ]
            else HH.text ""
          ]
        ]

    handleAction :: ParentAction -> H.HalogenM ParentState ParentAction Slots output m Unit
    handleAction = case _ of
      Initialize -> do
        H.liftEffect $ window >>= Window.document >>= HTMLDocument.setTitle "Proof of Concept - Diff Viewer"
      HandleButton output -> case output of
        Clicked -> do
          H.modify_ \state -> state { clicked = state.clicked + 1 }
          H.tell _button 0 ( SetEnabled true )
          on <- H.requestAll _button GetEnabled
          logShow on

cs :: forall r i. String -> Array (HP.IProp (class :: String | r) i)
cs strs = [ HP.classes (HH.ClassName <$> split (Pattern " ") strs) ]


type ButtonSlot = H.Slot ButtonQuery ButtonOutput

_button = Proxy :: Proxy "button"

data ButtonQuery a
  = GetEnabled (Boolean -> a)
  | SetEnabled Boolean a

data ButtonOutput
  = Clicked

data ButtonAction
  = Click
  | Receive ButtonInput

type ButtonInput = { label :: String }
type ButtonState = { label :: String, enabled :: Boolean }

button :: forall m. H.Component ButtonQuery ButtonInput ButtonOutput m
button =
  H.mkComponent
  { initialState
  , render
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction
      , handleQuery  = handleQuery
      , receive      = Just <<< Receive
      }
  }
  where
    initialState :: ButtonInput -> ButtonState
    initialState { label } = { label, enabled: false }

    render :: ButtonState -> H.ComponentHTML ButtonAction () m
    render { label, enabled } =
      HH.button
      [ HE.onClick \_ -> Click ]
      [ HH.text $ label <> " (" <> (if enabled then "on" else "off") <> ")" ]

    handleAction :: ButtonAction
                 -> H.HalogenM ButtonState ButtonAction () ButtonOutput m Unit
    handleAction = case _ of
      Receive input ->
        H.modify_ _ { label = input.label }

      Click -> do
        H.modify_ \state -> state { enabled = not state.enabled }
        H.raise Clicked

    handleQuery :: forall a. ButtonQuery a
                -> H.HalogenM ButtonState ButtonAction () ButtonOutput m (Maybe a)
    handleQuery = case _ of
      SetEnabled value next -> do
        H.modify_ _ { enabled = value }
        pure (Just next)

      GetEnabled reply -> do
        enabled <- H.gets _.enabled
        pure (Just (reply enabled))

