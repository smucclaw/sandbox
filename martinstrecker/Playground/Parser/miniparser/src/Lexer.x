{
-- module Lexer (Token(..), AlexPosn(..), alexScanTokens, token_posn, tokenRng, coordFromTo, token_Int_val, token_Var_val) where

module Lexer (
  Token(..)
  -- scanTokens,
  , AlexPosn(..)
  , TokenKind(..)
  , unLex
  , Alex(..)
  , runAlex'
  , alexMonadScan'
  , alexError'
  , token_posn
  , tokenRng
  , coordFromTo
  , token_Int_val
  , token_Var_val
) where


import Prelude hiding (lex)
import Control.Monad.Except

import Coordinates
}

%wrapper "monadUserState"

$digit = 0-9                    -- digits
$alpha = [a-zA-Z]               -- alphabetic characters

tokens :-

  $white+                               ;
  "--".*                                ;
  let                                   { lex Let }
  in                                    { lex In }
  $digit+                               { lex Int }
  [\=\+\-\*\/\(\)]                      { lex Sym }
  $alpha [$alpha $digit \_ \']*         { lex Var }

{

-- To improve error messages, We keep the path of the file we are
-- lexing in our own state.
data AlexUserState = AlexUserState { filePath :: FilePath }

alexInitUserState :: AlexUserState
alexInitUserState = AlexUserState "<unknown>"

getFilePath :: Alex FilePath
getFilePath = liftM filePath alexGetUserState

setFilePath :: FilePath -> Alex ()
setFilePath = alexSetUserState . AlexUserState


-- CHANGE: Token AlexPosn TokenKind --> Token AlexPosn String TokenKind
data Token = Token AlexPosn String TokenKind
  deriving (Show)

-- The token type:
data TokenKind =
        Let           |
        In            |
        Sym           |
        Var           |
        Int           |
        EOF
        deriving (Eq,Show)

-- TODO: still to be defined
unLex :: TokenKind -> String
unLex _  = "fooboo"

-- CHANGE: return $ Token p TokenEOF --> return $ Token p "" EOF
alexEOF :: Alex Token
alexEOF = do
  (p,_,_,_) <- alexGetInput
  return $ Token p "" EOF

-- CHANGE
-- Unfortunately, we have to extract the matching bit of string
-- ourselves...
-- lex :: (String -> TokenKind) -> AlexAction Token
-- lex f = \(p,_,_,s) i -> return $ Token p (f (take i s))
lex :: TokenKind -> AlexAction Token
lex tk = \(p,_,_,s) i -> return $ Token p (take i s) tk


{- CHANGE: not used
-- For constructing tokens that do not depend on
-- the input
lex' :: TokenKind -> AlexAction Token
lex' = lex . const
-}

-- We rewrite alexMonadScan' to delegate to alexError' when lexing fails
-- (the default implementation just returns an error message).
alexMonadScan' :: Alex Token
alexMonadScan' = do
  inp <- alexGetInput
  sc <- alexGetStartCode
  case alexScan inp sc of
    AlexEOF -> alexEOF
    AlexError (p, _, _, s) ->
        alexError' p ("lexical error at character '" ++ take 1 s ++ "'")
    AlexSkip  inp' len -> do
        alexSetInput inp'
        alexMonadScan'
    AlexToken inp' len action -> do
        alexSetInput inp'
        action (ignorePendingBytes inp) len

-- Signal an error, including a commonly accepted source code position.
alexError' :: AlexPosn -> String -> Alex a
alexError' (AlexPn _ l c) msg = do
  fp <- getFilePath
  alexError (fp ++ ":" ++ show l ++ ":" ++ show c ++ ": " ++ msg)

-- A variant of runAlex, keeping track of the path of the file we are lexing.
runAlex' :: Alex a -> FilePath -> String -> Either String a
runAlex' a fp input = runAlex input (setFilePath fp >> a)



token_posn (Token pos s tk) = pos
tokenLength (Token pos s tk) = length s
{-
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
-}


token_Var_val (Token pos s Var) = s
token_Int_val (Token pos s Int) = (read s)


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
