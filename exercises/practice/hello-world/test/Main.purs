module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Data.Maybe (Maybe(Just, Nothing))
import HelloWorld (helloWorld)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "HelloWorld.helloWorld" do
    test "Hello with no name" do
      Assert.equal "Hello, World!" (helloWorld Nothing)
    test "Hello to a sample name" do
      Assert.equal "Hello, Alice!" (helloWorld (Just "Alice"))
    test "Hello to another sample name" do
      Assert.equal "Hello, Bob!" (helloWorld (Just "Bob"))
