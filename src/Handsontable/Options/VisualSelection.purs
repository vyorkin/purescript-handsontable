module Handsontable.Options.VisualSelection where

import Prelude

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)
import Prelude.Unicode ((∘))

data VisualSelection
  = Set Boolean
  | DisableCurrent
  | DisableArea
  | DisableHeader

instance showVisualSelection ∷ Show VisualSelection where
  show (Set x)        = show x
  show DisableCurrent = "current"
  show DisableArea    = "aread"
  show DisableHeader  = "header"

instance encodeVisualSelection ∷ Encode VisualSelection where
  encode (Set x) = unsafeToForeign x
  encode x       = unsafeToForeign ∘ show $ x

-- | Disables visual cells selection.
-- |
-- | Default is `VisualSelectionSet false`.
visualSelection ∷ Option TableOptions VisualSelection
visualSelection = cmap encode (opt "disableVisualSelection")
