{-# LANGUAGE DeriveTraversable #-}
module LinearTemporalLogic where
import Data.Foldable (toList)

data Stream a = Cons a (Stream a)
  deriving (Functor, Foldable, Traversable)

showStream :: Show a => Int -> Stream a -> String
showStream n = show . take n . toList

show10 :: Show a => Stream a -> String
show10 = showStream 10

type LTLState a = Stream a

data Proposition a = 
    Base String (a -> Bool)

instance Show a => Show (Proposition a) where
    show (Base s _) = s

instance Eq a => Eq (Proposition a) where
    (Base s _) == (Base s' _) = s == s'

evalP :: Proposition a -> a -> Bool
evalP (Base _ f) = f

data LTLFormula a =
    TrueF
  | FalseF
  | Not (LTLFormula a)
  | And (LTLFormula a) (LTLFormula a)
  | Or (LTLFormula a) (LTLFormula a)
  | Next (LTLFormula a)
  | Globally (LTLFormula a)
  | Finally (LTLFormula a)
  | Until (LTLFormula a) (LTLFormula a)
  | Release (LTLFormula a) (LTLFormula a)
  | Prop (Proposition a)
  deriving (Eq, Show)

tailS :: LTLState a -> LTLState a
tailS (Cons _ s) = s

evaluate :: LTLState a -> LTLFormula a -> Bool
evaluate s TrueF = True
evaluate s FalseF = False
evaluate s (Not f) = not $ evaluate s f
evaluate s (And f g) = evaluate s f && evaluate s g
evaluate s (Or f g) = evaluate s f || evaluate s g
evaluate s (Next f) = evaluate (tailS s) f
-- evaluate s (Globally f) = evaluate s f && evaluate s (Next $ Globally f)
-- evaluate s (Finally f) = evaluate s f || evaluate s (Next $ Finally f)
-- -- Wrong
-- evaluate s (Until f g) = evaluate s f || evaluate (tailS s) g
-- evaluate s (Release f g) = evaluate s f && evaluate (tailS s) g
evaluate (Cons a st) (Prop p) = evalP p a
evaluate s f = evaluate s (expand f)

expand :: LTLFormula a -> LTLFormula a
expand x@(Globally f) = f `And` Next (expand x)
expand x@(Finally f) = f `Or` Next (expand x)
expand x@(Until f p) = p `Or` (f `And` Next (expand x))
expand x@(Release f p) = p `And` (f `Or` Next (expand x))
expand x = error "Can't expand x"

example :: LTLFormula Char
example = Release (Prop (Base "ac" $ \x-> x == 'a' || x == 'c')) (Prop (Base "bc" $ \x -> x == 'b' || x == 'c'))

example2 :: LTLFormula Int
example2 = Release (Prop $ Base "<5" (<5)) (Prop $ Base "even" even)

exampleState :: LTLState Char
exampleState = fromList "bcba"

fromList :: [a] -> LTLState a
fromList xs = go xs
 where go [] = go xs
       go (x:xs') = Cons x (go xs')

--- >>> evaluate (fromList [42,52,2,7]) example2
-- True
