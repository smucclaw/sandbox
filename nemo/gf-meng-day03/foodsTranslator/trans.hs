module Main where
  
  import PGF
  import System.Environment (getArgs)
  
  main :: IO ()
  main = do
    file:_ <- getArgs
    gr     <- readPGF file
    interact (translate gr)
  
  translate :: PGF -> String -> String
  translate gr s = case parseAllLang gr (startCat gr) s of
    (lg,t:_):_ -> unlines [linearize gr l t | l <- languages gr, l /= lg]
    _ -> "NO PARSE"

