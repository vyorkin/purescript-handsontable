module Handsontable.Options.FillHandle where

import Prelude

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant ((>$<))
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)

data Direction = Horizontal | Vertical

instance showDirection ∷ Show Direction where
  show Horizontal = "horizontal"
  show Vertical   = "vertical"

data FillHandle
  = Set Boolean
  | Dir Direction

instance encodeFillHandle ∷ Encode FillHandle where
  encode (Set x) = unsafeToForeign x
  encode (Dir x) = unsafeToForeign $ show x

-- | Enables the fill handle (drag-down and copy-down) functionality,
-- | which shows a small rectangle in bottom right corner of
-- | the selected area, that let's you expand values to the adjacent cells.
-- |
-- | Default is `true`.
fillHandle ∷ Option TableOptions FillHandle
fillHandle = encode >$< (opt "fillHandle")
