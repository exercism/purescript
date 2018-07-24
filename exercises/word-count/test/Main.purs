module Test.Main where

import Prelude

import Test.Unit.Assert as Assert
import Effect (Effect)
import Data.Map (fromFoldable)
import Data.Tuple (Tuple(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import WordCount (wordCount)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "WordCount.wordCount" do

    test "count one word" $
      Assert.equal (fromFoldable [Tuple "word" 1])
                   (wordCount "word")

    test "count one of each word" $
      Assert.equal (fromFoldable [ Tuple "one" 1
                                 , Tuple "of" 1
                                 , Tuple "each" 1
                                 ])
                   (wordCount "one of each")

    test "multiple occurrences of a word" $
      Assert.equal (fromFoldable [ Tuple "one" 1
                                 , Tuple "fish" 4
                                 , Tuple "two" 1
                                 , Tuple "red" 1
                                 , Tuple "blue" 1
                                 ])
                   (wordCount "one fish two fish red fish blue fish")

    test "handles cramped lists" $
      Assert.equal (fromFoldable [ Tuple "one" 1
                                 , Tuple "two" 1
                                 , Tuple "three" 1
                                 ])
                   (wordCount "one,two,three")

    test "handles expanded lists" $
      Assert.equal (fromFoldable [ Tuple "one" 1
                                 , Tuple "two" 1
                                 , Tuple "three" 1
                                 ])
                   (wordCount "one,\ntwo,\nthree")

    test "ignore punctuation" $
      Assert.equal (fromFoldable [ Tuple "car" 1
                                 , Tuple "carpet" 1
                                 , Tuple "as" 1
                                 , Tuple "java" 1
                                 , Tuple "javascript" 1
                                 ])
                   (wordCount "car: carpet as java: javascript!!&@$%^&")

    test "include numbers" $
      Assert.equal (fromFoldable [ Tuple "testing" 2
                                 , Tuple "1" 1
                                 , Tuple "2" 1
                                 ])
                   (wordCount "testing, 1, 2 testing")

    test "normalize case" $
      Assert.equal (fromFoldable [ Tuple "go" 3
                                 , Tuple "stop" 2
                                 ])
                   (wordCount "go Go GO Stop stop")

    test "with apostrophes" $
      Assert.equal (fromFoldable [ Tuple "first" 1
                                 , Tuple "don't" 2
                                 , Tuple "laugh" 1
                                 , Tuple "then" 1
                                 , Tuple "cry" 1
                                 ])
                   (wordCount "First: don't laugh. Then: don't cry.")

    test "with quotations" $
      Assert.equal (fromFoldable [ Tuple "joe" 1
                                 , Tuple "can't" 1
                                 , Tuple "tell" 1
                                 , Tuple "between" 1
                                 , Tuple "large" 2
                                 , Tuple "and" 1
                                 ])
                   (wordCount "Joe can't tell between 'large' and large.")
