module Test.Main where

import Prelude
import Test.Unit.Assert as Assert
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..))
import PascalsTriangle (rows)
import Test.Unit (suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

main :: Eff ( console :: CONSOLE
            , testOutput :: TESTOUTPUT
            , avar :: AVAR            
            )
        Unit
main = runTest do
  suite "Given a count, return a collection of that many rows of pascal's triangle" do
      
      test "zero rows" $
        Assert.equal
          (Just
            []
          )
          (rows (Just 0))
      
      test "single row" $
        Assert.equal
          (Just
            [[1]]
          )
          (rows (Just 1))
      
      test "two rows" $
        Assert.equal
          (Just
            [ [1]
            , [1,1]
            ]
          )
          (rows (Just 2))
      
      test "three rows" $
        Assert.equal
          (Just
            [ [1]
            , [1,1]
            , [1,2,1]
            ]
          )
          (rows (Just 3))
      
      test "four rows" $
        Assert.equal
          (Just
            [ [1]
            , [1,1]
            , [1,2,1]
            , [1,3,3,1]
            ]
          )
          (rows (Just 4))
      
      test "negative rows" $
        Assert.equal
          Nothing
          (rows (Just (-1)))
      
      test "null/no rows" $
        Assert.equal
          Nothing
          (rows Nothing)
