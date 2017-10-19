module Test.Main where

import Prelude

import CollatzConjecture (collatz)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

main :: forall eff
  . Eff ( avar :: AVAR
        , console :: CONSOLE
        , testOutput :: TESTOUTPUT
        | eff
        )
        Unit
main = runTest suites

suites :: forall e. TestSuite e
suites = do
  suite "CollatzConjecture.collatz" do
    test "zero steps for one" do
      Assert.equal (Just 0) (collatz 1)

    test "divide if even" do
      Assert.equal (Just 4) (collatz 16)

    test "even and odd steps" do
      Assert.equal (Just 9) (collatz 12)

    test "Large number of even and odd steps" do
      Assert.equal (Just 152) (collatz 1000000)

    test "zero is an error" do
      Assert.equal Nothing (collatz 0)

    test "negative value is an error" do
      Assert.equal Nothing (collatz (-15))
