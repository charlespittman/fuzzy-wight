-- Implement the validation algorithm for credit cards.

-- 1. Double the value of every second digit beginning from the right.
--    For example, [1,3,8,6] -> [2,3,16,6]

-- 2. Add the digits of the new list.  For example, [2,3,16,6] ->
--    2+3+1+6+6 = 18

-- 3. If (mod sum 10) == 0, the number is valid.

-- Convert positive Integers to a list of digits.  Return an empty
-- list for 0 or negative inputs.
-- toDigits 1234 == [1,2,3,4]
-- toDigits 0 == []
-- toDigits (-17) == []
toDigits :: Integer -> [Integer]
toDigits x
  | x <= 0 = []
  | otherwise = toDigits (div x 10) ++ [mod x 10]

-- As toDigits, but in reverse.
-- toDigitsRev 1234 == [4,3,2,1]
toDigitsRev :: Integer -> [Integer]
toDigitsRev x =  reverse (toDigits x)

-- Once we have the digits in the proper order, we need to double
-- every other one (from the right).
-- doubleEveryOther [8, 7, 6, 5] == [16, 7, 12, 5]
-- doubleEveryOther [1, 2, 3] == [1, 4, 3]
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (x:[]) = [x]
doubleEveryOther (x:y:zs) = x : y*2 : doubleEveryOther zs

doubleEveryOtherFeeder :: [Integer] -> [Integer]
doubleEveryOtherFeeder (xs) = reverse xs

--doubleEveryOtherToDigits :: [Integer] -> [Integer]
--doubleEveryOtherToDigits [] = []
--doubleEveryOtherToDigits (x:[]) = [x]
--doubleEveryOtherToDigits (x:ys) = toDigits (head x) : doubleEveryOtherToDigits ys
-- The output of doubleEveryOther has a mix of one-digit and two-digit
-- numbers.  Split up the two-digit numbers.
-- sumDigits [16, 7, 12, 5] = 1 + 6 + 7 + 1 + 2 + 5 = 22
--sumDigits :: [Integer] -> Integer
--sumDigits xs = sum (concatMap doubleEveryOther xs)

-- Rest from chapter

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = [] -- Do nothing to the empty list
sumEveryTwo (x:[]) = [x] -- Do nothing to lists with a single element
sumEveryTwo (x:y:zs) = (x + y) : sumEveryTwo zs

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
