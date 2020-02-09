module Chapter1.Exercise1Spec ( spec ) where

import           Chapter1.Exercise1
import           Data.List
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = describe "string has unique chars" $ do
    context "when given empty strings" $ do
        it "should return true" $ do
            containsUnique "" `shouldBe` True
    context "when given string with unique character" $ do
        it "should return true" $ property $ do
            \str -> containsUnique $ nub (str :: String)
    context "when given a string with duplicate characters" $ do
        it "should return false" $ property $ do
            \str -> null str || not (containsUnique $ str ++ (str :: String))



