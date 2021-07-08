{-# LANGUAGE OverloadedStrings #-}

import System.Process hiding (shell)
import qualified System.Process as P
import System.IO
import Turtle (sleep)
import System.Random
import qualified GHC.IO.Exception

exe = "docker run -i gf-lsp:1y9c1nb34gd8fp20v0ar02hjygrirdzf"
-- exe = "~/.cabal/bin/gf-lsp"

mkProc = do
  (Just hin, Nothing, Nothing, p) <- P.createProcess $ (P.shell exe) { P.std_in = P.CreatePipe }
  hSetBuffering hin NoBuffering
  pure (hin, p)

-- testChar c (hin,p) = hPutChar hin c >> getProcessExitCode p >>= print >> sleep 0.1 >> getProcessExitCode p
testChar :: Char -> (Handle, ProcessHandle) -> IO (Maybe GHC.IO.Exception.ExitCode)
-- testChar c (hin,p) = hPutChar hin c >> sleep 0.1 >> getProcessExitCode p
testChar c (hin,p) = hPutChar hin c >> sleep 0.1 >> getProcessExitCode p

-- loop newChar best prc = do
loop _ str _ | length str > 40 = pure str
loop (c:newChar) best prc = do
    -- putStrLn $ "Best so far: " ++ show best
    -- c <- newChar
    ans <- testChar c prc
    case ans of
        Nothing -> do
            putStr "\ESC[2K\ESC[0G"
            putStrLn ("OK: " ++ show c)
            let best' = best ++ [c]
            putStrLn $ "Best so far: " ++ show best'
            loop newChar best' prc
        Just _ -> do
            putStr "\ESC[2K\ESC[0G"
            putStr ("Fail: " ++ show c)
            prc' <- mkProc
            hPutStr (fst prc') best
            loop newChar best prc'

-- runI = mkProc >>= loop getChar ""

-- runR = mkProc >>= loop (randomRIO ('\x00','\xff')) ""

-- run = mkProc >>= loop (cycle ['\x00'..'\x7f']) ""
run = mkProc >>= loop (cycle ['\x00'..'~']) ""

-- sendString str (hin,p) = _

mkMsg str = "Content-Length: " ++ show (length str) ++ "\r\n\r\n" ++ str

send mbp str = do
  (h,p) <- maybe mkProc pure mbp
  hPutStr h $ mkMsg str
  sleep 0.1
  res <- getProcessExitCode p
  case res of
    Nothing -> Just (h, p) <$ putStrLn "Success!"
    (Just e) -> Nothing <$ print e

instance Show ProcessHandle where
  show _ = "<Process Handle>"

-- {"jsonrpc":"2.0", "id":1, "method":"initialize", "params":{"capabilities":{}}}
-- {"jsonrpc":"2.0", "id":2, "method":"textDocument/didOpen", "params":{"textDocument":{"uri":"file://","languageId":"","version":0,"text":"."}}}

-- ph <- send Nothing "{\"jsonrpc\":\"2.0\", \"id\":1, \"method\":\"initialize\", \"params\":{\"capabilities\":{}}}"
-- -- ph <- send ph "{\"jsonrpc\":\"2.0\", \"id\":2, \"method\":\"initialized\"}"
-- ph <- send ph "{\"jsonrpc\":\"2.0\", \"id\":2, \"method\":\"textDocument/didOpen\", \"params\":{\"textDocument\":{\"uri\":\"\",\"languageId\":\"\",\"version\":0,\"text\":\".\"}}}"
-- ph <- send ph "{\"jsonrpc\":\"2.0\", \"id\":2, \"method\":\"textDocument/didOpen\", \"params\":{\"textDocument\":{\"uri\":\"file://\",\"languageId\":\"\",\"version\":0,\"text\":\".\"}}}"
-- ph <- send ph "{\"jsonrpc\":\"2.0\", \"id\":2, \"method\":\"exit\"}"

-- {"result":{"capabilities":{"textDocumentSync":{"openClose":true,"change":2,"willSave":false,"willSaveWaitUntil":false,"save":{"includeText":false}},"hoverProvider":true,"completionProvider":{"resolveProvider":true,"triggerCharacters":["."]},"definitionProvider":true,"referencesProvider":true,"documentHighlightProvider":true,"documentSymbolProvider":true,"codeActionProvider":true,"documentFormattingProvider":true,"documentRangeFormattingProvider":true,"renameProvider":true,"executeCommandProvider":{"commands":["applyrefact:applyOne","hare:demote"]}}},"jsonrpc":"2.0","id":9}

-- State monad with current process and best string so far

-- (hin,p) <- mkProc
-- hin 'a'>> getProcessExitCode p >>= print >> sleep 0.1 >> getProcessExitCode p

-- Use waitForProcess to throw and catch that,
-- or use polling and sleep between commands

-- Backtrack on failure

--  hPutChar hin 'a'
--  getProcessExitCode p


-- data Foo = Foo Int

-- x :: Foo
-- x = _ undefined

-- z :: Char
-- z = _ "hello"

-- f :: Int -> Int
-- f x = case x of
--   0 -> _
--   1 -> _
--   2 -> _
--   3 -> _
--   4 -> _
--   5 -> _
--   6 -> _
--   7 -> _
--   8 -> _
--   9 -> _
--   10 -> _
