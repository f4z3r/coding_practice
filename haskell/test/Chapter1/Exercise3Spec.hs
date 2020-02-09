module Chapter1.Exercise3Spec ( spec ) where

import           Chapter1.Exercise3
import           Data.List          (nub)
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = describe "filter duplicates from string" $ do
    context "given any string" $ do
        it "should not return a longer string" $ property $ do
            \str -> length (removeDups str) <= length (str :: String)
    context "given a string with unique characters" $ do
        it "should return the string itself" $ property $ do
            \str -> removeDups (nub str) `shouldBe` nub (str :: String)
    it "should filter out from string 'aba'" $ do
        removeDups "aba" `shouldBe` "ab"
    it "should filter out from string 'abc!!ce'" $ do
        removeDups "abc!!ce" `shouldBe` "abc!e"
    it "should filter out from string 'aaa'" $ do
        removeDups "aaa" `shouldBe` "a"
    it "should filter out from string 'the lazy fox did things'" $ do
        removeDups "the lazy fox did things" `shouldBe` "the lazyfoxdings"
