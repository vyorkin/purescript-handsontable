module Handsontable.Options.Hidden where

import Prelude

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Foreign (unsafeToForeign)
import Foreign.Class (class Encode, encode)
import Handsontable.Options (TableOptions)
import Prelude.Unicode ((◇))

data Dimension = Rows | Columns

instance showDimension ∷ Show Dimension where
  show Rows = "Rows"
  show Columns = "Columns"

type Params =
  { indicators ∷ Boolean
  , rows ∷ Array Int
  }

data Hidden
  = Set Boolean
  | Visibility Params

instance encodeHidden ∷ Encode Hidden where
  encode (Set x) = unsafeToForeign x
  encode (Visibility x) = unsafeToForeign x

-- | The HiddenRows plugin allows hiding of certain rows.
-- | You can pass additional configuration with an object notation.
hidden ∷ Dimension → Option TableOptions Hidden
hidden dim = cmap encode (opt $ "hidden" ◇ show dim)

visibility ∷ Params → Hidden
visibility = Visibility
