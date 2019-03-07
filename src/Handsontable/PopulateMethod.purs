module Handsontable.PopulateMethod
 ( PopulateMethod(..)
 ) where

import Prelude

data PopulateMethod
  = ShiftDown
  | ShiftRight
  | Overwrite

instance showPopulateMethod ∷ Show PopulateMethod where
  show = case _ of
    ShiftDown  → "shift_down"
    ShiftRight → "shift_right"
    Overwrite  → "overwrite"
