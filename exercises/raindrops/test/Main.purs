module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Raindrops (raindrops)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Raindrops.raindrops" do
    test "1" do
      Assert.equal "1" $ raindrops 1
    test "3" do
      Assert.equal "Pling" $ raindrops 3
    test "5" do
      Assert.equal "Plang" $ raindrops 5
    test "7" do
      Assert.equal "Plong" $ raindrops 7
    test "6" do
      Assert.equal "Pling" $ raindrops 6
    test "9" do
      Assert.equal "Pling" $ raindrops 9
    test "10" do
      Assert.equal "Plang" $ raindrops 10
    test "14" do
      Assert.equal "Plong" $ raindrops 14
    test "15" do
      Assert.equal "PlingPlang" $ raindrops 15
    test "21" do
      Assert.equal "PlingPlong" $ raindrops 21
    test "25" do
      Assert.equal "Plang" $ raindrops 25
    test "35" do
      Assert.equal "PlangPlong" $ raindrops 35
    test "49" do
      Assert.equal "Plong" $ raindrops 49
    test "52" do
      Assert.equal "52" $ raindrops 52
    test "105" do
      Assert.equal "PlingPlangPlong" $ raindrops 105
