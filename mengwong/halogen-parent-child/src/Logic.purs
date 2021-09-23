module Logic where

import Prelude
import Data.Maybe
import Data.Either
import Defaultable
import Data.Array (any, all)


-- generic logic for evaluating worlds according to a collection of predicates
data AnyAll a = Any (Array a) | All (Array a)

always = All [ const $ true ]
never  = All [ const $ false ]

-- benefit of the doubt, in evaluating a Defaultable value.
-- see discussion in README.
benefit :: forall a. Default a -> (a -> Boolean) -> Boolean
benefit d f = case d of
  Right (Just n) -> f n
  Right Nothing  -> true
  Left _         -> true

aaeval :: World_1 -> AnyAll (World_1 -> Boolean) -> Boolean
aaeval w (Any fs) = any (\f -> f w) fs
aaeval w (All fs) = all (\f -> f w) fs




-- there's got to be a better way to do this --
-- i probably want to instantiate AnyAll into some kind of Applicative
-- so we can directly run pred_1 against case_1a and get back a Boolean without tying it to a specific world
caseEval p c =
  { age:       aaeval c p.age
  , height:    aaeval c p.height
  , race:      aaeval c p.race
  , sub_dwarf: aaeval c p.sub_dwarf
  , sub_elf:   aaeval c p.sub_elf
  }



-- we set up a specific world: dungeons and dragons

data Race = Dwarf | Elf
data SubDwarf = Mountain | Hill
data SubElf = Aquatic | Dark | High | Moon | Sun

derive instance eqRace :: Eq Race
derive instance eqDwarf :: Eq SubDwarf
derive instance eqElf :: Eq SubElf

type World_1 = 
  { age       :: Default Int
  , height    :: Default Int
  , race      :: Default Race
  , sub_dwarf :: Default SubDwarf
  , sub_elf   :: Default SubElf
  }

visible_1 = { age:       always
            , height:    All [ \{age} -> benefit age (_ > 21) ]
            , race:      always
            , sub_dwarf: All [ \{race} -> benefit race (_ == Dwarf) ]
            , sub_elf:   All [ \{race} -> benefit race (_ == Elf) ]
            }

case_1a = { age:  Left $ Just 3 , height:  Left Nothing , race:  Left Nothing      , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should show everything
case_1b = { age:  Left $ Just 30, height:  Left Nothing , race:  Left Nothing      , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should show everything
case_1c = { age: Right $ Just 3 , height:  Left Nothing , race:  Left Nothing      , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should omit height
case_1d = { age: Right $ Just 30, height:  Left Nothing , race:  Left Nothing      , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should show height
case_1e = { age: Right $ Just 30, height:  Left Nothing , race:  Left (Just Dwarf) , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should show dwarf and elf
case_1f = { age: Right $ Just 30, height:  Left Nothing , race: Right (Just Dwarf) , sub_dwarf:  Left Nothing , sub_elf:   Left Nothing } -- should omit elf


