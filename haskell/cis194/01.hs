-- Compute the sum of the integers from 1 to n.
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

hailstone :: Integer -> Integer
hailstone n
  | mod n 2 == 0 = div n 2
  | otherwise    = 3*n + 1

-- Generate the sequence of hailstone iterations from a starting number.
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- The number of hailstone steps needed to reach 1 from a starting
-- number.
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1

foo :: Integer -> Integer
foo 0 = 16
foo 1
  | "Haskell" > "C++" = 3
  | otherwise = 4
foo n
  | n < 0 = 0
  | mod n 17 == 2 = -43
  | otherwise = n + 3

isEven :: Integer -> Bool
isEven n = if mod n 2 == 0
           then True
           else False

sumPair :: (Int, Int) -> Int
sumPair (x, y) = x + y

f :: Int -> Int -> Int -> Int
f x y z = x + y + z

-- Compute the length of a list of Integers.
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (_:xs) = 1 + intListLength xs

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = [] -- Do nothing to the empty list
sumEveryTwo (x:[]) = [x] -- Do nothing to lists with a single element
sumEveryTwo (x:y:zs) = (x + y) : sumEveryTwo zs
