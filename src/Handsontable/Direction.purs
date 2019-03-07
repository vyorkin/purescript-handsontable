module Handsontable.Direction
  ( Direction(..)
  ) where

import Prelude

data Direction
  = Left
  | Right
  | Up
  | Down

instance showDirection ∷ Show Direction where
  show = case _ of
    Left  → "left"
    Right → "right"
    Up    → "up"
    Down  → "down"
