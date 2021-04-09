{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies #-}

module FilterFlow where

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude
-- import qualified Debug.Trace as D

makePhantom :: String -> String -> Diagram B
makePhantom l n = text l # fontSizeL 0.2 <> phantom (circle 0.2 # pad 1.2 :: D V2 Double) # named n

connectAnds n1 n2
  = withName n1 $ \t1 ->
     withName n2 $ \t2 ->
      let t1' = location t1 & _x +~ 0.15
          t2'= location t2 & _x -~ 0.15
          in atop (t1' ~~ t2')

elbow n1 n2
  = withName n1 $ \sub1 ->
     withName n2 $ \sub2 ->
      let dy = (location sub1 ^. _y) - (location sub2 ^. _y)
          joint = location sub1 & _y -~ dy
          sub1Edge = location sub1 & _y -~ 0.2
          sub2Edge = location sub2 & _x -~ 0.2
          in atop (sub1Edge ~~ joint) .
             atop (joint ~~ sub2Edge)

toy :: Diagram B
toy =
    let bc = vsep 0
            [ makePhantom "P" "b"
            , makePhantom "G" "c"
            , makePhantom "R" "d"
            , ands]
        ands = connectAnds "pd" "gn" $
               connectAnds "gn" "r" $
               hsep 0 $ map (uncurry makePhantom) [("P", "pd"), ("G", "gn"), ("R", "r")]
        diag = beside (r2 (1,-1))
               (text "Any" # fontSizeL 0.15 <> circle 0.2 # pad 1.5 # named "A")
               bc
    in foldr (elbow "A") diag ["b", "c", "d", "pd"]

main :: IO ()
main = mainWith toy
