module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import HelloWorld (helloWorld)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "HelloWorld.helloWorld" do
    test "Hello, World!" do
      Assert.equal "Hello, World!" helloWorld
