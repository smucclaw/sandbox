module Sketches.CharCreator where
import Types
sketch :: StateTree
sketch =
  state "Character Creation" `contains`
  [
    "Pre-Equipment" :-> [(Nothing, state "Choose Equipment")]
    `contains`
    [ leaf $ state "Choose Class"
    , leaf $ state "Choose Background"
    ]
  ,
    state "Choose Description" `contains`
    [ leaf $ state "Choose Age"
    , leaf $ "Choose Height" :-> [(Nothing, state "Choose Width")]
    --- ^ add "Choose Width" (not in original spec) to demonstrate need for recursion in the @grow@ function
    , leaf $ state "Choose Appearance"
    , leaf $ state "Choose Alignment"
    ]
  , leaf $ state "Choose Ability Scores"
  , leaf $ state "Choose Potato Scores"
  , leaf $ "Choose Race" :-> [(Just "Dwarf", state "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   state "Choose Elf Sub-Race")]
  ]
