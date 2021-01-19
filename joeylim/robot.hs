import Data.Map (Map)

-- Robot constructor
robot (name,attack,hp) = \message -> message (name,attack,hp)

-- Create instances of robot
killerRobot = robot ("Kill3r",25,200)
gentleGiant = robot ("Mr. Friendly", 10,300)

-- Helper functions / accessors
name (n,_,_) = n
attack (_,a,_) = a
hp (_,_,hp) = hp

-- Getters
getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

-- Setters
-- [Usage: Recreate new object by modifying existing ones. Can't directly mutate the existing object.]
-- [E.g. nicerRobot = setName killerRobot "kitty"]
setName aRobot newName = aRobot (\(n,a,h) -> robot (newName,a,h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n,newAttack,h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n,a,newHP))

-- Print stats of an object
printRobot aRobot = aRobot (\(n,a,h) -> n ++
 " attack:" ++ (show a) ++
 " hp:" ++ (show h))

-- Sending messages between objects
-- Tell robot it has taken damage:
damage aRobot attackDamage = aRobot (\(n,a,h) -> robot (n,a,h-attackDamage))

-- Fight message from one robot to another:
fight aRobot defender = damage defender attack
 where attack = if getHP aRobot > 10
                then getAttack aRobot
                else 0

-- Map over list of robots
printAllStats = map printRobot robotList
 where robotList = [killerRobot,gentleGiant]