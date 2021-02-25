-- An example demonstrating how to connect a Happy parser to an Alex lexer.
{
module Parser (calc,runCalc,happyError) where


import Coordinates
import Lexer
import Syntax

import Prelude
import Control.Monad.Except


}

%name calc
%tokentype { Token }

%token  let             { Let _ _    }
        in              { In  _ _    }
        int             { Int _ _ _  }
        var             { Var _ _ _ }
        '='             { Sym _ _ '=' }
        '+'             { Sym _ _ '+' }
        '-'             { Sym _ _ '-' }
        '*'             { Sym _ _ '*' }
        '/'             { Sym _ _ '/' }
        '('             { Sym _ _ '(' }
        ')'             { Sym _ _ ')' }

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
       | '(' Exp ')'            { $2            }

{


data Coord = Coord AlexPosn 


runCalc :: String -> Exp CoordRng
runCalc = calc . alexScanTokens


happyError :: [Token] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
        where
        lcn =   case tks of
                  [] -> "end of file"
                  tk:_ -> "line " ++ show l ++ ", column " ++ show c
                        where
                        AlexPn _ l c = token_posn tk
}
