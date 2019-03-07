module Handsontable.Types
  ( Handsontable
  , Coords
  , Dimension(..)
  , CountSource(..)
  ) where

-- | Represents row and column
-- | coordinates of the table cell.
type Coords =
  { row ∷ Int
  , col ∷ Int
  }

-- | Dimension of the table (rows or columns).
data Dimension = Row | Col

-- | Represents a count source.
-- |
-- | `All`      - all visual rows/cols in the table.
-- | `Empty`    - empty rows/cols (if the parameter is `true`, will only count empty rows at the end of the data source).
-- | `Rendered` - rendered rows/cols (including rows/cols partially or fully rendered outside viewport).
-- | `Visible`  - visible rows/cols (rendered rows/cols that fully fit inside viewport).
-- | `Source`   - number of rows/cols in the data source.
data CountSource
  = All
  | Empty Boolean
  | Rendered
  | Visible
  | Source

foreign import data Handsontable ∷ Type
