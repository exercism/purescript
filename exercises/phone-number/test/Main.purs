module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import PhoneNumber (phoneNumber)

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
  suite "PhoneNumber.phoneNumber" do
    test "cleans the number" do
      Assert.equal "2234567890" $ phoneNumber "(223) 456-7890"
    test "cleans numbers with dots" do
      Assert.equal "2234567890" $ phoneNumber "223.456.7890"
    test "cleans numbers with multiple spaces" do
      Assert.equal "2234567890" $ phoneNumber "223 456   7890   "
    test "invalid when 9 digits" do
      Assert.equal "None" $ phoneNumber "123456789"
    test "invalid when 11 digits does not start with a 1" do
      Assert.equal "None" $ phoneNumber "22234567890"
    test "valid when 11 digits and starting with 1" do
      Assert.equal "2234567890" $ phoneNumber "12234567890"
    test "valid when 11 digits and starting with 1 even with punctuation" do
      Assert.equal "2234567890" $ phoneNumber "+1 (223) 456-7890"
    test "invalid when more than 11 digits" do
      Assert.equal "None" $ phoneNumber "321234567890"
    test "invalid with letters" do
      Assert.equal "None" $ phoneNumber "123-abc-7890"
    test "invalid with punctuations" do
      Assert.equal "None" $ phoneNumber "123-@:!-7890"
    test "invalid if area code does not start with 2-9" do
      Assert.equal "None" $ phoneNumber "(123) 456-7890"
    test "invalid if exchange code does not start with 2-9" do
      Assert.equal "None" $ phoneNumber "(223) 056-7890"


