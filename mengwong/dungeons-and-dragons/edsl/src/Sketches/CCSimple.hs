module Sketches.CCSimple where
import Types
sketch :: StateTree
sketch = 
  state "Character Creation" `contains`
  [
    leaf $ state "Choose Ability Scores"
  , leaf $ "Choose Race" :-> [(Just "Dwarf", state "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   state "Choose Elf Sub-Race")
                             ]
  ]
