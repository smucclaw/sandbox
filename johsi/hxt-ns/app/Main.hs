module Main (main) where

import Text.XML.HXT.Core

data Definitions = Definitions
  { sDefId :: String
  , sModelerExPlat :: String
  }
  deriving Show

instance XmlPickler Definitions where
  xpickle = xpDefinitions

withNS :: PU a -> PU a
withNS = xpAddNSDecl "" "https://www.omg.org/spec/DMN/20191111/MODEL/"
       -- . xpAddNSDecl "dc" "http://www.omg.org/spec/DMN/20180521/DC/"
       -- . xpAddNSDecl "dmndi" "https://www.omg.org/spec/DMN/20191111/DMNDI/"
       . xpAddNSDecl "modeler" "http://camunda.org/schema/modeler/1.0"
       -- . xpAddNSDecl "di" "http://www.omg.org/spec/DMN/20180521/DI/"

xpDefinitions :: PU Definitions
xpDefinitions = xpElem "definitions"
                . withNS
                $ xpWrap ( uncurry Definitions
                       , \x -> ( sDefId x
                               , sModelerExPlat x )) $
                xpPair
                ( xpAttrNS "" "" "id" xpText )
                -- ( xpAttrNS "" "modeler" "executionPlatform" xpText ) -- this works
                ( xpAttrNS "http://camunda.org/schema/1.0/dmn" "modeler" "executionPlatform" xpText ) -- not this


testDef :: Definitions
testDef = Definitions
  { sDefId = "Definitions_1"
  , sModelerExPlat = "Camunda Cloud" }


writeDefs :: IO ()
writeDefs = do
  _ <- runX ( constA testDef
            >>> xpickleDocument xpDefinitions
                                [ withIndent yes
                                ] "pickle.xml" )
  return ()

loadDefs :: IO Definitions
loadDefs = do
  [defs] <- runX ( xunpickleDocument xpDefinitions
             [
               withRemoveWS yes
             , withValidate no
             -- , withCheckNamespaces yes
             , withTrace 4
             ] "pickle.xml" )
  return defs

main :: IO ()
main = do
  _ <- writeDefs
  defs <- loadDefs
  print defs

-- uncurry1 :: (a -> b) -> a -> b
-- uncurry1 f = f

-- uncurry5 :: (a -> b -> c -> d -> e -> f) -> (a, b, c, d, e) -> f
-- uncurry5 f ~(a, b, c, d, e) = f a b c d e
