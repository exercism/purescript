module Test.Main where

import Prelude
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Leap as Leap


main = runTest do
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
