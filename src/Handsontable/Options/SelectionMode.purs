module Handsontable.Options.SelectionMode where

import Prelude

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)

data SelectionMode
  = Single
  | Range
  | Multiple

instance showSelectionMode ∷ Show SelectionMode where
  show Single   = "single"
  show Range    = "range"
  show Multiple = "multiple"

selectionMode ∷ Option TableOptions SelectionMode
selectionMode = cmap show (opt "selectionMode")
