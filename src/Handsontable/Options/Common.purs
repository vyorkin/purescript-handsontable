module Handsontable.Options.Common where

import Handsontable.Options.Class (class IsSharedOption)
import Data.Options (Option, opt)

type SharedOption a = ∀ b. IsSharedOption b ⇒ Option b a

foreign import data SharedOptions ∷ Type
instance sharedOptions ∷ IsSharedOption SharedOptions

-- | If `true` makes cell, column or
-- | the whole table read-only.
-- |
-- | Default is `false`.
readOnly ∷ SharedOption Boolean
readOnly = opt "readOnly"

-- | `true` - accept values that are empty (`null`, `undefined` or '').
-- | `false` - reject empty values and mark cell as invalid.
-- |
-- | Default is `true`.
allowEmpty ∷ SharedOption Boolean
allowEmpty = opt "allowEmpty"

-- | If `true`, data defined in source of
-- | the autocomplete or dropdown cell will be treated as HTML.
-- |
-- | Default is `false`.
allowHTML ∷ SharedOption Boolean
allowHTML = opt "allowHTML"

-- | `true` - accept values that were marked as
-- | invalid by the cell validator.
-- |
-- | `false` - reject invalid values and
-- | dont't allow the user to close the editor.
-- |
-- | Default is `true`.
allowInvalid ∷ SharedOption Boolean
allowInvalid = opt "allowInvalid"

-- | Class name of an element.
className ∷ SharedOption Boolean
className = opt "className"

-- | If true then dates will be automatically formatted
-- | to match the desired format.
-- |
-- | Default is `false`.
correctFormat ∷ SharedOption String
correctFormat = opt "correctFormat"

-- | Date validation format.
-- |
-- | Default is `"DD/MM/YYYY"`.
dateFormat ∷ SharedOption String
dateFormat = opt "dateFormat"

-- | Definition of default value
-- | which will fill the empty cells.
-- |
-- | Option desired for 'date'-typed cells.
defaultDate ∷ SharedOption String
defaultDate = opt "defaultDate"

strict ∷ SharedOption Boolean
strict = opt "strict"
