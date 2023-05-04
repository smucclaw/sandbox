{-
super minimal example involving +
-}

-- {-# LANGUAGE CApiFFI #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Plus where

import Foreign ( Ptr, StablePtr )
import qualified Foreign

-- to look into: what happens if we use capi instead of ccall?
foreign export ccall 
    plus :: Int -> Int -> Int

foreign export ccall 
    main :: IO ()


plus :: Int -> Int -> Int
plus = (+)

main :: IO ()
main = putStrLn "this is the Haskell main function"