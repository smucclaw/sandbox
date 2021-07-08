-- {-#  LANGUAGE FlexibleInstances #-}
-- class Something a where doSomething :: a -> Integer
-- instance Something Integer where doSomething x = 1
-- instance Something Char where doSomething x = 2
-- instance Something String where doSomething x = 3
-- instance Something [a] where doSomething x = 4
class Something a where
    doSomething :: a -> Integer
    doSomethingWithList :: [a] -> Integer
    doSomethingWithList x = 4
instance Something Integer where
    doSomething x = 1
instance Something Char where
    doSomething x = 2
    doSomethingWithList x = 3
instance Something a => Something [a] where
    doSomething = doSomethingWithList

foo = doSomething "hello"