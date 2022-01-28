import Data.List

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


main = do
  ls <- readFile src_file >>= return . filter (not . null) . lines
  let rs = nub $ map line2rule ls
  mapM putStrLn $ rs
  putStrLn $ unwords ["--", show (length ls), "lines", show (length rs), "rules"]

  let wrs = nub $ concatMap line2lexRules ls
  mapM putStrLn $ wrs
  putStrLn $ unwords ["--", show (length wrs), "lexical rules"]
