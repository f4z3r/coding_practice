module Chapter1.Exercise1Spec ( spec ) where

import           Chapter1.Exercise1
import           Data.List
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = describe "string has unique chars" $ do
    context "using no sorting" $ do
        it "should return true on empty strings" $ do
            containsUnique "" `shouldBe` True
        it "should return true on string with unique chars" $ property $ do
            \str -> containsUnique $ nub (str :: String)
        it "should return false on strings with duplicate chars" $ property $ do
            \str -> null str || not (containsUnique $ str ++ (str :: String))
    context "when using sorting method" $ do
        it "should return true on empty strings" $ do
            containsUniqueSort "" `shouldBe` True
        it "should return true on string with unique chars" $ property $ do
            \str -> containsUniqueSort $ nub (str :: String)
        it "should return false on strings with duplicate chars" $ property $ do
            \str -> null str || not
                (containsUniqueSort $ str ++ (str :: String))



