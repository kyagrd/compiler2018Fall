{
module Parser where
import Token
import Lexer
import Syntax
}

%name parse
%tokentype { Token }
%error { parseError }


%token
    '+'        { Bop '+' }
    '-'        { Bop '-' }
    '*'        { Bop '*' }
    '('        { LParen }
    ')'        { RParen }
    int        { Int $$ }


%left '+'  '-'
%left '*'


%%

Exp  : int                { Num $1    }
     | Exp '+' Exp        { Plus $1 $3 }
     | Exp '-' Exp        { Minus $1 $3 }
     | Exp '*' Exp        { Times $1 $3 }
     | '(' Exp ')'        { $2        }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

}
