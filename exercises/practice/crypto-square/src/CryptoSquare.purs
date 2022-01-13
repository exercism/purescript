module CryptoSquare
  ( normalizedPlaintext
  , plaintextSegments
  , encoded
  , ciphertext
  ) where

import Effect.Exception.Unsafe (unsafeThrow)

normalizedPlaintext :: String -> String
normalizedPlaintext = unsafeThrow "You need to implement this function."

plaintextSegments :: String -> Array String
plaintextSegments = unsafeThrow "You need to implement this function."

encoded :: String -> String
encoded = unsafeThrow "You need to implement this function."

ciphertext :: String -> String
ciphertext = unsafeThrow "You need to implement this function."
