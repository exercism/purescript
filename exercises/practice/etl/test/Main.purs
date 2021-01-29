module Test.Main where

import Prelude

import Effect (Effect)
import Data.Map (fromFoldable)
import Data.Tuple (Tuple(..))
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Etl (transform)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Etl.transform" do

    test "a single letter" $
      Assert.equal (fromFoldable
                     [Tuple 'a' 1]
                   )
                   (transform
                     (fromFoldable
                       [Tuple 1 ['A']]
                     )
                   )

    test "single score with multiple letters" $
      Assert.equal (fromFoldable
                     [ Tuple 'a' 1
                     , Tuple 'e' 1
                     , Tuple 'i' 1
                     , Tuple 'o' 1
                     , Tuple 'u' 1
                     ]
                   )
                   (transform
                     (fromFoldable
                       [Tuple 1 ['A','E','I','O','U']]
                     )
                   )

    test "multiple scores with multiple letters" $
      Assert.equal (fromFoldable
                     [ Tuple 'a' 1
                     , Tuple 'd' 2
                     , Tuple 'e' 1
                     , Tuple 'g' 2
                     ]
                   )
                   (transform
                     (fromFoldable
                       [ Tuple 1 ['A','E']
                       , Tuple 2 ['D','G']
                       ]
                     )
                   )

    test "multiple scores with differing numbers of letters" $
      Assert.equal (fromFoldable
                     [ Tuple 'a' 1
                     , Tuple 'b' 3
                     , Tuple 'c' 3
                     , Tuple 'd' 2
                     , Tuple 'e' 1
                     , Tuple 'f' 4
                     , Tuple 'g' 2
                     , Tuple 'h' 4
                     , Tuple 'i' 1
                     , Tuple 'j' 8
                     , Tuple 'k' 5
                     , Tuple 'l' 1
                     , Tuple 'm' 3
                     , Tuple 'n' 1
                     , Tuple 'o' 1
                     , Tuple 'p' 3
                     , Tuple 'q' 10
                     , Tuple 'r' 1
                     , Tuple 's' 1
                     , Tuple 't' 1
                     , Tuple 'u' 1
                     , Tuple 'v' 4
                     , Tuple 'w' 4
                     , Tuple 'x' 8
                     , Tuple 'y' 4
                     , Tuple 'z' 10
                     ]
                   )
                   (transform
                     (fromFoldable
                       [ Tuple 1 ['A','E','I','O','U','L','N','R','S','T']
                       , Tuple 10 ['Q','Z']
                       , Tuple 2 ['D','G']
                       , Tuple 3 ['B','C','M','P']
                       , Tuple 4 ['F','H','V','W','Y']
                       , Tuple 5 ['K']
                       , Tuple 8 ['J','X']
                       ]
                     )
                   )
