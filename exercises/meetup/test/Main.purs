module Test.Main where

import Prelude

import Test.Unit.Assert as Assert
import Effect (Effect)
import Data.Date (Weekday(..), canonicalDate)
import Data.Enum (toEnum)
import Data.Maybe (Maybe(..))
import Meetup (Week(..), meetup)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Meetup.meetup" do

    test "monteenth of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Teenth <@> Monday)

    test "monteenth of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Teenth <@> Monday)

    test "monteenth of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Teenth <@> Monday)

    test "tuesteenth of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Teenth <@> Tuesday)

    test "tuesteenth of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Teenth <@> Tuesday)

    test "tuesteenth of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Teenth <@> Tuesday)

    test "wednesteenth of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> Teenth <@> Wednesday)

    test "wednesteenth of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Teenth <@> Wednesday)

    test "wednesteenth of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Teenth <@> Wednesday)

    test "thursteenth of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Teenth <@> Thursday)

    test "thursteenth of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Teenth <@> Thursday)

    test "thursteenth of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Teenth <@> Thursday)

    test "friteenth of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Teenth <@> Friday)

    test "friteenth of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Teenth <@> Friday)

    test "friteenth of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Teenth <@> Friday)

    test "saturteenth of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Teenth <@> Saturday)

    test "saturteenth of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Teenth <@> Saturday)

    test "saturteenth of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Teenth <@> Saturday)

    test "sunteenth of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Teenth <@> Sunday)

    test "sunteenth of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Teenth <@> Sunday)

    test "sunteenth of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Teenth <@> Sunday)

    test "first Monday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 4)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> First <@> Monday)

    test "first Monday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 1)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> First <@> Monday)

    test "first Tuesday of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 7)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> First <@> Tuesday)

    test "first Tuesday of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 4)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> First <@> Tuesday)

    test "first Wednesday of July 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 7 <*> toEnum 3)
                   (meetup <$> toEnum 2013 <*> toEnum 7 <@> First <@> Wednesday)

    test "first Wednesday of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 7)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> First <@> Wednesday)

    test "first Thursday of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 5)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> First <@> Thursday)

    test "first Thursday of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 3)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> First <@> Thursday)

    test "first Friday of November 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 11 <*> toEnum 1)
                   (meetup <$> toEnum 2013 <*> toEnum 11 <@> First <@> Friday)

    test "first Friday of December 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 12 <*> toEnum 6)
                   (meetup <$> toEnum 2013 <*> toEnum 12 <@> First <@> Friday)

    test "first Saturday of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 5)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> First <@> Saturday)

    test "first Saturday of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 2)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> First <@> Saturday)

    test "first Sunday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 3)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> First <@> Sunday)

    test "first Sunday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 7)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> First <@> Sunday)

    test "second Monday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 11)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Second <@> Monday)

    test "second Monday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 8)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Second <@> Monday)

    test "second Tuesday of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 14)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Second <@> Tuesday)

    test "second Tuesday of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 11)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Second <@> Tuesday)

    test "second Wednesday of July 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 7 <*> toEnum 10)
                   (meetup <$> toEnum 2013 <*> toEnum 7 <@> Second <@> Wednesday)

    test "second Wednesday of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 14)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Second <@> Wednesday)

    test "second Thursday of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 12)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Second <@> Thursday)

    test "second Thursday of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 10)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Second <@> Thursday)

    test "second Friday of November 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 11 <*> toEnum 8)
                   (meetup <$> toEnum 2013 <*> toEnum 11 <@> Second <@> Friday)

    test "second Friday of December 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 12 <*> toEnum 13)
                   (meetup <$> toEnum 2013 <*> toEnum 12 <@> Second <@> Friday)

    test "second Saturday of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 12)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> Second <@> Saturday)

    test "second Saturday of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 9)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Second <@> Saturday)

    test "second Sunday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 10)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Second <@> Sunday)

    test "second Sunday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 14)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Second <@> Sunday)

    test "third Monday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 18)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Third <@> Monday)

    test "third Monday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 15)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Third <@> Monday)

    test "third Tuesday of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 21)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Third <@> Tuesday)

    test "third Tuesday of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 18)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Third <@> Tuesday)

    test "third Wednesday of July 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 7 <*> toEnum 17)
                   (meetup <$> toEnum 2013 <*> toEnum 7 <@> Third <@> Wednesday)

    test "third Wednesday of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 21)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Third <@> Wednesday)

    test "third Thursday of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Third <@> Thursday)

    test "third Thursday of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 17)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Third <@> Thursday)

    test "third Friday of November 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 11 <*> toEnum 15)
                   (meetup <$> toEnum 2013 <*> toEnum 11 <@> Third <@> Friday)

    test "third Friday of December 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 12 <*> toEnum 20)
                   (meetup <$> toEnum 2013 <*> toEnum 12 <@> Third <@> Friday)

    test "third Saturday of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 19)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> Third <@> Saturday)

    test "third Saturday of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 16)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Third <@> Saturday)

    test "third Sunday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 17)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Third <@> Sunday)

    test "third Sunday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 21)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Third <@> Sunday)

    test "fourth Monday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 25)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Fourth <@> Monday)

    test "fourth Monday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 22)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Fourth <@> Monday)

    test "fourth Tuesday of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Fourth <@> Tuesday)

    test "fourth Tuesday of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 25)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Fourth <@> Tuesday)

    test "fourth Wednesday of July 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 7 <*> toEnum 24)
                   (meetup <$> toEnum 2013 <*> toEnum 7 <@> Fourth <@> Wednesday)

    test "fourth Wednesday of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Fourth <@> Wednesday)

    test "fourth Thursday of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 26)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Fourth <@> Thursday)

    test "fourth Thursday of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 24)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Fourth <@> Thursday)

    test "fourth Friday of November 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 11 <*> toEnum 22)
                   (meetup <$> toEnum 2013 <*> toEnum 11 <@> Fourth <@> Friday)

    test "fourth Friday of December 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 12 <*> toEnum 27)
                   (meetup <$> toEnum 2013 <*> toEnum 12 <@> Fourth <@> Friday)

    test "fourth Saturday of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 26)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> Fourth <@> Saturday)

    test "fourth Saturday of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 23)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Fourth <@> Saturday)

    test "fourth Sunday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 24)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Fourth <@> Sunday)

    test "fourth Sunday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Fourth <@> Sunday)

    test "last Monday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 25)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Last <@> Monday)

    test "last Monday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 29)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Last <@> Monday)

    test "last Tuesday of May 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 5 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 5 <@> Last <@> Tuesday)

    test "last Tuesday of June 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 6 <*> toEnum 25)
                   (meetup <$> toEnum 2013 <*> toEnum 6 <@> Last <@> Tuesday)

    test "last Wednesday of July 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 7 <*> toEnum 31)
                   (meetup <$> toEnum 2013 <*> toEnum 7 <@> Last <@> Wednesday)

    test "last Wednesday of August 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 8 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 8 <@> Last <@> Wednesday)

    test "last Thursday of September 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 9 <*> toEnum 26)
                   (meetup <$> toEnum 2013 <*> toEnum 9 <@> Last <@> Thursday)

    test "last Thursday of October 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 10 <*> toEnum 31)
                   (meetup <$> toEnum 2013 <*> toEnum 10 <@> Last <@> Thursday)

    test "last Friday of November 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 11 <*> toEnum 29)
                   (meetup <$> toEnum 2013 <*> toEnum 11 <@> Last <@> Friday)

    test "last Friday of December 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 12 <*> toEnum 27)
                   (meetup <$> toEnum 2013 <*> toEnum 12 <@> Last <@> Friday)

    test "last Saturday of January 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 1 <*> toEnum 26)
                   (meetup <$> toEnum 2013 <*> toEnum 1 <@> Last <@> Saturday)

    test "last Saturday of February 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 2 <*> toEnum 23)
                   (meetup <$> toEnum 2013 <*> toEnum 2 <@> Last <@> Saturday)

    test "last Sunday of March 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 3 <*> toEnum 31)
                   (meetup <$> toEnum 2013 <*> toEnum 3 <@> Last <@> Sunday)

    test "last Sunday of April 2013" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2013 <*> toEnum 4 <*> toEnum 28)
                   (meetup <$> toEnum 2013 <*> toEnum 4 <@> Last <@> Sunday)

    test "last Wednesday of February 2012" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2012 <*> toEnum 2 <*> toEnum 29)
                   (meetup <$> toEnum 2012 <*> toEnum 2 <@> Last <@> Wednesday)

    test "last Wednesday of December 2014" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2014 <*> toEnum 12 <*> toEnum 31)
                   (meetup <$> toEnum 2014 <*> toEnum 12 <@> Last <@> Wednesday)

    test "last Sunday of February 2015" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2015 <*> toEnum 2 <*> toEnum 22)
                   (meetup <$> toEnum 2015 <*> toEnum 2 <@> Last <@> Sunday)

    test "first Friday of December 2012" $
      Assert.equal (Just $ canonicalDate <$> toEnum 2012 <*> toEnum 12 <*> toEnum 7)
                   (meetup <$> toEnum 2012 <*> toEnum 12 <@> First <@> Friday)
