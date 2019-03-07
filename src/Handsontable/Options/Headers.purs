module Handsontable.Options.Headers where

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant ((>$<))
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)

-- | `HeadersDefault` enables the default column headers `(A, B, C)`.
-- | `HeadersSet` allows to define an array of header names.
data Headers
  = Default
  | Set (Array String)

instance encodeHeaders ∷ Encode Headers where
  encode = case _ of
    Default → unsafeToForeign true
    Set xs  → unsafeToForeign xs

rowHeaders ∷ Option TableOptions Headers
rowHeaders = encode >$< opt "rowHeaders"

colHeaders ∷ Option TableOptions Headers
colHeaders = encode >$< opt "colHeaders"
