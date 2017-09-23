module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import BracketPush (isPaired)

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
  suite "BracketPush.isPaired" do

    test "paired square brackets" $
      Assert.equal true
                   (isPaired "[]")

    test "empty string" $
      Assert.equal true
                   (isPaired "")

    test "unpaired brackets" $
      Assert.equal false
                   (isPaired "[[")

    test "wrong ordered brackets" $
      Assert.equal false
                   (isPaired "}{")

    test "paired with whitespace" $
      Assert.equal true
                   (isPaired "{ }")

    test "simple nested brackets" $
      Assert.equal true
                   (isPaired "{[]}")

    test "several paired brackets" $
      Assert.equal true
                   (isPaired "{}[]")

    test "paired and nested brackets" $
      Assert.equal true
                   (isPaired "([{}({}[])])")

    test "unopened closing brackets" $
      Assert.equal false
                   (isPaired "{[)][]}")

    test "unpaired and nested brackets" $
      Assert.equal false
                   (isPaired "([{])")

    test "paired and wrong nested brackets" $
      Assert.equal false
                   (isPaired "[({]})")

    test "math expression" $
      Assert.equal true
                   (isPaired "(((185 + 223.85) * 15) - 543)/2")

    test "complex latex expression" $
      Assert.equal true
                   (isPaired "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)")
