module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, describe, it)
import Test.Unit.Assert (shouldEqual)
import Test.Unit.Main (runTest)

import Booleans (canExecuteFastAttack, canSpy, canSignalPrisoner, canFreePrisoner)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  describe "Can fast attack" do
    it "Knight is awake" do
       canExecuteFastAttack true `shouldEqual` false
    it "Knight is asleep" do
       canExecuteFastAttack false `shouldEqual` true

  describe "Can spy" do
    it "Knight is asleep, archer is asleep, prisoner is awake" do
       canSpy false false true `shouldEqual` true
    it "Knight is asleep, archer is awake, prisoner is asleep" do
       canSpy false true false `shouldEqual` true
    it "Knight is awake, archer is asleep, prisoner is asleep" do
       canSpy true false false `shouldEqual` true
    it "Knight is awake, archer is asleep, prisoner is awake" do
       canSpy true false true `shouldEqual` true
    it "Knight is awake, archer is awake, prisoner is asleep" do
       canSpy true true false `shouldEqual` true
    it "Knight is awake, archer is awake, prisoner is awake" do
       canSpy true true true `shouldEqual` true
    it "Knight is asleep, archer is asleep, prisoner is asleep" do
       canSpy false false false `shouldEqual` false

  describe "Can signal prisoner" do
    it "Archer is asleep, prisoner is asleep" do
      canSignalPrisoner false false `shouldEqual` false
    it "Archer is asleep, prisoner is awake" do
      canSignalPrisoner false true `shouldEqual` true
    it "Archer is awake, prisoner is asleep" do
      canSignalPrisoner true false `shouldEqual` false
    it "Archer is awake, prisoner is awake" do
      canSignalPrisoner true true `shouldEqual` false

  describe "Can free prisoner" do
    it "Knight is asleep, archer is asleep, prisoner is asleep, pet dog is not present" do
      canFreePrisoner false false false false `shouldEqual` false
    it "Knight is asleep, archer is asleep, prisoner is asleep, pet dog is present" do
      canFreePrisoner false false false true `shouldEqual` true
    it "Knight is asleep, archer is asleep, prisoner is awake, pet dog is not present" do
      canFreePrisoner false false true false `shouldEqual` true
    it "Knight is asleep, archer is asleep, prisoner is awake, pet dog is present" do
      canFreePrisoner false false true true `shouldEqual` true
    it "Knight is asleep, archer is awake, prisoner is asleep, pet dog is not present" do
      canFreePrisoner false true false false `shouldEqual` false
    it "Knight is asleep, archer is awake, prisoner is asleep, pet dog is present" do
      canFreePrisoner false true false true `shouldEqual` false
    it "Knight is asleep, archer is awake, prisoner is awake, pet dog is not present" do
      canFreePrisoner false true true false `shouldEqual` false
    it "Knight is asleep, archer is awake, prisoner is awake, pet dog is present" do
      canFreePrisoner false true true true `shouldEqual` false
    it "Knight is awake, archer is asleep, prisoner is asleep, pet dog is not present" do
      canFreePrisoner true false false false `shouldEqual` false
    it "Knight is awake, archer is asleep, prisoner is asleep, pet dog is present" do
      canFreePrisoner true false false true `shouldEqual` true
    it "Knight is awake, archer is asleep, prisoner is awake, pet dog is not present" do
      canFreePrisoner true false true false `shouldEqual` false
    it "Knight is awake, archer is asleep, prisoner is awake, pet dog is present" do
      canFreePrisoner true false true true `shouldEqual` true
    it "Knight is awake, archer is awake, prisoner is asleep, pet dog is not present" do
      canFreePrisoner true true false false `shouldEqual` false
    it "Knight is awake, archer is awake, prisoner is asleep, pet dog is present" do
      canFreePrisoner true true false true `shouldEqual` false
    it "Knight is awake, archer is awake, prisoner is awake, pet dog is not present" do
      canFreePrisoner true true true false `shouldEqual` false
    it "Knight is awake, archer is awake, prisoner is awake, pet dog is present" do
      canFreePrisoner true true true true `shouldEqual` false
