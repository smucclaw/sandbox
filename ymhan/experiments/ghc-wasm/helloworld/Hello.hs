{-
https://book.realworldhaskell.org/read/interfacing-with-c-the-ffi.html

https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/ffi.html
https://downloads.haskell.org/ghc/9.0.1/docs/html/users_guide/exts/ffi.html?highlight=capiffi#extension-CApiFFI
https://gitlab.haskell.org/ghc/ghc-wasm-meta
https://github.com/charles37/haskell-wasm-snake/blob/main/src/Main.hs

http://blog.haskell-exists.com/yuras/posts/malloc-free-and-ffi.html
-}

-- {-# LANGUAGE CApiFFI #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Foreign.C.String ( CString, CStringLen )
import Foreign ( Ptr, StablePtr )
import Foreign.C.Types ( CChar )
import qualified Foreign.C.String as FCS
import qualified Foreign

-- type CStringLen = (Ptr CChar, Int)

-- foreign export ccall 
--     hiCString :: IO CString

-- to look into: what happens if we use capi instead of ccall?
foreign export ccall
    getHello :: Int -> IO (StablePtr CStringLen)

foreign export ccall 
    plus :: Int -> Int -> Int

foreign export ccall 
    main :: IO ()

foreign export ccall 
    freeStrWithLen :: StablePtr CStringLen -> IO ()


-- -- for experimenting: can we pass the value directly, instead of calling a fn?
-- hiCString :: IO CString
-- hiCString = FCS.newCString "hi there"

strToPrint :: String
strToPrint = "hello world?"

getHello :: Int -> IO (StablePtr CStringLen)
getHello _ =  FCS.newCStringLen strToPrint >>= Foreign.newStablePtr

strPtrFromCSL :: CStringLen -> Ptr CChar -- aka CString
strPtrFromCSL = fst

strLenFromCSL :: CStringLen -> Int
strLenFromCSL = snd

-- https://github.com/fourmolu/fourmolu/blob/d6529770cda5c77fad5b3bc3f0a08f9b2eaedec9/web/fourmolu-wasm/src/Main.hs#L142
freeStrWithLen :: StablePtr CStringLen -> IO ()
freeStrWithLen strWithLenPtr = do
  cstrWithLen <- Foreign.deRefStablePtr strWithLenPtr
  Foreign.free $ strPtrFromCSL cstrWithLen
  Foreign.freeStablePtr strWithLenPtr

------------
plus :: Int -> Int -> Int
plus = (+)

main :: IO ()
main = putStrLn "this is the Haskell main function"