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
  argv <- getArgs
  (al, src, dst) <- cmdlineOpts argv
  [rc]  <- runX (application al src dst)
  if rc >= c_err
    then exitWith (ExitFailure (0-1))
    else exitWith ExitSuccess

cmdlineOpts     :: [String] -> IO (SysConfigList, String, String)
cmdlineOpts argv = return ([withValidate no], argv!!0, argv!!1)

application     :: SysConfigList -> String -> String -> IOSArrow b Int
application cfg src dst =
  configSysVars (withTrace 1 : cfg)
  >>> readDocument [ -- withParseHTML yes,
                   withValidate no
                   ,withCurl []
                   ] src
  >>> withTraceLevel 4 (traceDoc "resulting document")      -- (1)
  >>> processChildren (processDocumentRootElement `when` isElem)  -- (1)
  >>> withTraceLevel 4 (traceDoc "after processing")      -- (1)
  >>> writeDocument [
  --withIndent yes
  -- ,withOutputEncoding isoLatin1
                    ] dst                                        -- (3)
  >>> getErrStatus

processDocumentRootElement :: IOSArrow XmlTree XmlTree
processDocumentRootElement
    = selectAllP


selectAllText :: ArrowXml a => a XmlTree XmlTree
selectAllText
   = deep isText

selectAllP :: ArrowXml a => a XmlTree XmlTree
selectAllP
    = deep
      ( isText                       -- (1)
        <+>
        ( isElem >>> hasName "a"   -- (2)
          >>> getAttrValue "href"         -- (3)
          >>> mkText                     -- (4)
        )
      )



