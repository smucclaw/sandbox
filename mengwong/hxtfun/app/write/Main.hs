module Main where

import System.Environment
import Text.XML.HXT.Core
import Text.XML.HXT.Curl
import System.IO
import System.Environment
import System.Console.GetOpt
import System.Exit

main :: IO ()
main = do
  runX $
    root [] [helloWorld]                         -- (1)
    >>> writeDocument [withIndent yes] "hello.xml"
  return ()
    
       
helloWorld :: ArrowXml a => a XmlTree XmlTree
helloWorld =
  mkelem "html" []              -- (1)
  [ mkelem "head" []
    [ mkelem "title" []
      [ txt "Hello World" ]     -- (2)
    ]
  , mkelem "body"
    [ sattr "class" "haskell" ] -- (3)
    [ mkelem "h1" []
      [ txt "Hello World" ]     -- (4)
    ]
  ]
