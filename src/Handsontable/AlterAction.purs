module Handsontable.AlterAction
  ( AlterAction(..)
  ) where

import Prelude

data AlterAction
  = InsertRow
  | InsertCol
  | RemoveRow
  | RemoveCol

instance showAlterAction ∷ Show AlterAction where
  show = case _ of
    InsertRow → "insert_row"
    InsertCol → "insert_col"
    RemoveRow → "remove_row"
    RemoveCol → "remove_col"
