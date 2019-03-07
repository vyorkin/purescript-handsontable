module Handsontable.Options.VisualSelection where

import Prelude

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant ((>$<))
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)

data VisualSelection
  = Set Boolean
  | DisableCurrent
  | DisableArea
  | DisableHeader

instance showVisualSelection ∷ Show VisualSelection where
  show = case _ of
    Set x          → show x
    DisableCurrent → "current"
    DisableArea    → "aread"
    DisableHeader  → "header"

instance encodeVisualSelection ∷ Encode VisualSelection where
  encode = case _ of
    Set x → unsafeToForeign x
    x     → unsafeToForeign $ show x

-- | Disables visual cells selection.
-- |
-- | Default is `VisualSelectionSet false`.
visualSelection ∷ Option TableOptions VisualSelection
visualSelection = encode >$< opt "disableVisualSelection"
