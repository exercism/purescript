module CryptoSquare
  ( normalizedPlaintext
  , plaintextSegments
  , encoded
  , ciphertext
  ) where

import Effect.Exception.Unsafe (unsafeThrow)

normalizedPlaintext :: String -> String
normalizedPlaintext = unsafeThrow "You need to implement `normalizedPlaintext`."

plaintextSegments :: String -> Array String
plaintextSegments = unsafeThrow "You need to implement `plaintextSegments`."

encoded :: String -> String
encoded = unsafeThrow "You need to implement `encoded`."

ciphertext :: String -> String
ciphertext = unsafeThrow "You need to implement `ciphertext`."
