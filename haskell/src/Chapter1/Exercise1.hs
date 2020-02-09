module Chapter1.Exercise1 ( containsUnique ) where

import           Data.Set (Set, empty, insert, member, notMember)

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
