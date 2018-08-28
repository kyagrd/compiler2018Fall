{
module Lexer (lexer) where
import Token
}

%wrapper "basic"

$digit = 0-9

tokens :-

  $white+    ;
  "("        { \_     -> LParen }
  ")"        { \_     -> RParen }
  [\+\-\*]   { \(c:_) -> Bop c }
  $digit+    { \s     -> Int (read s) }

{
lexer = alexScanTokens

}

