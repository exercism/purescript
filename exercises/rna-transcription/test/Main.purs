module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import RNATranscription (toRNA)

main :: forall eff
  . Eff ( avar :: AVAR
        , console :: CONSOLE
        , testOutput :: TESTOUTPUT
        | eff
        )
        Unit
main = runTest suites

suites :: forall e. TestSuite e
suites =
  suite "RNATranscription.toRNA" do
    test "RNA complement of cytosine is guanine" $
      Assert.equal (Just "G") (toRNA "C")

    test "RNA complement of guanine is cytosine" $
      Assert.equal (Just "C") (toRNA "G")

    test "RNA complement of thymine is adenine" $
      Assert.equal (Just "A") (toRNA "T")

    test "RNA complement of adenine is uracil" $
      Assert.equal (Just "U") (toRNA "A")

    test "RNA complement" $
      Assert.equal (Just "UGCACCAGAAUU") (toRNA "ACGTGGTCTTAA")

    test "correctly handles invalid input (RNA instead of DNA)" $
      Assert.equal Nothing (toRNA "U")

    test "correctly handles completely invalid DNA input" $
      Assert.equal Nothing (toRNA "XXX")

    test "correctly handles partially invalid DNA input" $
      Assert.equal Nothing (toRNA "ACGTXXXCTTAA")
