module Chapter1.Exercise2 ( reverseString ) where

-- Write code to reverse a C-style string. (C-String means that "abcd" is
-- represented as five characters, including the null character.
reverseString :: String -> String
reverseString str = (reverse $ init str) ++ [ last str ]

