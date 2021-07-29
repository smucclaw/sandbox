module Sketches.CCMedium where
import Types
sketch :: StateTree
sketch =
  state "Character Creation" `contains`
  [
    leaf $ state "Choose Ability Scores"
  , leaf $ "Choose Race" :-> [(Just "Dwarf", state "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   "Choose Elf Sub-Race" :-> [(Just "High Elf", state "Greet Galadriel")
                                                                       ,(Just "Low Elf",  state "Greet Elrond")
                                                                       ])
                             ]
  ]
