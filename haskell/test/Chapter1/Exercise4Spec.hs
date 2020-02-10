module Chapter1.Exercise4Spec ( spec ) where

import           Chapter1.Exercise4
import           Data.List          (sort)
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = describe "decide if two strings are anagrams" $ do
    context "given two strings that are not anagrams" $ do
        it "should return false" $ property $ do
            \str char -> not $ areAnagrams str $ (char :: Char)
                : (str :: String)
    context "given two strings that are anagrams" $ do
        it "should return true on sort" $ property $ do
            \str -> areAnagrams str $ sort (str :: String)
        it "should return true on head tail switch" $ property $ do
            \str char -> areAnagrams (char : str) $ (str :: String)
                ++ [ char :: Char ]
    context "given two strings that are not anagrams (using map)" $ do
        it "should return false" $ property $ do
            \str char -> not $ areAnagrams' str $ (char :: Char)
                : (str :: String)
    context "given two strings that are anagrams (using map)" $ do
        it "should return true on sort" $ property $ do
            \str -> areAnagrams' str $ sort (str :: String)
        it "should return true on head tail switch" $ property $ do
            \str char -> areAnagrams' (char : str) $ (str :: String)
                ++ [ char :: Char ]

