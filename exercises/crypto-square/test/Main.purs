module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import CryptoSquare ( normalizedPlaintext
                    , plaintextSegments
                    , encoded
                    , ciphertext
                    )

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "CryptoSquare.normalizedPlaintext" do

    test "Lowercase" $
      Assert.equal "hello"
                   (normalizedPlaintext "Hello")

    test "Remove spaces" $
      Assert.equal "hithere"
                   (normalizedPlaintext "Hi there")

    test "Remove punctuation" $
      Assert.equal "123go"
                   (normalizedPlaintext "@1, 2%, 3 Go!")

  suite "CryptoSquare.plaintextSegments" do

    test "empty plaintext results in an empty rectangle" $
      Assert.equal
        []
        (plaintextSegments "")

    test "4 character plaintext results in an 2x2 rectangle" $
      Assert.equal
        [ "ab"
        , "cd"
        ]
        (plaintextSegments "Ab Cd")

    test "9 character plaintext results in an 3x3 rectangle" $
      Assert.equal
        [ "thi"
        , "sis"
        , "fun"
        ]
        (plaintextSegments "This is fun!")

    test "54 character plaintext results in an 8x7 rectangle" $
      Assert.equal
        [ "ifmanwas"
        , "meanttos"
        , "tayonthe"
        , "groundgo"
        , "dwouldha"
        , "vegivenu"
        , "sroots"
        ]
        (plaintextSegments "If man was meant to stay on the ground, god would have given us roots.")

  suite "CryptoSquare.encoded" do

    test "empty plaintext results in an empty encode" $
      Assert.equal
        ""
        (encoded "")

    test "Non-empty plaintext results in the combined plaintext segments" $
      Assert.equal
        "imtgdvsfearwermayoogoanouuiontnnlvtwttddesaohghnsseoau"
        (encoded "If man was meant to stay on the ground, god would have given us roots.")

  suite "CryptoSquare.ciphertext" do

    test "empty plaintext results in an empty ciphertext" $
      Assert.equal
        ""
        (ciphertext "")

    test "9 character plaintext results in 3 chunks of 3 characters" $
      Assert.equal
        "tsf hiu isn"
        (ciphertext "This is fun!")

    test "54 character plaintext results in 7 chunks, the last two padded with spaces" $
      Assert.equal
        "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
        (ciphertext "If man was meant to stay on the ground, god would have given us roots.")
