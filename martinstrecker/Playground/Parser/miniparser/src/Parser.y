-- An example demonstrating how to connect a Happy parser to an Alex lexer.
{
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
  
module Parser (
  parseProgram
) where


import Coordinates
import Lexer
import Syntax

import Prelude
import Control.Monad.Except


}

%name program Exp
%tokentype { Token }

-- Parser monad
%monad { Alex }
%lexer { lexwrap } { Token _ EOF _ }
%error { parseError }

%token  let             { Token _ Let _ }
        in              { Token _ In _ }
        int             { Token _ Int _ }
        var             { Token _ Var _ }
        '='             { Token _ Sym "=" }
        '+'             { Token _ Sym "+" }
        '-'             { Token _ Sym "-" }
        '*'             { Token _ Sym "*" }
        '/'             { Token _ Sym "/" }
        '('             { Token _ Sym "(" }
        ')'             { Token _ Sym ")" }

%%

Exp :: { Exp CoordRng }
Exp : let Bindings in Exp       { LetE (coordFromTo (tokenRng $1) (expCoord $4)) $2 $4 }
    | Exp1                      { $1            }

Bindings :                      { [] }
         | Bindings Binding     { $2 : $1 }

Binding : var '=' Exp           { (token_Var_val $1, $3) }

Exp1 : Exp1 '+' Term            { PlusE (coordFromTo (expCoord $1) (expCoord $3)) $1 $3  }
     | Exp1 '-' Term            { MinusE (coordFromTo (expCoord $1) (expCoord $3)) $1 $3  }
     | Term                     { $1            }

Term : Term '*' Factor          { TimesE (coordFromTo (expCoord $1) (expCoord $3)) $1 $3  }
     | Term '/' Factor          { DivE (coordFromTo (expCoord $1) (expCoord $3)) $1 $3    }
     | Factor                   { $1            }

Factor : '-' Atom               { NegE (coordFromTo (tokenRng $1) (expCoord $2)) $2 }
       | Atom                   { $1            }

Atom : int                      { IntE (tokenRng $1) (token_Int_val $1)   }
       | var                    { VarE (tokenRng $1) (token_Var_val $1)   }
       | '(' Exp ')'            { updateCoord (coordFromTo (tokenRng $1) (tokenRng $3)) $2   }

{


lexwrap :: (Token -> Alex a) -> Alex a
lexwrap = (alexMonadScan' >>=)

parseError :: Token -> Alex a
parseError (Token p tk s) =
  alexError' p ("parse error at token '" ++ s ++ "'")

parseProgram :: FilePath -> String -> Either String (Exp CoordRng)
parseProgram = runAlex' program
  
}
