module Handsontable.Options.Renderer
  ( Renderer(..)
  , renderer
  ) where

import Prelude

import Handsontable.Options.Cell as Cell
import Data.Functor.Contravariant ((>$<))
import Data.Options (Option, opt)

data Renderer
  = Autocomplete
  | Checkbox
  | HTML
  | Numeric
  | Password
  | Text
  | Custom String

instance showRenderer ∷ Show Renderer where
  show = case _ of
    Autocomplete  → "autocomplete"
    Checkbox      → "checkbox"
    HTML          → "html"
    Numeric       → "numeric"
    Password      → "password"
    Text          → "text"
    Custom name   → name

renderer ∷ Option Cell.Option Renderer
renderer = show >$< opt "renderer"
