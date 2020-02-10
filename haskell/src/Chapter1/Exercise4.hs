module Chapter1.Exercise4 ( areAnagrams, areAnagrams' ) where

import           Data.List (sort)
import qualified Data.Map  as Map

-- Write a method to decice if two strings are anagrams or not.
areAnagrams :: String -> String -> Bool
areAnagrams str1 str2 = sort str1 == sort str2

-- ugly solution using map approach
areAnagrams' :: String -> String -> Bool
areAnagrams' str1 str2 = foldl ((+) . abs) 0 absolute == 0
  where
    absolute = foldl (helper (-)) adds str2

    adds = foldl (helper (+)) Map.empty str1

    helper :: (Int -> Int -> Int)
        -> Map.Map Char Int -> Char -> Map.Map Char Int
    helper op m c = Map.alter f c m
      where
        f :: Maybe Int -> Maybe Int
        f Nothing  = Just 1
        f (Just x) = Just $ x `op` 1
