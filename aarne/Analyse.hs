import Data.List
import Data.List
import Data.Char
import PGF

src_file = "annotated-6A.txt"

line2rule = mkRule . concatMap anOne . words
  where
    anOne w = case head w of
      '*' -> [tail w]
      '#' -> [quote (tail w)]
      _   -> []
    mkRule ws = unwords $ "Line" : "::=" : ws ++ [";"]

line2lexRules = anOne . words
  where
    anOne ws = case ws of
      ('#':_):ww -> anOne ww
      ('*':cat):ww ->
          let (lxs, rest) = break (flip elem "#*" . head) ww
              wlxs = filter (flip notElem ["[","]"]) lxs 
          in (unwords $ cat : "::=" : map quote wlxs ++ [";"]) : anOne rest
      _:_ -> error $ "uncaught words: " ++ unwords ws
      _ -> []


quote w = "\"" ++ w ++ "\""
unquote w = if head w == '"' then init (tail w) else w

main = do
  ls <- readFile src_file >>= return . filter (not . null) . lines
  let rs = nub $ map line2rule ls
  mapM putStrLn $ rs
  putStrLn $ unwords ["--", show (length ls), "lines", show (length rs), "rules"]

  let wrs = nub $ concatMap line2lexRules ls
  mapM putStrLn $ wrs
  putStrLn $ unwords ["--", show (length wrs), "lexical rules"]


-- second round: make better GF source files from hand-edited BNF

isRule line = take 1 line /= "-" && elem "::=" (words line)

getParts ws = head ws : init (tail (tail ws))

getCats ps = head ps : filter (not . (=='"') . head) (tail ps)

mkFun ps = mkCId $ concat $ intersperse "_" $ map unquote ps

mkVar p = if head p == '"' then p else map toLower p

mkRules ps = unwords [
  "fun",
  showCId (mkFun ps),
  ":",
  unwords (intersperse "->" (tail cats ++ [head cats])),
  ";",
  "\nlin",
  showCId (mkFun ps),
  unwords (filter (not . (=='"') . head) vs), 
  "=",
  unwords (intersperse "++" vs),
  ";"
  ]
  where
    cats = getCats ps
    vs = map mkVar (tail ps)

mkCatRules cat = unlines [
  unwords ["cat", cat, ";"],
  unwords ["lincat", cat, "=", "Str", ";"]
  ]

cf_file = "Top.cf"

main2 = do
  ls <- readFile cf_file >>= return . filter isRule . lines
  let pss = map (getParts . words) ls
  mapM_ (putStrLn . mkRules) pss
  putStrLn $ unlines $ map mkCatRules $ nub $ concatMap getCats pss
  