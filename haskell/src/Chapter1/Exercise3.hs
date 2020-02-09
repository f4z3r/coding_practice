module Chapter1.Exercise3 ( removeDups ) where

-- Design an algorithm and write code to remove the duplicate characters in a string
-- without using any additional buffer.
--
-- This is not possible in haskell due to the immutable characteristics of data.
removeDups :: String -> String
removeDups = foldl helper []
  where
    helper :: String -> Char -> String
    helper str chr
        | chr `elem` str = str
        | otherwise = str ++ [ chr ]



