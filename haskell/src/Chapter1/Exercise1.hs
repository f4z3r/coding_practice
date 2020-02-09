module Chapter1.Exercise1 ( containsUnique, containsUniqueSort ) where

import           Data.List (sort)
import           Data.Set  (Set, empty, insert, member, notMember)

-- Implement an algorithm to determine if a string has all unique characters. What if you
-- cannot use additional data structures?
containsUnique :: String -> Bool
containsUnique "" = True
containsUnique str = helper str empty
  where
    helper :: String -> Set Char -> Bool
    helper [] _ = True
    helper (h : rest) set
        | null rest = h `notMember` set
        | h `member` set = False
        | otherwise = helper rest $ insert h set

containsUniqueSort :: String -> Bool
containsUniqueSort = helper . sort
  where
    helper :: String -> Bool
    helper "" = True
    helper [ _ ] = True
    helper (a : rest)
        | a == head rest = False
        | otherwise = helper rest
