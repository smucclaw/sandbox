module Petri where

data Place      a i = P a i [Transition a i]
data Transition a i = T a i [Place a i]

-- the simple version of a petri net assumes all edge weights are 1
p a ts = P a 1 ts
t a ps = T a 1 ps

example_1 = p "start"
            [t "middle"
             [p "end"
              []]]

example_2 = p "start"
            [t "fork"
             [p "left branch"
              [t "left event"
               [p "left middle"
                t'join]]
             ,p "right branch"
              [t "right event"
               [p "right middle"
                t'join]]
             ]]
  where t'join = [t "join"
                  [p "end"
                   []]]
