module HelloWorld where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))

helloWorld :: Maybe String -> String
helloWorld Nothing = "Hello, World!"
helloWorld (Just x) = "Hello, " <> x <> "!"
