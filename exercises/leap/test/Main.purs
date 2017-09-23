module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Leap as Leap

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
  suite "Leap.isLeapYear" do
    test "leap year" do
      Assert.equal true $ Leap.isLeapYear 1996
    test "non-leap year" do
      Assert.equal false $ Leap.isLeapYear 1997
    test "non-leap even year" do
      Assert.equal false $ Leap.isLeapYear 1998
    test "century" do
      Assert.equal false $ Leap.isLeapYear 1900
    test "second century" do
      Assert.equal false $ Leap.isLeapYear 1800
    test "fourth century" do
      Assert.equal true $ Leap.isLeapYear 2400
    test "y2k" do
      Assert.equal true $ Leap.isLeapYear 2000
