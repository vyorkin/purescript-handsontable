module Handsontable
  ( HandsontableOptions
  , MetaObject
  , handsontable
  , handsontableNode
  , clear
  , destroy
  , render
  , updateSettings
  , loadData
  , getSchema
  , getRowHeaders
  , getRowHeader
  , getColHeaders
  , getColHeader
  , setCellMeta
  , setCellMetaObject
  , setDataAtCell
  , setDataAtRowProp
  , getSourceDataSlice
  , getSourceData
  , getSourceDataArray
  , getSourceDataArraySlice
  , getSourceDataAtCell
  , getSourceDataAt
  , getValue
  , propToCol
  , colToProp
  , getCell
  , defaultOptions
  , module Handsontable.Types
  ) where

import Prelude

import Data.Either (Either)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Data.Options (Options, options, (:=))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn6, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6)
import Foreign (Foreign, MultipleErrors, unsafeToForeign)
import Foreign.Class (class Decode)
import Foreign.NullOrUndefined (undefined)
import Handsontable.AlterAction (AlterAction)
import Handsontable.AlterAction as AlterAction
import Handsontable.Options (TableOptions, allowInsertColumn, allowInsertRow, allowRemoveColumn, allowRemoveRow, minSpareCols, minSpareRows)
import Handsontable.Options.Common (SharedOptions)
import Handsontable.SourceIndicator (SourceIndicator)
import Handsontable.Types as CountSource
import Handsontable.Types (Handsontable, Coords, Dimension(..), CountSource)
import Handsontable.Utils (runDecode)
import Prelude.Unicode ((∘))
import Web.HTML (HTMLElement, HTMLTableCellElement)

type HandsontableOptions = Options TableOptions
type MetaObject = Options SharedOptions

foreign import _handsontable ∷ EffectFn2 String Foreign Handsontable

handsontable ∷ String → HandsontableOptions → Effect Handsontable
handsontable el opts = runEffectFn2 _handsontable el (options opts)

foreign import _handsontableNode ∷ EffectFn2 HTMLElement Foreign Handsontable

handsontableNode ∷ HTMLElement → HandsontableOptions → Effect Handsontable
handsontableNode el opts = runEffectFn2 _handsontableNode el (options opts)

foreign import _clear ∷ EffectFn1 Handsontable Unit

-- | Clears the data from the grid (the table settings remain intact).
clear ∷ Handsontable → Effect Unit
clear self = runEffectFn1 _clear self

foreign import _destroy ∷ EffectFn1 Handsontable Unit

-- | Removes grid from the DOM.
destroy ∷ Handsontable → Effect Unit
destroy self = runEffectFn1 _destroy self

foreign import _render ∷ EffectFn1 Handsontable Unit

render ∷ Handsontable → Effect Unit
render self = runEffectFn1 _render self

foreign import _updateSettings ∷ EffectFn2 Foreign Handsontable Unit

-- | Use it if you need to change configuration after initialization.
-- | It doesn't overwrite the previously declared settings,
-- | but it might reset the settings made post-initialization.
updateSettings ∷ HandsontableOptions → Handsontable → Effect Unit
updateSettings opts self = runEffectFn2 _updateSettings (options opts) self

foreign import _loadData ∷ ∀ a. EffectFn2 (Array a) Handsontable Unit

-- | Reset all cells in the grid to contain data from the data array.
loadData ∷ ∀ a. Array a → Handsontable → Effect Unit
loadData cells self = runEffectFn2 _loadData cells self

foreign import _getSchema ∷ ∀ a. EffectFn1 Handsontable a

-- | Returns schema provided by constructor settings.
getSchema ∷ ∀ a. Handsontable → Effect a
getSchema self = runEffectFn1 _getSchema self

foreign import _getRowHeader ∷ EffectFn2 Foreign Handsontable Foreign

-- | Get all row headers.
getRowHeaders ∷ Handsontable → Effect (Either MultipleErrors (Array String))
getRowHeaders self = runEffectFn2 _getRowHeader undefined self >>= runDecode >>> pure

-- | Get header for the given row index.
getRowHeader ∷ Int → Handsontable → Effect (Either MultipleErrors String)
getRowHeader row self = runEffectFn2 _getRowHeader (unsafeToForeign row) self >>= runDecode >>> pure

foreign import _getColHeader ∷ EffectFn2 Foreign Handsontable Foreign

-- | Get all column headers.
getColHeaders ∷ Handsontable → Effect (Either MultipleErrors (Array String))
getColHeaders self = runEffectFn2 _getColHeader undefined self >>= runDecode >>> pure

-- | Get header for the given column index.
getColHeader ∷ Int → Handsontable → Effect (Either MultipleErrors String)
getColHeader col self = runEffectFn2 _getColHeader (unsafeToForeign col) self >>= runDecode >>> pure

