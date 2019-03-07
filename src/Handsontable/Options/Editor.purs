module Handsontable.Options.Editor
  ( Editor(..)
  , editor
  ) where

import Prelude

import Handsontable.Options.Common (SharedOption)
import Data.Functor.Contravariant ((>$<))
import Data.Options (opt)

data Editor
  = Autocomplete
  | Checkbox
  | Date
  | Dropdown
  | Handsontable
  | Mobile
  | Password
  | Select
  | Text
  | Disable
  | Custom String

instance showEditor ∷ Show Editor where
  show = case _ of
    Autocomplete  → "autocomplete"
    Checkbox      → "checkbox"
    Date          → "date"
    Dropdown      → "dropdown"
    Handsontable  → "hansontable"
    Mobile        → "mobile"
    Password      → "password"
    Select        → "select"
    Text          → "text"
    Disable       → show false
    Custom name   → name

-- | Defines the editor for the table/column/cell.
-- |
-- | Default is `EditorText`.
editor ∷ SharedOption Editor
editor = show >$< opt "editor"
