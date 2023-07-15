{-
https://book.realworldhaskell.org/read/interfacing-with-c-the-ffi.html

https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/ffi.html
https://downloads.haskell.org/ghc/9.0.1/docs/html/users_guide/exts/ffi.html?highlight=capiffi#extension-CApiFFI
https://gitlab.haskell.org/ghc/ghc-wasm-meta
https://github.com/charles37/haskell-wasm-snake/blob/main/src/Main.hs

http://blog.haskell-exists.com/yuras/posts/malloc-free-and-ffi.html

To load this in ghci, use 
    :set -fobject-code
-}

-- {-# LANGUAGE CApiFFI #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE LambdaCase #-}

module Hello where

import Foreign.C.String ( CString, CStringLen )
import Foreign ( Ptr, StablePtr )
import Foreign.C.Types ( CChar )
import qualified Foreign.C.String as FCS
import qualified Foreign


-- to look into: what happens if we use capi instead of ccall?
foreign export ccall
    getHello :: IO (StablePtr CStringLen)


foreign export ccall
    getStringLen :: StablePtr CStringLen -> IO Int
foreign export ccall 
    getString :: StablePtr CStringLen -> IO (Ptr CChar)

foreign export ccall 
    freeStrWithLen :: StablePtr CStringLen -> IO ()


strToPrint :: String
strToPrint = "hello world?"

getHello :: IO (StablePtr CStringLen)
getHello = FCS.newCStringLen strToPrint >>= Foreign.newStablePtr


sPtrFromCSL :: CStringLen -> Ptr CChar -- aka CString
sPtrFromCSL = fst

sLenFromCSL :: CStringLen -> Int
sLenFromCSL = snd


getString :: StablePtr CStringLen -> IO (Ptr CChar)
getString = fmap sPtrFromCSL . Foreign.deRefStablePtr

getStringLen :: StablePtr CStringLen -> IO Int
getStringLen = fmap sLenFromCSL . Foreign.deRefStablePtr


-- see also https://github.com/fourmolu/fourmolu/blob/d6529770cda5c77fad5b3bc3f0a08f9b2eaedec9/web/fourmolu-wasm/src/Main.hs#L142
freeStrWithLen :: StablePtr CStringLen -> IO ()
freeStrWithLen strWithLenPtr = do
  cstrWithLen <- Foreign.deRefStablePtr strWithLenPtr
  Foreign.free $ sPtrFromCSL cstrWithLen
  Foreign.freeStablePtr strWithLenPtr


-- main :: IO ()
-- main = putStrLn "this is the Haskell main function"
