module Triangle
  ( Triangle(Equilateral, Isosceles, Scalene)
  , triangleKind
  ) where

import Prelude
import Data.Set as Set
import Data.Either (Either(Left, Right))


data Triangle
  = Equilateral
  | Isosceles
  | Scalene

derive instance eqTriangle :: Eq Triangle

instance showTriangle :: Show Triangle where
  show Equilateral = "Equilateral"
  show Isosceles = "Isosceles"
  show Scalene = "Scalene"

type ErrorMsg = String


triangleKind :: Int -> Int -> Int -> Either ErrorMsg Triangle
triangleKind x y z
  | x <= 0 || y <= 0 || z <= 0 =
      Left "Invalid lengths"

  | x + y <= z || x + z <= y || y + z <= x =
      Left "Violates inequality"

  | otherwise =
      case Set.size $ Set.fromFoldable [x, y, z] of
        1 -> Right Equilateral
        2 -> Right Isosceles
        _ -> Right Scalene
