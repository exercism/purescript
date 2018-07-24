-- Test/exercise version: "1.0.0"

module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Data.Maybe (Maybe(..))
import Hamming (distance)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "hamming" do
    test "identical strands" $
      Assert.equal (Just 0) (distance "A" "A")
    test "long identical strands" $
      Assert.equal (Just 0) (distance "GGACTGA" "GGACTGA")
    test "complete distance in single nucleotide strands" $
      Assert.equal (Just 1) (distance "A" "G")
    test "complete distance in small strands" $
      Assert.equal (Just 2) (distance "AG" "CT")
    test "small distance in small strands" $
      Assert.equal (Just 1) (distance "AT" "CT")
    test "small distance" $
      Assert.equal (Just 1) (distance "GGACG" "GGTCG")
    test "small distance in long strands" $
      Assert.equal (Just 2) (distance "ACCAGGG" "ACTATGG")
    test "non-unique character in first strand" $
      Assert.equal (Just 1) (distance "AGA" "AGG")
    test "non-unique character in second strand" $
      Assert.equal (Just 1) (distance "AGG" "AGA")
    test "same nucleotides in different positions" $
      Assert.equal (Just 2) (distance "TAG" "GAT")
    test "large distance" $
      Assert.equal (Just 4) (distance "GATACA" "GCATAA")
    test "large distance in off-by-one strand" $
      Assert.equal (Just 9) (distance "GGACGGATTCTG" "AGGACGGATTCT")
    test "empty strands" $
      Assert.equal (Just 0) (distance "" "")
    test "disallow first strand longer" $
      Assert.equal Nothing (distance "AATG" "AAA")
    test "disallow second strand longer" $
      Assert.equal Nothing (distance "ATA" "AGTG")
