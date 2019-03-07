module Handsontable.SourceIndicator
  ( SourceIndicator(..)
  ) where

import Prelude

data SourceIndicator
  = Alter
  | Empty
  | Edit
  | PopulateFromArray
  | LoadData
  | Autofill
  | Paste
  | SpliceCol
  | SpliceRow

instance showSourceIndicator ∷ Show SourceIndicator where
  show = case _ of
    Alter             → "alter"
    Empty             → "empty"
    Edit              → "edit"
    PopulateFromArray → "populateFromArray"
    LoadData          → "loadData"
    Autofill          → "autofill"
    Paste             → "paste"
    SpliceCol         → "spliceCol"
    SpliceRow         → "spliceRow"