foreign import _setCellMeta ∷ EffectFn5 Int Int String String Handsontable Unit

setCellMeta ∷ ∀ a. Show a ⇒ Coords → a → a → Handsontable → Effect Unit
setCellMeta { row, col } key val self =
  runEffectFn5 _setCellMeta row col (show key) (show val) self

foreign import _setCellMetaObject ∷ EffectFn4 Int Int Foreign Handsontable Unit

-- | Set cell metadata.
setCellMetaObject ∷ Coords → MetaObject → Handsontable → Effect Unit
setCellMetaObject { row, col } meta self = runEffectFn4 _setCellMetaObject row col (options meta) self

foreign import _setDataAtCell ∷ EffectFn5 Int Int Foreign Foreign Handsontable Unit

-- | Set new value to a cell at the
-- | given row and column indexes (column should be visible).
setDataAtCell ∷ Coords → Foreign → Foreign → Handsontable → Effect Unit
setDataAtCell { col, row } val src self = runEffectFn5 _setDataAtCell row col val src self

setDataAtCell_ ∷ ∀ a. Coords → a → Handsontable → Effect Unit
setDataAtCell_ coords val self = setDataAtCell coords (unsafeToForeign val) (unsafeToForeign "") self

foreign import _setDataAtRowProp ∷ EffectFn5 Int String Foreign Foreign Handsontable Unit

-- | Set new value to a cell by at the given column index using the name of
-- | the object property (e.g. `first.name`).
setDataAtRowProp ∷ Int → String → Foreign → Foreign → Handsontable → Effect Unit
setDataAtRowProp row prop val src self = runEffectFn5 _setDataAtRowProp row prop val src self

foreign import _getSourceData
  ∷ EffectFn5 Foreign Foreign Foreign Foreign Handsontable Foreign

-- | Get a slice of the source data object
-- | (the same that was passed by data configuration option or loadData method).
getSourceDataSlice
  ∷ ∀ a
  . Decode a
  ⇒ Coords
  → Coords
  → Handsontable
  → Effect (Either MultipleErrors (Array a))
getSourceDataSlice from to self =
  runEffectFn5 _getSourceData (f from.row) (f from.col) (f to.row) (f to.col) self >>= runDecode >>> pure
  where f = unsafeToForeign

-- | Get the source data object
-- | (the same that was passed by data configuration option or loadData method).
getSourceData ∷ ∀ a. Decode a ⇒ Handsontable → Effect (Either MultipleErrors (Array a))
getSourceData self = runEffectFn5 _getSourceData u u u u self >>= runDecode >>> pure
  where u = undefined

foreign import _getSourceDataArray
  ∷ EffectFn5 Foreign Foreign Foreign Foreign Handsontable Foreign

-- | Get a slice of the source data object as an arrays of arrays format
-- | even when source data was provided in another format.
getSourceDataArraySlice
  ∷ ∀ a
  . Decode a
  ⇒ Coords
  → Coords
  → Handsontable
  → Effect (Either MultipleErrors (Array (Array a)))
getSourceDataArraySlice from to self =
  runEffectFn5 _getSourceDataArray (f from.row) (f from.col) (f to.row) (f to.col) self >>= runDecode >>> pure
  where f = unsafeToForeign

-- | Get the source data object as an arrays of arrays format
-- | even when source data was provided in another format.
getSourceDataArray
  ∷ ∀ a
 . Decode a
  ⇒ Handsontable
  → Effect (Either MultipleErrors (Array (Array a)))
getSourceDataArray self = runEffectFn5 _getSourceDataArray u u u u self >>= runDecode >>> pure
  where u = undefined

foreign import _getSourceDataAtCell ∷ EffectFn3 Int Int Handsontable Foreign

-- | Get a single value from the data source.
getSourceDataAtCell
  ∷ ∀ a
  . Decode a
  ⇒ Coords
  → Handsontable
  → Effect (Either MultipleErrors a)
getSourceDataAtCell { row, col } self =
  runEffectFn3 _getSourceDataAtCell row col self >>= runDecode >>> pure

foreign import _getSourceDataAtRow ∷ EffectFn2 Int Handsontable Foreign
foreign import _getSourceDataAtCol ∷ EffectFn2 Int Handsontable Foreign

-- | Get an array of values at the given dimension (row or col) and index.
getSourceDataAt
  ∷ ∀ a
  . Decode a
  ⇒ Dimension
  → Int
  → Handsontable
  → Effect (Either MultipleErrors (Array a))
getSourceDataAt dim idx self = runEffectFn2 impl idx self >>= pure ∘ runDecode
  where
    impl = case dim of
      Row → _getSourceDataAtRow
      Col → _getSourceDataAtCol

foreign import _getValue ∷ EffectFn1 Handsontable Foreign

