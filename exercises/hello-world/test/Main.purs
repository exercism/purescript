module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Data.Maybe (Maybe(Just, Nothing))
import HelloWorld (helloWorld)

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
  suite "HelloWorld.helloWorld" do
    test "Hello with no name" do
      Assert.equal "Hello, World!" (helloWorld Nothing)
    test "Hello to a sample name" do
      Assert.equal "Hello, Alice!" (helloWorld (Just "Alice"))
    test "Hello to another sample name" do
      Assert.equal "Hello, Bob!" (helloWorld (Just "Bob"))
