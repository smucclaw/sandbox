module Main where

import Options.Applicative
import Data.Char (toUpper)


-- # Intro to parsing cli arguments
-- 
-- Each parser builder takes an option modifier. A modifier can be 
-- created by composing the basic modifiers provided by using the 
-- Monoid operations 'mempty' and 'mappend'

data Sample = Sample 
  { hello       :: String
  , quiet       :: Bool
  , enthusiasm  :: Int }

sample :: Parser Sample 
sample = Sample 
      <$> strOption 
            ( long "hello"                  -- } 
           <> metavar "TARGET"              -- } these are the modifiers 
           <> help "target for greeting" )  -- } 
      <*> switch
            ( long "quiet"
           <> short 'q'
           <> help "How enthusiastically to greet")
      <*> option auto
            ( long "enthusiasm"
           <> help "How enthusaistically to greet"
           <> showDefault
           <> value 1
           <> metavar "INT")

-- first main
--main :: IO ()
--main = greet =<< execParser opts
  --where 
    --opts = info (sample <**> helper)
      --( fullDesc
     -- <> progDesc "Print a greeting for TARGET"
     -- <> header "hello - a test for optparse-applicatve" )

greet :: Sample -> IO ()
greet (Sample h False n) = putStrLn $ "hello, " ++ h ++ replicate n '!'
greet _ = return ()



-- Custom types
data Input = FileInput FilePath
           | StdInput

run :: Input -> IO ()
run = undefined

fileInput :: Parser Input
fileInput = FileInput <$> strOption
  (  long "file"
  <> short 'f' 
  <> metavar "FILENAME"
  <> help "Input File" )

stdInput :: Parser Input
stdInput = flag' StdInput
  (  long "stdin"
  <> help "Read from stdin" )

input :: Parser Input
input = fileInput <|> stdInput -- <|> is from Alternative
-- We can also use other standard combinators like 'optional', because 
-- optparse-applicative parsers have instances of Applicative and Alternative 


opts :: ParserInfo Sample
opts = info (sample <**> helper)
  ( fullDesc
  <> progDesc "Print a greeting for TARGET"
  <> header "hello - a test for optparse-applicative" )

--main :: IO ()
--main = do 
  --options <- execParser opts
  --greet options



data InputOpts = InputOpts {
    cny    :: CommandsPlz -> Format,
    hawker :: CommandsPlz -> HawkerFoods,
    name   :: Greetee 
    } deriving Show

newtype Greetee = Person String deriving Show
data CommandsPlz = Greet CNYhuats | Food HawkerFoods deriving Show
data CNYhuats = GXFC | WSRY | NNYY deriving (Eq, Show)
data HawkerFoods = CKT | BCM | CDK deriving (Eq, Show)

isGreeting :: ReadM CNYhuats
isGreeting = eitherReader $ \s -> case toUpper <$> s of 
    "GXFC" -> Right GXFC
    "WSRY" -> Right WSRY
    "NNYY" -> Right NNYY
    _      -> Left "Oops, not a cny greeting"

cnyParser :: Parser CommandsPlz
cnyParser = option (Greet <$> isGreeting)
              ( long "greet" 
             <> short 'g'
             <> help "enter abbreviation here")

isHawkerFood :: ReadM HawkerFoods
isHawkerFood = eitherReader $ \y -> case toUpper <$> y of
    "CKT" -> Right CKT
    "BCM" -> Right BCM
    "CDK" -> Right CDK
    _     -> Left "Oops, not a hawker food"

hawksParser :: Parser CommandsPlz 
hawksParser = option (Food <$> isHawkerFood)
                ( long "hf"
               <> help "enter abb here" )

canHasCommands :: Parser CommandsPlz 
canHasCommands = subparser 
            ( command "CNY" (info (cnyParser <**> helper) 
              (  fullDesc 
              <> progDesc "prints a cny greeting based "
              <> header "CNYhuats - for ur cny greeting needs" ))
            <> command "hawker" (info (hawksParser <**> helper)
              (  fullDesc
              <> progDesc "can't remember what they're called?"
              <> header "HawkerFoods - i dunno what to eat" ) ) )

dunUds :: ReadM InputOpts
dunUds = eitherReader $ \s -> 

main :: IO ()
main = print =<< execParser canHasCommands'
  where canHasCommands' = info (canHasCommands <**> helper)
                    ( fullDesc 
                   <> progDesc "test progDes"
                   <> header "this is a test")




