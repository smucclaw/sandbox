module Yoneda where
{-
  Continuation-passing style via the Yoneda embedding to re-associate left folds
  into right folds.

  toCont(inuation) is the Yoneda embedding from a monoid into the
  corresponding endomorphism monoid.
  More concretely, it maps an element x of a monoid m to (x <>), its
  corresponding continuation, ie action, in the monoid of endormophisms
  over m.

  runCont(inuation) is then the inverse mapping from the endomorphism
  monoid back to the original monoid.
  It takes a continuation as input and runs it with the identity element
  mempty of the original monoid and returns the result.

  Note that the Yoneda Lemma says that these embeddings are inverses so
  that we can happily identify an element of a monoid with its corresponding
  continuation.

  This is essentially the same trick as employed by difference lists and
  ShowS and showsPrec, to re-associate a left fold of the form
  (((as ++ bs) ++ cs) ++ ds) into (as ++ (bs ++ (cs ++ ds))), which is more
  efficient to compute when dealing with singly linked lists.
-}

import Data.Monoid (Endo(..))

import Flow

toCont :: Monoid m => m -> Endo m
toCont x = (x <>) |> Endo

runCont :: Monoid m => Endo m -> m
runCont cont = appEndo cont mempty

-- myConcat :: Monoid a => [a] -> a
-- myConcat = fmap toCont .> mconcat .> runCont