module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Diamond (rows)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Diamond.rows" do

    test "Degenerate case with a single 'A' row" $
      Assert.equal   [ "A"
                     ]
                   (rows 'A')

    test "Degenerate case with no row containing 3 distinct groups of spaces" $
      Assert.equal   [ " A "
                     , "B B"
                     , " A "
                     ]
                   (rows 'B')

    test "Smallest non-degenerate case with odd diamond side length" $
      Assert.equal   [ "  A  "
                     , " B B "
                     , "C   C"
                     , " B B "
                     , "  A  "
                     ]
                   (rows 'C')

    test "Smallest non-degenerate case with even diamond side length" $
      Assert.equal   [ "   A   "
                     , "  B B  "
                     , " C   C "
                     , "D     D"
                     , " C   C "
                     , "  B B  "
                     , "   A   "
                     ]
                   (rows 'D')

    test "Largest possible diamond" $
      Assert.equal   [ "                         A                         "
                     , "                        B B                        "
                     , "                       C   C                       "
                     , "                      D     D                      "
                     , "                     E       E                     "
                     , "                    F         F                    "
                     , "                   G           G                   "
                     , "                  H             H                  "
                     , "                 I               I                 "
                     , "                J                 J                "
                     , "               K                   K               "
                     , "              L                     L              "
                     , "             M                       M             "
                     , "            N                         N            "
                     , "           O                           O           "
                     , "          P                             P          "
                     , "         Q                               Q         "
                     , "        R                                 R        "
                     , "       S                                   S       "
                     , "      T                                     T      "
                     , "     U                                       U     "
                     , "    V                                         V    "
                     , "   W                                           W   "
                     , "  X                                             X  "
                     , " Y                                               Y "
                     , "Z                                                 Z"
                     , " Y                                               Y "
                     , "  X                                             X  "
                     , "   W                                           W   "
                     , "    V                                         V    "
                     , "     U                                       U     "
                     , "      T                                     T      "
                     , "       S                                   S       "
                     , "        R                                 R        "
                     , "         Q                               Q         "
                     , "          P                             P          "
                     , "           O                           O           "
                     , "            N                         N            "
                     , "             M                       M             "
                     , "              L                     L              "
                     , "               K                   K               "
                     , "                J                 J                "
                     , "                 I               I                 "
                     , "                  H             H                  "
                     , "                   G           G                   "
                     , "                    F         F                    "
                     , "                     E       E                     "
                     , "                      D     D                      "
                     , "                       C   C                       "
                     , "                        B B                        "
                     , "                         A                         "
                     ]
                   (rows 'Z')
