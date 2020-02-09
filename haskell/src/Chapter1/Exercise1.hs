module Chapter1.Exercise1 ( containsUnique, containsUniqueSort ) where

import           Data.List (sort)
import           Data.Set  (Set, empty, insert, member, notMember)

-- Implement an algorithm to determine if a string has all unique characters. What if you
-- cannot use additional data structures?
containsUnique :: String -> Bool
containsUnique = helper empty
  where
    helper :: Set Char -> String -> Bool
    helper _ [] = True
    helper set (h : rest)
        | null rest = h `notMember` set
        | h `member` set = False
        | otherwise = helper (insert h set) rest

containsUniqueSort :: String -> Bool
containsUniqueSort = helper . sort
  where
    helper :: String -> Bool
    helper [] = True
    helper [ _ ] = True
    helper (a : rest)
        | a == head rest = False
        | otherwise = helper rest
