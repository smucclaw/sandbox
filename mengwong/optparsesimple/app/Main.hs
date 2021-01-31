module Main where

import Options.Applicative.Simple

main :: IO ()
main = do
  (opts,()) <-
    simpleOptions "v0.1.0" "We Explore Optparse-Simple"
    "in which we experiment with https://hackage.haskell.org/package/optparse-simple-0.1.1.3/docs/Options-Applicative-Simple.html"
    (MyOpts
     <$> (strOption (long "output"
                     <> short 'o'
                     <> metavar "FILE"
                     <> value "out.txt"
                     <> help "write output to FILE"))
     <*> (option parseColor (long "color" <> long "colour"
                       <> short 'c'
                       <> metavar "C"
                       <> help "choose Red, Green, or Blue"))
    )
    empty
  print opts

-- how do we parse to an arbitrary type? Suppose we want "Color":
data MyOpts = MyOpts
  { filename  :: String
  , color :: Color
  } deriving (Show, Eq)
  
-- we have to depart the confines of optparse-simple and explore the full optparse-applicative
-- see "Option Readers" under https://hackage.haskell.org/package/optparse-applicative
data Color = Red | Green | Blue deriving (Show, Read, Eq)

parseColor :: ReadM Color
parseColor = eitherReader $ \s -> case s of
  "red"  -> Right Red
  "r"    -> Right Red
  "g"    -> Right Green
  "blue" -> Right Blue
  _      -> Left "Unable to parse colour"
