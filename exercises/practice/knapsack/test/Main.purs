module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Knapsack as Knapsack

main :: Effect Unit
main = runTest suites


suites :: TestSuite
suites = do
  suite "Knapsack.maximumValue" do
    test "no items" do
      Assert.equal 0 $ Knapsack.maximumValue [] 100
    test "one item, too heavy" do
      Assert.equal 0 $ Knapsack.maximumValue [{weight: 100, value: 1}] 0
    test "five items (cannot be greedy by weight)" do
      Assert.equal 21 $ Knapsack.maximumValue [{weight: 2, value: 5}
                                              ,{weight: 2, value: 5}
                                              ,{weight: 2, value: 5}
                                              ,{weight: 2, value: 5}
                                              ,{weight: 10, value: 21}
                                              ]
                                              10
    test "five items (cannot be greedy by value)" do
      Assert.equal 80 $ Knapsack.maximumValue [{weight: 2, value: 20}
                                              ,{weight: 2, value: 20}
                                              ,{weight: 2, value: 20}
                                              ,{weight: 2, value: 20}
                                              ,{weight: 10, value: 50}
                                              ]
                                              10
    test "example knapsack" do
      Assert.equal 90 $ Knapsack.maximumValue [{weight: 5, value: 10}
                                                ,{weight: 4, value: 40}
                                                ,{weight: 6, value: 30}
                                                ,{weight: 4, value: 50}
                                              ]
                                              10
    test "8 items" do
      Assert.equal 900 $ Knapsack.maximumValue [{weight: 25, value: 350}
                                               ,{weight: 35, value: 400}
                                               ,{weight: 45, value: 450}
                                               ,{weight: 5, value: 20}
                                               ,{weight: 25, value: 70}
                                               ,{weight: 3, value: 8}
                                               ,{weight: 2, value: 5}
                                               ,{weight: 2, value: 5}
                                               ]
                                               104
    test "15 items" do
      Assert.equal 1458 $ Knapsack.maximumValue [{weight: 70, value: 135}
                                                ,{weight: 73, value: 139}
                                                ,{weight: 77, value: 149}
                                                ,{weight: 80, value: 150}
                                                ,{weight: 82, value: 156}
                                                ,{weight: 87, value: 163}
                                                ,{weight: 90, value: 173}
                                                ,{weight: 94, value: 184}
                                                ,{weight: 98, value: 192}
                                                ,{weight: 106, value: 201}
                                                ,{weight: 110, value: 210}
                                                ,{weight: 113, value: 214}
                                                ,{weight: 115, value: 221}
                                                ,{weight: 118, value: 229}
                                                ,{weight: 120, value: 240}
                                                ]
                                                750
