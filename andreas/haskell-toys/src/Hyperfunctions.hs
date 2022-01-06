{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wall #-}
module Hyperfunctions where
import Data.Profunctor ( Profunctor(dimap, lmap) )
import Data.Function (fix, (&))
import Data.Functor.Contravariant

newtype a -&> b = Hyp { invoke :: (b -&> a) -> b }

infixr 4 -&>

-- WRONG
-- hyp a b = (hyp b a) -> b
-- hyp a b = (->) (hyp b a) b
-- hyp a b = flip (->) b (hyp b a)
-- hyp a b = flip (->) b (flip (hyp a b))
-- hyp a b = fix $ \self -> flip (->) b (flip self)
-- hyp a b = fix $ \self -> (flip (->) b . flip) self
-- hyp a b = fix (flip (->) b . flip)

-- hyp a b = (hyp b a) -> b
-- hyp = \a b -> (hyp b a) -> b
-- hyp = \a b -> flip (->) b (hyp b a)

-- hyp a b = flip (->) b (hyp b a)
-- hyp a b = flip (->) b (flip (->) a (hyp a b))
-- hyp a b = fix $ \self -> flip (->) b (flip (->) a self)
-- hyp a b = fix $ \self -> flip (->) b . flip (->) a $ self
-- hyp a b = fix $ flip (->) b . flip (->) a
-- hyp a b = fix (flip (->) b . flip (->) a)

newtype (f :.: g) x = Comp { unComp :: f (g x)}
newtype Fix f = Fix { unFix :: f (Fix f)}
newtype Flip f a b = Flip { unFlip :: f b a }

instance Profunctor f => Contravariant (Flip f a) where
  contramap fab (Flip fba) = Flip (lmap fab fba)

-- A silly type alias version of @(-&>)@
-- We unwrap two layers to gain non-polymorphic recursion
-- and the ability to use @Fix@
type HypT a b = Fix (Flip (->) b :.: Flip (->) a)

newtype HyperF a b r = HyperF { invokeF :: (r -> a) -> b }
  deriving (Functor)

type Hyper a b = Fix (HyperF a b)

-- Unfortunately this has to be recursive, because of the lack of
invoke' :: Hyper a b -> Hyper b a -> b
invoke' (Fix (HyperF f_b)) (Fix (HyperF f_a)) = f_b $ f_a . invoke'
-- invoke' = lmap unFix . lmap (_ . invokeF) . invokeF . unFix

newtype FixFlip f a b = FixFlip { unFixFlip :: f a b (FixFlip f b a)}

-- instance (Functor f, Functor g) => Functor (f :.: g) where
--   fmap fab (Comp fga) = Comp (fmap (fmap fab) fga)

instance (Contravariant f, Contravariant g) => Functor (f :.: g) where
  fmap fab (Comp fga) = Comp (contramap (contramap fab) fga)

-- instance (Contravariant f, Contravariant g) => Contravariant (f :.: g) where
--   contramap fab (Comp fgb) = Comp $ _ fab >$< fgb


foldFix :: Functor f => (f a -> a) -> Fix f -> a
foldFix f = go where go = f . fmap go . unFix

unfoldFix :: Functor f => (a -> f a) -> a -> Fix f
unfoldFix f = go where go = Fix . fmap go . f

hypT2nt :: HypT a b -> a -&> b
-- hypT2nt (Fix (Comp (Flip g))) = Hyp $ g . Flip . lmap hypT2nt . invoke
hypT2nt = foldFix $ Hyp . lmap (Flip . invoke) . unFlip . unComp

nt2hypT :: a -&> b -> HypT a b
-- nt2hypT (Hyp a2b) = Fix $ Comp $ Flip $ a2b . Hyp . lmap nt2hypT . unFlip
nt2hypT = unfoldFix $ Comp . Flip . lmap (Hyp . unFlip) . invoke

-- >>> :t invoke
-- >>> :t Hyp
-- invoke :: forall a b. (a -&> b) -> (b -&> a) -> b
-- Hyp :: forall b a. ((b -&> a) -> b) -> a -&> b

mkHyp :: (((b -&> a) -> b) -> a) -> b -&> a
mkHyp f = Hyp $ \g -> f (invoke g)


instance Functor ((-&>) a) where
  fmap = mapHyper

instance Profunctor (-&>) where
  dimap fab fcd (Hyp fpcbc) = Hyp $ fcd . fpcbc . dimap fcd fab

ex1 :: Int -&> Bool
ex1 = Hyp \(Hyp fpibi) -> even $ fpibi ex1

ex2 :: Bool -&> Int
ex2 = Hyp $ const 3

ex3 :: Bool
ex3 = invoke ex1 ex2

-- >>> ex3
-- False

list :: Int -&> Int
list = go 10
  where
    go :: Int -> Int -&> Int
    go 0 = hconst 0
    go n = Hyp $ \(Hyp x) -> succ $ x $ go $ pred n

fromList :: [a] -> [a] -&> [a]
fromList [] = hconst []
fromList (x : xs) = Hyp $ \(Hyp f) -> x : f (fromList xs)

fromList' :: [a] -> [a] -&> [a]
fromList' = flip foldr (hconst []) $ \x xs -> mkHyp $ \cont -> x : cont xs

-- type List a = Maybe (a, List a)
-- listx a = maybex (a, listx a)
-- listx a = fix $ maybex . (,) a


-- type List a = Fix (Maybe :.: (,) a)

-- >>> :t fix
-- fix :: forall a. (a -> a) -> a

fix' :: (a -> a) -> a
-- fix' f = x where x = f x
fix' f = f $ fix' f



htake :: Int -> a -> a -&> a
htake n0 x0 = go n0
  where
        -- go 0 = hconst x0
        -- go n = Hyp \(Hyp f) -> f $ go $ pred n
        -- go 0 = Hyp $ \_ -> x0
        go 0 = Hyp $ const x0
        go n = Hyp $ \f -> invoke f $ go $ pred n

htake' :: a -> Int -> a -&> a
-- htake' x0 = fix $ \self n -> Hyp $ \f -> invoke f $ self $ pred n
htake' x0 = gloop (\case 0 -> const x0; _ -> id) pred

gloop :: (x -> a -> b) -> (x -> x) -> x -> a -&> b
gloop f g = fix $ \self n -> Hyp $ \h -> f n $ invoke h $ self $ g n

gloop' :: (x -> (a -> b, x)) -> x -> a -&> b
gloop' fg = fix $ \self n -> Hyp $ \h -> let (f,n') = fg n in f $ invoke h $ self n'

