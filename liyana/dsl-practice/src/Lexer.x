{
{-# OPTIONS_GHC -XFlexibleContexts #-}

module Lexer (
  Token(..),
 AlexPosn(..), alexScanTokens, token_posn, tokenRng, coordFromTo, token_Sym_val, token_Num_val
) where

import Coordinates
import Control.Monad.Except

}

%wrapper "posn"

$digit = 0-9
$alpha = [a-zA-Z]
$eol   = [\n]

tokens :-

  -- Whitespace insensitive
  $eol                          ;
  $white+                       ;

  -- Comments
  "#".*                         ;

  -- Syntax
  -- Structuring elements of an L4 file
  
  assert                        { tok (\p s -> TokenAssert p (length s)) }
  class                         { tok (\p s -> TokenClass p (length s))  }
  decl                          { tok (\p s -> TokenDecl p (length s)) }
  defn                          { tok (\p s -> TokenDefn p (length s)) }
  extends                       { tok (\p s -> TokenExtends p (length s)) }
  lexicon                       { tok (\p s -> TokenLexicon p (length s)) }
  rule                          { tok (\p s -> TokenRule p (length s)) }

  -- Types
  Bool                          { tok (\p s -> TokenBool p (length s)) }
  Int                           { tok (\p s -> TokenInt p (length s)) }

  -- Expressions
  let                           { tok (\p s -> TokenLet p (length s)) }
  in                            { tok (\p s -> TokenIn p (length s)) }
  not                           { tok (\p s -> TokenNot p (length s)) }
  forall                        { tok (\p s -> TokenForall p (length s)) }
  exists                        { tok (\p s -> TokenExists p (length s)) }
  if                            { tok (\p s -> TokenIf p (length s)) }
  then                          { tok (\p s -> TokenThen p (length s)) }
  else                          { tok (\p s -> TokenElse p (length s)) }
  for                           { tok (\p s -> TokenFor p (length s)) }
  True                          { tok (\p s -> TokenTrue p (length s)) }
  False                         { tok (\p s -> TokenFalse p (length s)) }

  -- Symbols
  "->"                          { tok (\p s -> TokenArrow p (length s)) }
  \\                            { tok (\p s -> TokenLambda p (length s)) }
  "-->"                         { tok (\p s -> TokenImpl p (length s)) }
  "||"                          { tok (\p s -> TokenOr p (length s)) }
  "&&"                          { tok (\p s -> TokenAnd p (length s)) }
  \=                            { tok (\p s -> TokenEq p (length s)) }
  \<                            { tok (\p s -> TokenLt p (length s)) }
  \>                           { tok (\p s -> TokenGt p (length s)) }
  [\+]                          { tok (\p s -> TokenAdd p (length s)) }
  [\-]                          { tok (\p s -> TokenSub p (length s)) }
  [\*]                          { tok (\p s -> TokenMul p (length s)) }
  "/"                           { tok (\p s -> TokenDiv p (length s)) }
  "%"                           { tok (\p s -> TokenMod p (length s)) }
  \.                            { tok (\p s -> TokenDot p (length s)) }
  \,                            { tok (\p s -> TokenComma p (length s)) }
  \:                            { tok (\p s -> TokenColon p (length s)) }
  \(                            { tok (\p s -> TokenLParen p (length s)) }
  \)                            { tok (\p s -> TokenRParen p (length s)) }
  \{                            { tok (\p s -> TokenLBrace p (length s)) }
  \}                            { tok (\p s -> TokenRBrace p (length s)) }
 
  -- Numbers and identifiers
  $digit+                       { tok (\p s -> TokenNum p (length s) (read s)) }
  [\=\+\-\*\/\(\)]                      { tok (\p s -> TokenSym p (length s) (head s)) }
  $alpha [$alpha $digit \_ \']* { tok (\p s -> TokenVar p (length s) s) }


{
-- Each right-hand side has type :: AlexPosn -> String -> Token

-- Some action helpers:
tok f p s = f p s

data Token 
  =
    TokenAssert AlexPosn Int
  | TokenClass AlexPosn Int
  | TokenDecl AlexPosn Int
  | TokenDefn AlexPosn Int
  | TokenExtends AlexPosn Int
  | TokenLexicon AlexPosn Int
  | TokenRule AlexPosn Int

  | TokenBool AlexPosn Int
  | TokenInt AlexPosn Int

  | TokenLet AlexPosn Int
  | TokenIn AlexPosn Int
  | TokenSym AlexPosn Int Char
  | TokenNot AlexPosn Int
  | TokenForall AlexPosn Int
  | TokenExists AlexPosn Int
  | TokenIf AlexPosn Int
  | TokenThen AlexPosn Int
  | TokenElse AlexPosn Int
  | TokenFor AlexPosn Int
  | TokenTrue AlexPosn Int
  | TokenFalse AlexPosn Int
  
  | TokenLambda AlexPosn Int
  | TokenArrow AlexPosn Int
  | TokenImpl AlexPosn Int
  | TokenOr AlexPosn Int
  | TokenAnd AlexPosn Int
  | TokenEq AlexPosn Int
  | TokenLt AlexPosn Int
  | TokenGt AlexPosn Int
  | TokenAdd AlexPosn Int
  | TokenSub AlexPosn Int
  | TokenMul AlexPosn Int
  | TokenDiv AlexPosn Int
  | TokenMod AlexPosn Int
  | TokenDot AlexPosn Int
  | TokenComma AlexPosn Int
  | TokenColon AlexPosn Int
  | TokenLBrace AlexPosn Int
  | TokenRBrace AlexPosn Int
  | TokenLParen AlexPosn Int
  | TokenRParen AlexPosn Int
  | TokenEOF AlexPosn Int

  | TokenNum AlexPosn Int Int
  | TokenVar AlexPosn Int String
  deriving (Eq,Show)

token_posn (TokenAssert p _) = p
token_posn (TokenClass p _ ) = p
token_posn (TokenDecl p _ ) = p
token_posn (TokenDefn p _ ) = p
token_posn (TokenExtends p _ ) = p
token_posn (TokenLexicon p _ ) = p
token_posn (TokenRule p _ ) = p
token_posn (TokenSym p _ _) = p

token_posn (TokenBool p _ ) = p
token_posn (TokenInt p _ ) = p

token_posn (TokenLet p _ ) = p
token_posn (TokenIn p _ ) = p
token_posn (TokenNot p _ ) = p
token_posn (TokenForall p _ ) = p 
token_posn (TokenExists p _ ) = p
token_posn (TokenIf p _ ) = p
token_posn (TokenThen p _ ) = p 
token_posn (TokenElse p _ ) = p
token_posn (TokenFor p _ ) = p
token_posn (TokenTrue p _ ) = p
token_posn (TokenFalse p _ ) = p

token_posn (TokenLambda p _ ) = p
token_posn (TokenArrow p _ ) = p
token_posn (TokenImpl p _ ) = p
token_posn (TokenOr p _ ) = p
token_posn (TokenAnd p _ ) = p
token_posn (TokenEq p _ ) = p
token_posn (TokenLt p _ ) = p
token_posn (TokenGt p _ ) = p
token_posn (TokenAdd p _ ) = p 
token_posn (TokenSub p _ ) = p
token_posn (TokenMul p _ ) = p
token_posn (TokenDiv p _ ) = p
token_posn (TokenMod p _ ) = p
token_posn (TokenDot p _ ) = p
token_posn (TokenComma p _ ) = p
token_posn (TokenColon p _ ) = p
token_posn (TokenLBrace p _ ) = p
token_posn (TokenRBrace p _ ) = p
token_posn (TokenLParen p _ ) = p
token_posn (TokenRParen p _ ) = p
token_posn (TokenEOF p _ ) = p

token_posn (TokenNum p _ _ ) = p
token_posn (TokenSym p _ _ ) = p


tokenLength (TokenAssert _ l ) = l
tokenLength (TokenClass _ l ) = l
tokenLength (TokenDecl _ l ) = l
tokenLength (TokenDefn _ l ) = l
tokenLength (TokenExtends _ l ) = l
tokenLength (TokenLexicon _ l ) = l
tokenLength (TokenRule _ l ) = l
tokenLength (TokenSym _ l _ ) = l

tokenLength (TokenBool _ l ) = l
tokenLength (TokenInt _ l ) = l

tokenLength (TokenLet _ l ) = l
tokenLength (TokenIn _ l ) = l
tokenLength (TokenNot _ l ) = l
tokenLength (TokenForall _ l ) = l 
tokenLength (TokenExists _ l ) = l
tokenLength (TokenIf _ l ) = l
tokenLength (TokenThen _ l ) = l 
tokenLength (TokenElse _ l ) = l
tokenLength (TokenFor _ l ) = l
tokenLength (TokenTrue _ l ) = l
tokenLength (TokenFalse _ l ) = l

tokenLength (TokenLambda _ l ) = l
tokenLength (TokenArrow _ l ) = l
tokenLength (TokenImpl _ l ) = l
tokenLength (TokenOr _ l ) = l
tokenLength (TokenAnd _ l ) = l
tokenLength (TokenEq _ l ) = l
tokenLength (TokenLt _ l ) = l
tokenLength (TokenGt _ l ) = l
tokenLength (TokenAdd _ l ) = l 
tokenLength (TokenSub _ l ) = l
tokenLength (TokenMul _ l ) = l
tokenLength (TokenDiv _ l ) = l
tokenLength (TokenMod _ l ) = l
tokenLength (TokenDot _ l ) = l
tokenLength (TokenComma _ l ) = l
tokenLength (TokenColon _ l ) = l
tokenLength (TokenLBrace _ l ) = l
tokenLength (TokenRBrace _ l ) = l
tokenLength (TokenLParen _ l ) = l
tokenLength (TokenRParen _ l ) = l
tokenLength (TokenEOF _ l ) = l

tokenLength (TokenNum _ l _ ) = l
tokenLength (TokenSym _ l _ ) = l

token_Sym_val (TokenSym _ _ v) = v
token_Num_val (TokenNum _ _ v) = v



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
