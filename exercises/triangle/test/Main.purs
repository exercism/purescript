module Test.Main where

import Prelude
import Test.Unit.Assert as Assert
import Control.Monad.Eff (Eff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Either (Either(Left, Right))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Triangle (triangleKind, Triangle(Equilateral, Isosceles, Scalene))

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
  suite "Triangle.triangleKind" do
    test "equilateral triangles have equal sides" do
      Assert.equal
        (Right Equilateral) $
        triangleKind 2 2 2
    test "larger equilateral triangles also have equal sides" do
      Assert.equal
        (Right Equilateral)
        $ triangleKind 10 10 10
    test "isosceles triangles have last two sides equal" do
      Assert.equal
        (Right Isosceles)
        $ triangleKind 3 4 4
    test "isosceles triangles have first and last sides equal" do
      Assert.equal
        (Right Isosceles)
        $ triangleKind 4 3 4
    test "isosceles triangles have two first sides equal" do
      Assert.equal
        (Right Isosceles)
        $ triangleKind 4 4 3
    test "isosceles triangles have in fact exactly two sides equal" do
      Assert.equal
        (Right Isosceles)
        $ triangleKind 10 10 2
    test "scalene triangles have no equal sides" do
      Assert.equal
        (Right Scalene)
        $ triangleKind 3 4 5
    test "scalene triangles have no equal sides at a larger scale too" do
      Assert.equal
        (Right Scalene)
        $ triangleKind 10 11 12
    test "scalene triangles have no equal sides at a larger scale too 2" do
      Assert.equal
        (Right Scalene)
        $ triangleKind 5 4 2
    test "triangles with no size are illegal" do
      Assert.equal
        (Left "Invalid lengths")
        $ triangleKind 0 0 0
    test "triangles with negative sides are illegal" do
      Assert.equal
        (Left "Invalid lengths")
        $ triangleKind 3 4 (-5)
    test "triangles violating triangle inequality are illegal 1" do
      Assert.equal
        (Left "Violates inequality")
        $ triangleKind 1 1 3
    test "triangles violating triangle inequality are illegal 2" do
      Assert.equal
        (Left "Violates inequality")
        $ triangleKind 7 3 2
