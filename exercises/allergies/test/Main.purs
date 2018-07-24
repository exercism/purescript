module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Allergies (allergicTo, list)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Allergies.allergicTo" do

    test "no allergies means not allergic" $
      Assert.equal false
                   (allergicTo 0 "peanuts")

    test "no allergies means not allergic" $
      Assert.equal false
                   (allergicTo 0 "cats")

    test "no allergies means not allergic" $
      Assert.equal false
                   (allergicTo 0 "strawberries")

    test "is allergic to eggs" $
      Assert.equal true
                   (allergicTo 1 "eggs")

    test "allergic to eggs in addition to other stuff" $
      Assert.equal true
                   (allergicTo 5 "eggs")

    test "allergic to eggs in addition to other stuff" $
      Assert.equal true
                   (allergicTo 5 "shellfish")

    test "allergic to eggs in addition to other stuff" $
      Assert.equal false
                   (allergicTo 5 "strawberries")

  suite "Allergies.list" do

    test "no allergies at all" $
      Assert.equal [
                   ]
                   (list 0)

    test "allergic to just eggs" $
      Assert.equal [ "eggs"
                   ]
                   (list 1)

    test "allergic to just peanuts" $
      Assert.equal [ "peanuts"
                   ]
                   (list 2)

    test "allergic to just strawberries" $
      Assert.equal [ "strawberries"
                   ]
                   (list 8)

    test "allergic to eggs and peanuts" $
      Assert.equal [ "eggs"
                   , "peanuts"
                   ]
                   (list 3)

    test "allergic to more than eggs but not peanuts" $
      Assert.equal [ "eggs"
                   , "shellfish"
                   ]
                   (list 5)

    test "allergic to lots of stuff" $
      Assert.equal [ "strawberries"
                   , "tomatoes"
                   , "chocolate"
                   , "pollen"
                   , "cats"
                   ]
                   (list 248)

    test "allergic to everything" $
      Assert.equal [ "eggs"
                   , "peanuts"
                   , "shellfish"
                   , "strawberries"
                   , "tomatoes"
                   , "chocolate"
                   , "pollen"
                   , "cats"
                   ]
                   (list 255)

    test "ignore non allergen score parts" $
      Assert.equal [ "eggs"
                   , "shellfish"
                   , "strawberries"
                   , "tomatoes"
                   , "chocolate"
                   , "pollen"
                   , "cats"
                   ]
                   (list 509)
