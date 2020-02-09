module Chapter1.Exercise2Spec ( spec ) where

import           Chapter1.Exercise2
import           Data.Char          (chr)
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = describe "reverse C-style strings" $ do
    context "a string ending in a null character" $ do
        it "should reverse the string preserving the null character" $ property
            $ do
                \str -> reverseString (str ++ [ chr 0 ]) == reverse
                    (str :: String) ++ [ chr 0 ]
