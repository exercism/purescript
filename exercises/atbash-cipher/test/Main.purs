module Test.Main where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import AtbashCipher (decode, encode)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "AtbashCipher.encode" do

    test "encode yes" $
      Assert.equal (Just "bvh")
                   (encode "yes")

    test "encode no" $
      Assert.equal (Just "ml")
                   (encode "no")

    test "encode OMG" $
      Assert.equal (Just "lnt")
                   (encode "OMG")

    test "encode spaces" $
      Assert.equal (Just "lnt")
                   (encode "O M G")

    test "encode mindblowingly" $
      Assert.equal (Just "nrmwy oldrm tob")
                   (encode "mindblowingly")

    test "encode numbers" $
      Assert.equal (Just "gvhgr mt123 gvhgr mt")
                   (encode "Testing,1 2 3, testing.")

    test "encode deep thought" $
      Assert.equal (Just "gifgs rhurx grlm")
                   (encode "Truth is fiction.")

    test "encode all the letters" $
      Assert.equal (Just "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
                   (encode "The quick brown fox jumps over the lazy dog.")

  suite "AtbashCipher.decode" do

    test "decode exercism" $
      Assert.equal (Just "exercism")
                   (decode "vcvix rhn")

    test "decode a sentence" $
      Assert.equal (Just "anobstacleisoftenasteppingstone")
                   (decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v")

    test "decode numbers" $
      Assert.equal (Just "testing123testing")
                   (decode "gvhgr mt123 gvhgr mt")

    test "decode all the letters" $
      Assert.equal (Just "thequickbrownfoxjumpsoverthelazydog")
                   (decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