-- | Get value at the selected cell.
getValue ∷ ∀ a. Decode a ⇒ Handsontable → Effect (Either MultipleErrors a)
getValue self = runEffectFn1 _getValue self >>= pure ∘ runDecode

foreign import _propToCol ∷ EffectFn2 Handsontable String Foreign

propToCol ∷ Handsontable → String → Effect (Either MultipleErrors Int)
propToCol t p = runEffectFn2 _propToCol t p >>= pure ∘ runDecode

foreign import _colToProp ∷ EffectFn2 Handsontable Int Foreign

colToProp ∷ Handsontable → Int → Effect (Either MultipleErrors String)
colToProp t i = runEffectFn2 _colToProp t i >>= pure ∘ runDecode

foreign import _getCell ∷ EffectFn3 Int Int Handsontable HTMLTableCellElement

-- | Returns an `HTMLTableCellElement` element for the
-- | given row and column arguments, if it is rendered on screen.
getCell ∷ Coords → Handsontable → Effect HTMLTableCellElement
getCell { row, col } self = runEffectFn3 _getCell row col self

foreign import _alter
  ∷ EffectFn6
    String
    Foreign
    (Nullable Int)
    (Nullable String)
    Boolean
    Handsontable Unit

-- | Allows altering the table structure by
-- | either inserting/removing rows or columns.
alter
  ∷ AlterAction
  → Foreign
  → Maybe Int
  → Maybe SourceIndicator
  → Boolean
  → Handsontable
  → Effect Unit
alter action index amount source keepEmpty self =
  runEffectFn6 _alter
    (show action)
    index
    (toNullable amount)
    (toNullable $ show <$> source)
    keepEmpty
    self

alter_ ∷ AlterAction → Int → Int → Handsontable → Effect Unit
alter_ action index amount =
  alter action (unsafeToForeign index) (Just amount) Nothing false

-- | Inserts at the given index the given amount of new rows.
insertRows ∷ Int → Int → Handsontable → Effect Unit
insertRows = alter_ AlterAction.InsertRow

-- | Inserts at the given index the given amount of new columns.
insertCols ∷ Int → Int → Handsontable → Effect Unit
insertCols = alter_ AlterAction.InsertCol

-- | Removes at the given index the given amount of rows.
removeRows ∷ Int → Int → Handsontable → Effect Unit
removeRows = alter_ AlterAction.RemoveRow

-- | Removes at the given index the given amount of cols.
removeCols ∷ Int → Int → Handsontable → Effect Unit
removeCols = alter_ AlterAction.RemoveCol

foreign import _colOffset ∷ EffectFn1 Handsontable Int
foreign import _rowOffset ∷ EffectFn1 Handsontable Int

-- | Returns the visual index of the first rendered row/column.
offset ∷ Dimension → Handsontable → Effect Int
offset dim self = runEffectFn1 impl self
  where
    impl = case dim of
      Row → _rowOffset
      Col → _colOffset

foreign import _countRows ∷ EffectFn1 Handsontable Int
foreign import _countCols ∷ EffectFn1 Handsontable Int

foreign import _countEmptyRows ∷ EffectFn2 Boolean Handsontable Int
foreign import _countEmptyCols ∷ EffectFn2 Boolean Handsontable Int

foreign import _countRenderedRows ∷ EffectFn1 Handsontable Int
foreign import _countRenderedCols ∷ EffectFn1 Handsontable Int

foreign import _countVisibleRows ∷ EffectFn1 Handsontable Int
foreign import _countVisibleCols ∷ EffectFn1 Handsontable Int

foreign import _countSourceRows ∷ EffectFn1 Handsontable Int
foreign import _countSourceCols ∷ EffectFn1 Handsontable Int

-- | Returns the total number of all/visible/empty rows/cols in the table.
count ∷ Dimension → CountSource → Handsontable → Effect Int
count dim source self = case dim, source of
  Row, CountSource.All       → runEffectFn1 _countRows self
  Row, CountSource.Empty end → runEffectFn2 _countEmptyRows end self
  Row, CountSource.Rendered  → runEffectFn1 _countRenderedRows self
  Row, CountSource.Visible   → runEffectFn1 _countVisibleRows self
  Row, CountSource.Source    → runEffectFn1 _countSourceRows self
  Col, CountSource.All       → runEffectFn1 _countCols self
  Col, CountSource.Empty end → runEffectFn2 _countEmptyCols end self
  Col, CountSource.Rendered  → runEffectFn1 _countRenderedCols self
  Col, CountSource.Visible   → runEffectFn1 _countVisibleCols self
  Col, CountSource.Source    → runEffectFn1 _countSourceCols self

defaultOptions ∷ HandsontableOptions
defaultOptions
   = allowInsertRow := false
  <> allowInsertColumn := false
  <> allowRemoveRow := false
  <> allowRemoveColumn := false
  <> minSpareRows := 3
  <> minSpareCols := 3
