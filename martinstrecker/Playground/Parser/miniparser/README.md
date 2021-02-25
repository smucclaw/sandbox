# miniparser

A miniature parser and lexer that manage position information, using the "posn" wrapper of Alex.

The lexer has been copied (and renamed) from  https://github.com/simonmar/alex/blob/master/examples/Tokens_posn.x

The parser has been copied (and renamed) from https://github.com/simonmar/alex/blob/master/examples/tiny.y

The data structure definitions have been moved into a separate file Syntax.hs

Management of coordinates is in Coordinates.hs. This file could be a blueprint of what is done in L4.
