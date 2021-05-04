{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Rule34_SMT_gen where

import Data.Text (Text)
import qualified Data.Text as Text

import Data.Graph.Inductive hiding ((&))
import Text.Casing as Casing

import Utils
import Encoding ( GateType(..) )
import Rule34_jacob

findNodeByLabel :: (Graph gr, Eq a) => gr a b -> a -> (Maybe Node, Maybe a)
findNodeByLabel graph label = ufold
  (\(_,n,l,_) r -> if l == label then (Just n, Just l) else r)
  (Nothing,Nothing) graph


r34 :: Gr (GateType, Text) Text
r34 = makeGraph rule34_text

-- specialised to r34
findNodeByLabel' :: (GateType, Text) -> (Maybe Node, Maybe (GateType, Text))
findNodeByLabel' = findNodeByLabel r34


nodeDescrToIdentifier :: Text -> Text
nodeDescrToIdentifier = ("p_" <>) .
    Text.pack . Casing.toQuietSnake . Casing.fromWords
    . map (\c -> if elem @[] c ".,-" then ' ' else c) . Text.unpack
-- >>> nodeDescrToIdentifier " My. - Gate. - Description. "
-- "p_my_gate_description"


smtGen graph goals = undefined