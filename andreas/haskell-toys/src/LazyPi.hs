-- Lazy pi

-- Inspired by: https://web.archive.org/web/20051017081559/http://users.info.unicaen.fr/~karczma/arpap/lazypi.ps.gz

module LazyPi where

import Data.Ratio
import GHC.Real (Ratio((:%)))

base = 10

fcn n d = let (a,b) = quotRem n d in a : fcn (base*b) d where base = 10

fcn' n d = let (a,b) = quotRem n d; (a',b') = if b * 2 > d then (a+1, b - d) else (a,b) in a' : fcn' (base*b') d where base = 10

-- Convert a fraction to an infinite list of balanced decimal numbers
fcn'' n d = let (a,b) = divMod (n+halfd) d; (a',b') = (a,b - halfd) in a' : fcn'' (base*b') d where base = 10; halfd = d `div` 2

fcnRat (a :% b) = fcn'' a b

toNegNums n | n >= base =
    let (a,b) = divMod (n+halfd) base;
        b' = b - halfd
    in b' : toNegNums a
    where halfd = base `div` 2
toNegNums n = [n]
