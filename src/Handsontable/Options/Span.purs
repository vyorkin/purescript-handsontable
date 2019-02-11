module Handsontable.Options.Span
  ( CellSpan
  , mergeCells
  ) where

import Data.Options (Option, opt)
import Handsontable.Options (TableOptions)

type CellSpan =
  { row ∷ Int
  , col ∷ Int
  , rowspan ∷ Int
  , colspan ∷ Int
  }

-- | If set to `true`, it enables a possibility to merge cells.
-- | If set to an array of objects, it merges the cells provided in the objects.
mergeCells ∷ Option TableOptions (Array CellSpan)
mergeCells = opt "mergeCells"
