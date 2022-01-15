module Triangle
  ( Triangle(Equilateral, Isosceles, Scalene)
  , triangleKind
  ) where

import Prelude
import Data.Either (Either)
import Effect.Exception.Unsafe (unsafeThrow)

data Triangle
  = Equilateral
  | Isosceles
  | Scalene

derive instance eqTriangle :: Eq Triangle

instance showTriangle :: Show Triangle where
  show = unsafeThrow "You need to implement `show`."

triangleKind :: Int -> Int -> Int -> Either String Triangle
triangleKind = unsafeThrow "You need to implement `triangleKind`."
