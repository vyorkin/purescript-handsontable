module Handsontable.Options.SelectionMode where

import Prelude

import Handsontable.Options (TableOptions)
import Data.Functor.Contravariant ((>$<))
import Data.Options (Option, opt)

data SelectionMode
  = Single
  | Range
  | Multiple

instance showSelectionMode ∷ Show SelectionMode where
  show = case _ of
    Single   → "single"
    Range    → "range"
    Multiple → "multiple"

selectionMode ∷ Option TableOptions SelectionMode
selectionMode = show >$< opt "selectionMode"
