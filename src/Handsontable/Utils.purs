module Handsontable.Utils (runDecode) where

import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Foreign (Foreign, MultipleErrors)
import Foreign.Class (class Decode, decode)
import Prelude.Unicode ((∘))

-- -- | A simple helper for decoding `Foreign` values.
runDecode ∷ ∀ a. Decode a ⇒ Foreign → Either MultipleErrors a
runDecode = runExcept ∘ decode