gloopE :: (x -> Either b (a -> b, x)) -> x -> a -&> b
gloopE fg = fix $ \self n -> Hyp $ \h -> case fg n of
    Left o -> o
    Right (f,n') -> f $ invoke h $ self n'

data Stream a = Cons { hd :: a, tl :: Stream a }
  deriving (Eq, Show, Functor)

stream2Hyp :: Stream (a -> b) -> a -&> b
stream2Hyp = gloop' $ \ sfab -> (hd sfab , tl sfab)

ggloop :: (((b -&> a) -> b) -> (t -> b -&> a) -> t -> a) -> t -> b -&> a
ggloop f = fix $ \self n -> Hyp $ \h -> f (invoke h) self n

-- >>> invoke list $ hconst 3
-- 4

-- >>> invoke (fromList [1..5]) $ fromList [10..22]
-- >>> invoke (fromList [1..5]) $ htake 2 []
-- [1,10,2,11,3,12,4,13,5,14]
-- [1,2,3]

loop :: (a -> b) -> a -&> b
-- loop f = go where go = Hyp \g -> f $ invoke g go
loop f = fix \a2b -> Hyp \b2a -> f $ invoke b2a a2b
-- loop f = fix $ Hyp . f .^ flip invoke

(.^) :: (b -> c) -> (a1 -> a2 -> b) -> a1 -> a2 -> c
(.^) = (.).(.)
infixr 9 .^

hconst :: b -> a -&> b
-- hconst = loop . const
hconst = Hyp . const
-- hconst x = Hyp $ \b2a -> x

hid :: a -&> a
hid = loop id
-- hid = Hyp \(Hyp inner) -> inner hid


mapHyper :: (b -> c) -> (a -&> b) -> (a -&> c)
mapHyper f (Hyp g) = Hyp $ f . g . comapHyper f

comapHyper :: (c -> a) -> (a -&> b) -> (c -&> b)
comapHyper f (Hyp g) = Hyp $ g . mapHyper f

-- instance Profunctor (-&>)

mzip1 :: [a] -> [b] -> [(a,b)]
mzip1 [] _ = []
mzip1 _ [] = []
mzip1 (a : as) (b : bs) = (a,b) : mzip1 as bs

mzip2 :: [a] -> [b] -> [(a,b)]
mzip2 [] = const []
mzip2 (a : as) = \case [] -> [] ; (b : bs) -> (a,b) : mzip2 as bs

mzip2'5 :: [a] -> [b] -> [(a,b)]
mzip2'5 = \case
  [] -> const []
  (a : as) -> \case {[] -> [] ; (b : bs) -> (a,b) : mzip2'5 as bs}


mzip3 :: [a] -> [b] -> [(a,b)]
mzip3 = foldr op (const [])
  where
      op :: a -> ([b] -> [(a, b)]) -> [b] -> [(a, b)]
      op a as = \case [] -> [] ; (b : bs) -> (a,b) : as bs

-- mzip4 :: [a] -> [b] -> [(a,b)]
-- mzip4 = foldr op (const [])
--   where
--     op :: a -> ([b] -> [(a, b)]) -> [b] -> [(a, b)]
--     op a as = foldr (op2 a as) []

--     op2 :: a -> ([b] -> [(a, b)]) -> b -> [(a, b)] -> [(a, b)]
--     op2 a l_bs2ab b l_ab = (a,b) : _ l_bs2ab l_ab

    --   op2

mzip5 :: [a] -> [b] -> [(a,b)]
mzip5 xs0 = zipA xs0 . zipB
  where
    zipA :: [a] -> Z a b -> [(a, b)]
    zipA [] _ = []
    zipA (a : as) r = runZ r (zipA as) a

    zipB :: [b] -> Z a b
    zipB [] = Z \_ _ -> []
    zipB (b : bs) = Z \z2ab a -> (a,b) : z2ab (zipB bs)

newtype Z a b = Z { runZ :: (Z a b -> [(a, b)]) -> a -> [(a, b)] }

mzip6 :: [a] -> [b] -> [(a,b)]
mzip6 xs0 = zipA xs0 . zipB
  where
    -- zipA :: [a] -> ([(a,b)] -&> (a -> [(a, b)])) -> [(a, b)]
    zipA :: [a] -> Z1 a b -> [(a, b)]
    zipA [] _ = []
    zipA (a : as) r = invoke r (Hyp $ zipA as) a

    -- zipB :: [b] -> [(a, b)] -&> (a -> [(a, b)])
    zipB :: [b] -> Z1 a b
    zipB [] = Hyp \_ _ -> []
    zipB (b : bs) = Hyp \z2ab a -> (a,b) : invoke z2ab (zipB bs)

type Z1 a b = [(a,b)] -&> (a -> [(a,b)])

mzip7 :: [a] -> [b] -> [(a,b)]
mzip7 xs0 ys0 = invoke (zipA xs0) (zipB ys0)
  where
    zipA :: [a] -> (a -> [(a, b)]) -&> [(a, b)]
    zipA [] = Hyp $ const []
    zipA (a : as) = Hyp $ \r -> invoke r (zipA as) a

    zipB :: [b] -> [(a, b)] -&> (a -> [(a, b)])
    zipB [] = Hyp \_ _ -> []
    zipB (b : bs) = Hyp \z2ab a -> (a,b) : invoke z2ab (zipB bs)

-- hypFold :: (a -> b -> c) -> c -> [a] -> b -&> c
-- hypFold f x0 = go
--   where
--     go [] = hconst x0
--     go (a:as) = Hyp $ \hf -> f a (invoke hf (go as))

hypFold :: (b -> a -> c) -> c -> [a] -> b -&> c
hypFold f x0 = foldr op z
  where
    z = hconst x0
    -- op a as = Hyp $ \hf -> f a (invoke hf as)
    op a as = mkHyp $ \hf -> f (hf as) a

mzip8 :: [a] -> [b] -> [(a,b)]
mzip8 xs0 ys0 = invoke (zipA xs0) (zipB ys0)
  where
    zipA :: [a] -> (a -> [(a, b)]) -&> [(a, b)]
    zipA = hypFold ($) []

    zipB :: [b] -> [(a, b)] -&> (a -> [(a, b)])
    zipB = hypFold f (const [])
      where
        f :: [(a, b)] -> b -> a -> [(a, b)]
        f ab b a = (a,b) : ab
        -- f ab = \b a -> (a,b) : ab
        -- f ab = flip \a b -> (a,b) : ab
        -- f ab = flip $ curry $ \(a, b) -> (a,b) : ab
        -- f xs = flip $ curry $ \x -> x : xs
        -- f xs = flip $ curry (: xs)
        -- f xs = flip $ curry $ flip (:) xs
        -- f xs = flip . curry . flip (:) $ xs
        -- f = flip . curry . flip (:)

mzipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c]
mzipWith1 f xs0 ys0 = invoke (xz xs0) (yz ys0)
  where
    xz :: [a] -> (a -> [c]) -&> [c]
    xz = hypFold id []

    -- yz :: [b] -> [c] -&> (a -> [c])
    yz = hypFold g (const [])
      where g cs b a = f a b : cs
        -- g :: [c] -> b -> a -> [c]

mzip3'1 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'1 f xs0 ys0 zs0 = invoke (xz xs0) $ invoke (yz ys0) (zz zs0)
  where
    xz :: [a] -> (a -> [d]) -&> [d] -- change this
    xz = hypFold id []

    yz :: [b] -> ([d] -&> (a -> b -> [d])) -&> ([d] -&> (a -> [d]))
    yz = hypFold (\x b -> fmap (\g a -> g a b) x) $ hconst $ const [] -- Is fmap bad?

    zz :: [c] -> ([d] -&> (a -> [d])) -&> ([d] -&> (a -> b -> [d]))
    zz = error "not implemented"


-- mzip3'2 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
-- mzip3'2 f xs0 ys0 zs0 = invoke (xz xs0) $ _ $ invoke (yz ys0) (zz zs0)
--   where
--     xz :: [a] -> (a -> [d]) -&> [d]
--     xz = hypFold id []

--     yz :: [b] -> (a -> b -> [d]) -&> [d]
--     yz = hypFold _ []

--     zz :: [c] -> [d] -&> (a -> b -> [d])
--     zz = hypFold (\ l_d c a b -> f a b c : l_d) $ const $ const []

-- mzip3'3 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
-- mzip3'3 f xs0 ys0 zs0 = invoke (foldr xf xz xs0) _ -- - $ foldr yf yz ys0 $ foldr zf zz zs0
--   where
--     xfld :: [a] -> (a -> [d]) -&> [d]
--     xfld = foldr xf xz
--     xz = Hyp $ const []
--     -- xf :: a -> ((a -> [d]) -&> [d]) -> [d] -&> (a -> [d]) -> [d]
--     xf :: a -> ((a -> [d]) -&> [d]) -> (a -> [d]) -&> [d]
--     xf x xs = Hyp \yk -> invoke yk xs x

--     yz = _
--     yf = _

--     zz = _
--     zf = _

mzip3'4 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'4 f xs0 ys0 zs0 = runZ3 (xfld xs0) (yfld ys0) (zfld zs0)
  where
    -- xfld :: [a] -> (t -> a -> [d]) -> (u -> a -> b -> [d]) -> [d]
    xfld :: [a] -> Z3 a b d
    xfld xs = foldr xf xz xs
    xz = Z3 \_ _ -> []
    xf :: a -> Z3 a b d -> Z3 a b d
    xf x xk = Z3 \yk zk -> invoke yk (zk xk) x

    yfld :: [b] -> (a -> b -> [d]) -&> (a -> [d])
    yfld ys = foldr yf yz ys
    yz = Hyp \_ _ -> []
    yf y yk = Hyp \zk a -> invoke zk yk a y

    zfld :: [c] -> Z3 a b d -> (a -> [d]) -&> (a -> b -> [d])
    zfld zs = foldr zf zz zs
    zz :: Z3 a b d -> (a -> [d]) -&> (a -> b -> [d])
    zz _ = Hyp \_ _ _ -> []
    zf :: c -> (Z3 a b d -> (a -> [d]) -&> (a -> b -> [d]))
            ->  Z3 a b d -> (a -> [d]) -&> (a -> b -> [d])
    zf c zk xk = Hyp \yk a b -> f a b c : runZ3 xk yk zk

-- newtype Z3 a t d = Z3 { runZ3 :: (Z3 a t d -> a -> [d]) -> (Z3 a t d -> t) -> [d] }
-- newtype Z3 a b t d = Z3 { runZ3 :: (a -> b -> [d]) -&> (t -> [d]) -> (a -> Z3 a b t d -&> t) -> [d] }
newtype Z3' t u v = Z3 { runZ3 :: t -&> u -> (Z3' t u v -> u -&> t) -> v }

