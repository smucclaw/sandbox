{
module Lexer (Token(..), AlexPosn(..), alexScanTokens, token_posn, tokenRng, coordFromTo, token_Int_val, token_Var_val) where

import Coordinates
}

%wrapper "posn"

$digit = 0-9                    -- digits
$alpha = [a-zA-Z]               -- alphabetic characters

tokens :-

  $white+                               ;
  "--".*                                ;
  let                                   { tok (\p s -> Let p (length s)) }
  in                                    { tok (\p s -> In p (length s)) }
  $digit+                               { tok (\p s -> Int p (length s) (read s)) }
  [\=\+\-\*\/\(\)]                      { tok (\p s -> Sym p (length s) (head s)) }
  $alpha [$alpha $digit \_ \']*         { tok (\p s -> Var p (length s) s) }

{
-- Each right-hand side has type :: AlexPosn -> String -> Token

-- Some action helpers:
tok f p s = f p s

-- The token type:
data Token =
        Let AlexPosn Int           |
        In  AlexPosn Int           |
        Sym AlexPosn Int Char       |
        Var AlexPosn Int String     |
        Int AlexPosn Int Int
        deriving (Eq,Show)

token_posn (Let p _) = p
token_posn (In p _) = p
token_posn (Sym p _ _) = p
token_posn (Var p _ _) = p
token_posn (Int p _ _) = p

tokenLength (Let _ l) = l
tokenLength (In _ l) = l
tokenLength (Sym _ l _) = l
tokenLength (Var _ l _) = l
tokenLength (Int _ l _) = l


token_Var_val (Var _ _ v) = v
token_Int_val (Int _ _ v) = v


coordOfPos :: AlexPosn -> CoordPt
coordOfPos (AlexPn fp lp cp) = CoordPt lp cp

coordOfToken :: Token -> CoordPt
coordOfToken = coordOfPos . token_posn

-- horizontal offset, assuming tokens do not extend over several lines
offset (CoordPt l c) n = (CoordPt l (c + n))

tokenRng :: Token -> CoordRng
tokenRng t = CoordRng (coordOfToken t) (offset (coordOfToken t) ((tokenLength t) - 1))

coordFromTo :: CoordRng -> CoordRng -> CoordRng
coordFromTo (CoordRng f1 t1) (CoordRng f2 t2) = CoordRng f1 t2
coordFromTo _ _ = CoordUnknown

}
