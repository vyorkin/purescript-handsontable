module Handsontable.Options.FragmentSelection where

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)

data FragmentSelection
  = Set Boolean
  | Cell

instance encodeFragmentSelection ∷ Encode FragmentSelection where
  encode (Set x) = unsafeToForeign x
  encode Cell    = unsafeToForeign "cell"

-- | If set to `FragmentSelectionSet true`,
-- | it enables the browser's native selection of a fragment of
-- | the text within a single cell, between adjacent cells or in a whole table.
-- |
-- | If set to `FragmentSelectionCell`,
-- | it enables the possibility of selecting a
-- | fragment of the text within a single cell's body.
-- |
-- | Default is `FragmentSelectionSet false`.
fragmentSelection ∷ Option TableOptions FragmentSelection
fragmentSelection = cmap encode (opt "fragmentSelection")