type Z3 a b d = Z3' (a -> b -> [d]) (a -> [d]) [d]

-- type Z3'' t u v = t -&> u -> (Z3' t u v -> u -&> t) -> v
-- type Z3'' t u v = q -> (Z3' t u v -> x) -> v
-- type Z3'' t u v = t -&> u -> ((t -&> u -> (Z3' t u v -> u -&> t) -> v) -> u -&> t) -> v
-- type Z3'' t u v = q -> ((q -> (Z3' t u v -> x) -> v) -> x) -> v
-- type Z3'' t u v = q -> ((q -> ((q -> (Z3' t u v -> x) -> v) -> x) -> v) -> x) -> v
-- type Z3'' t u v = (Z3' t u v -> x) -> q -> v
-- type Z3'' t u v = x -&> (q -> v)

-- newtype ZQ q x v = ZQ { runZQ :: q -> (ZQ q x v -> x) -> v }
newtype ZQ q x v = ZQ { runZQ :: (ZQ q x v -> x) -> q -> v }

-- type Z3'' t u v = t -&> u -> ((u -&> t) -&> v -> u -&> t) -> v
-- type Z3'' t u v = t -&> u -> (u -&> t) -&> v
type Z3'' t u v = (u -&> t) -&> (t -&> u -> v)
type Z3''' a b d = Z3'' (a -> b -> [d]) (a -> [d]) [d]

--- >>> :kind! Z3'''

mzip3'5 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'5 f xs0 ys0 zs0 = invoke (xfld xs0) (zfld zs0) (yfld ys0)
  where
    -- xfld :: [a] -> (t -> a -> [d]) -> (u -> a -> b -> [d]) -> [d]
    -- xfld :: [a] -> Z3''' a b d
    xfld :: [a] -> Z3l a b d -&> Z3r a b d
    xfld xs = foldr xf xz xs
    xz :: Z3l a b d -&> Z3r a b d
    xz = Hyp $ \_ _ -> []
    xf :: a -> Z3l a b d -&> Z3r a b d -> Z3l a b d -&> Z3r a b d
    -- xf :: a -> Z3'' (a -> b -> [d]) (a -> [d]) [d] -> Z3'' (a -> b -> [d]) (a -> [d]) [d]
    -- xf :: a -> (((a -> [d]) -&> (a -> b -> [d])) -&> ((a -> b -> [d]) -&> (a -> [d]) -> [d]))
    --         ->  ((a -> [d]) -&> (a -> b -> [d])) -&> ((a -> b -> [d]) -&> (a -> [d]) -> [d])
    xf x xk = Hyp \zk yk -> invoke yk (invoke zk xk) x

    yfld :: [b] -> (a -> b -> [d]) -&> (a -> [d])
    yfld ys = foldr yf yz ys
    yz = Hyp \_ _ -> []
    yf y yk = Hyp \zk a -> invoke zk yk a y

    -- zfld :: [c] -> Z3''' a b d -> (a -> [d]) -&> (a -> b -> [d])
    -- zfld :: [c] -> ((a -> b -> [d]) -&> (a -> [d]) -> [d])
    --            -&> ((a -> [d]) -&> (a -> b -> [d]))
    zfld :: [c] -> Z3r a b d -&> Z3l a b d
    zfld zs = foldr zf zz zs
    zz :: Z3r a b d -&> Z3l a b d
    zz = Hyp \_ -> Hyp \ _ _ _ -> []
    -- zz = Hyp $ const $ Hyp \_ _ _ -> []
    zf :: c -> Z3r a b d -&> Z3l a b d -> Z3r a b d -&> Z3l a b d
    zf c zk = Hyp \xk -> Hyp \yk a b -> f a b c : invoke xk zk yk

type Z3l a b d = (a -> [d]) -&> (a -> b -> [d])
type Z3r a b d = (a -> b -> [d]) -&> (a -> [d]) -> [d]

mzip3'6 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'6 f xs0 ys0 zs0 = invoke (xfld xs0) (zfld zs0) (yfld ys0)
  where
    -- xfld :: [a] -> (t -> a -> [d]) -> (u -> a -> b -> [d]) -> [d]
    -- xfld :: [a] -> Z3''' a b d
    xfld :: [a] -> Z3l a b d -&> Z3r a b d
    xfld xs = hypFold xf xz xs
    xz :: Z3r a b d
    xz = const []
    xf :: Z3l a b d -> a -> Z3r a b d
    -- xf :: ((t -> t1) -&> a1) -> t -> (a1 -&> (t -> t1)) -> t1
    xf zk x yk = invoke yk zk x

    yfld :: [b] -> (a -> b -> [d]) -&> (a -> [d])
    yfld ys = hypFold flip (const []) ys

    zfld :: [c] -> Z3r a b d -&> Z3l a b d
    zfld zs = hypFold zf zz zs
    zz :: Z3l a b d
    zz =  Hyp \ _ _ _ -> []
    zf :: Z3r a b d -> c -> Z3l a b d
    zf xk c = Hyp \yk a b -> f a b c : xk yk

-- mzip3'7 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
-- mzip3'7 f xs0 ys0 zs0 = invoke
--     (hypFold (\ atl a patlatl -> atl _) (const []) xs0)
--     (hypFold _ _ zs0)
--     (hypFold _ _ ys0)
--   where
--     xf yk x zk = yk (invoke zk xk) x

hypFold' :: Foldable t => (a -> b -> c) -> c -> t a -> b -&> c
hypFold' f x0 = foldr op z
  where
    z = hconst x0
    -- op a as = Hyp $ \hf -> f a (invoke hf as)
    op a as = mkHyp $ \hf -> f a (hf as)

mzip3'7 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'7 f xs0 ys0 zs0 = invoke (xfld xs0) (zfld zs0) (yfld ys0)
  where
    -- xfld :: [a] -> (t -> a -> [d]) -> (u -> a -> b -> [d]) -> [d]
    -- xfld :: [a] -> Z3''' a b d
    xfld :: [a] -> Z3l' a b d -&> Z3rr' a b d
    xfld xs = hypFold' xf xz xs
    xz :: Z3rr' a b d
    xz = const []
    xf :: a -> Z3l' a b d -> Z3r' a b d -> [d]
    -- xf :: ((t -> t1) -&> a1) -> t -> (a1 -&> (t -> t1)) -> t1
    xf x zk yk = invoke yk zk x

    yfld :: [b] -> Z3r' a b d
    yfld ys = hypFold' (&) (const []) ys

    zfld :: [c] -> Z3rr' a b d -&> Z3l' a b d
    zfld zs = hypFold' zf zz zs
    zz :: Z3l' a b d
    zz = Hyp \ _ _ _ -> []
    zf :: c -> Z3rr' a b d -> Z3l' a b d
    zf c xk = Hyp \yk b a -> f a b c : xk yk

type Need a b = b -&> (a -> b)
type Gives a b = (a -> b) -&> b

type Z3ra a b d = a -> [d]
type Z3rb a b d = b -> a -> [d]
-- type Z3l' a b d = Z3ra a b d -&> Z3rb a b d
-- type Z3r' a b d = Z3rb a b d -&> Z3ra a b d
type Z3l' a b d = Need b (a -> [d])
type Z3r' a b d = Gives b (a -> [d])
type Z3rr' a b d = Z3r' a b d -> [d]

mzip3'8 :: forall a b c d. (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
mzip3'8 f xs0 ys0 zs0 = invoke (xfld xs0) (zfld zs0) (yfld ys0)
  where
    -- xfld :: [a] -> (t -> a -> [d]) -> (u -> a -> b -> [d]) -> [d]
    -- xfld :: [a] -> Z3''' a b d
    xfld :: [a] -> Need b (a -> [d]) -&> (Gives b (a -> [d]) -> [d])
    xfld xs = hypFold' xf xz xs
    xz :: (Gives b (a -> [d]) -> [d])
    xz = const []
    xf :: a -> Need b (a -> [d]) -> Gives b (a -> [d]) -> [d]
    -- xf :: ((t -> t1) -&> a1) -> t -> (a1 -&> (t -> t1)) -> t1
    xf x zk yk = invoke yk zk x

    yfld :: [b] -> Gives b (a -> [d])
    yfld ys = hypFold' (&) (const []) ys

    zfld :: [c] -> (Gives b (a -> [d]) -> [d]) -&> Need b (a -> [d])
    zfld zs = hypFold' zf zz zs
    zz :: Need b (a -> [d])
    zz = Hyp \ _ _ _ -> []
    zf :: c -> (Gives b (a -> [d]) -> [d]) -> Need b (a -> [d])
    zf c xk = Hyp \yk b a -> f a b c : xk yk
