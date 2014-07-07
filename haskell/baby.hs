--doubleUs x y = doubleMe x + doubleMe y
--doubleMe x = x + x
--doubleSmallNumber x = if x > 100
--                      then x
----                      else x*2
----doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
--removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
x :: Int
x = 3
biggestInt, smallestInt :: Int
biggestInt = maxBound
smallestInt = minBound
n :: Integer
n = 2^(2^(2^(2^2)))
-- Unicode characters
c1, c2, c3 :: Char
c1 = 'x'
c2 = 'Ø'
c3 = 'ダ'

-- quick: quicksort function in Haskell
quick :: [Integer] -> [Integer]
quick (h:t)= quick [ y | y <- t , y < h] ++ [h] ++ quick [ y | y <- t , y > h]
quick [] = []
