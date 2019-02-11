module Handsontable.Options where

import Data.Options (Option, opt)
import Handsontable.Options.Cell as Cell
import Handsontable.Options.Class (class IsSharedOption, class IsTableOption)
import Handsontable.Options.Column (ColumnOptions)

foreign import data TableOptions ∷ Type
instance tableSharedOptions ∷ IsSharedOption TableOptions
instance tableOptions ∷ IsTableOption TableOptions

-- | If set to `false`, there won't be an option to
-- | insert new columns in the Context Menu.
-- |
-- | Default is `true`.
allowInsertColumn ∷ Option TableOptions Boolean
allowInsertColumn = opt "allowInsertColumn"

-- | If set to `false`, there won't be an option to
-- | insert new rows in the Context Menu.
-- |
-- | Default is `true`.
allowInsertRow ∷ Option TableOptions Boolean
allowInsertRow = opt "allowInsertRow"

-- | If set to `false`, there won't be an option to
-- | remove columns in the Context Menu.
-- |
-- | Default is `true`.
allowRemoveColumn ∷ Option TableOptions Boolean
allowRemoveColumn = opt "allowRemoveColumn"

-- | If set to `false`, there won't be an option to
-- | remove rows in the Context Menu.
-- |
-- | Default is `true`.
allowRemoveRow ∷ Option TableOptions Boolean
allowRemoveRow = opt "allowRemoveRow"

-- | Enables or disables the autoColumnSize plugin.
-- |
-- | Default is `true`.
autoColumnSize ∷ Option TableOptions Boolean
autoColumnSize = opt "autoColumnSize"

-- | Enables or disables the autoRowSize plugin.
-- |
-- | Default is `true`.
autoRowSize ∷ Option TableOptions Boolean
autoRowSize = opt "autoRowSize"

-- | If true, pressing ENTER or down arrow in
-- | the last row will move to the first row in the next column.
-- |
-- | Default is `false`.
autoWrapCol ∷ Option TableOptions Boolean
autoWrapCol = opt "autoWrapCol"

-- | If true, pressing TAB or right arrow in
-- | the last column will move to first column in next row.
-- |
-- | Default is `false`.
autoWrapRow ∷ Option TableOptions Boolean
autoWrapRow = opt "autoWrapRow"

-- | Plugin allowing binding the table rows with their headers.
-- | If the plugin is enabled, the table row headers will
-- | "stick" to the rows, when they are hidden/moved.
-- |
-- | This is a "Pro" version feature.
-- | Default is `false`.
-- bindRowsWithHeaders ∷ Option TableOptions Boolean
-- bindRowsWithHeaders = opt "bindRowsWithHeaders"

-- | Initial data source that will be bound to the data grid.
tableData ∷ ∀ a. Option TableOptions (Array a)
tableData = opt "data"

-- | Defines the structure of a new row when
-- | data source is an array of objects.
dataSchema ∷ ∀ a. Option TableOptions a
dataSchema = opt "dataSchema"

-- | Width of the grid.
width ∷ Option TableOptions Int
width = opt "width"

-- | Height of the grid.
height ∷ Option TableOptions Int
height = opt "height"

-- | Prevents table to overlap outside the parent element.
-- | Default is `false`.
preventOverflow ∷ Option TableOptions String
preventOverflow = opt "preventOverflow"

-- | Allows setting a custom height of the column headers.
columnHeaderHeight ∷ Option TableOptions Int
columnHeaderHeight = opt "columnHeaderHeight"

-- | Initial number of rows.
-- | Only makes sense for empty tables
-- | (if `tableData` is not set).
-- |
-- | Default is `5`.
startRows ∷ Option TableOptions Int
startRows = opt "startRows"

-- | Initial number of columns.
-- | Only makes sense for empty tables
-- | (if `tableData` is not set).
-- |
-- | Default is `5`.
startCols ∷ Option TableOptions Int
startCols = opt "startCols"

-- | Minimum number of rows.
-- | At least that number of rows will be created during initialization.
minRows ∷ Option TableOptions Int
minRows = opt "minRows"

-- | Minimum number of cols.
-- | At least that number of cols will be created during initialization.
minCols ∷ Option TableOptions Int
minCols = opt "minCols"

-- | Maximum number of rows.
maxRows ∷ Option TableOptions Int
maxRows = opt "maxRows"

-- | Maximum number of cols.
maxCols ∷ Option TableOptions Int
maxCols = opt "maxCols"

-- | When set to 1 (or more), Handsontable will add
-- | a new row at the end of grid if there are no more empty rows.
-- | (unless the number of rows exceeds the one set in the maxRows property)
-- |
-- | Default is `0`.
minSpareRows ∷ Option TableOptions Int
minSpareRows = opt "minSpareRows"

-- | When set to 1 (or more), Handsontable will add
-- | a new column at the end of grid if there are no more empty columns.
-- | (unless the number of rows exceeds the one set in the maxCols property)
-- |
-- | Default is `0`.
minSpareCols ∷ Option TableOptions Int
minSpareCols = opt "minSpareCols"

-- | Any constructor or column option may be
-- | overwritten for a particular cell (row/column combination),
-- | using overrideCells.
-- |
-- | Default is `[]`.
overrideCells ∷ Option TableOptions (Array Cell.Options)
overrideCells = opt "cell"

-- | `CellPropName` - for column's data source object, when dataset is an array of objects.
-- | `CellPropIndex` - same number as col, when dataset is an array of arrays.
data CellProp
  = CellPropName String
  | CellPropIndex Int

-- | Take row and column indexes and a `CellProp`,
-- | Returns the cell options.
type CellFn = Int → Int → CellProp → Cell.Options

-- | Defines the cell options for
-- | given row, col coordinates and `CellProp`.
cells ∷ Option TableOptions CellFn
cells = opt "cells"

-- | Defines the cell properties and data binding for certain columns.
-- | Using this option sets a fixed number of columns
-- | (options startCols, minCols, maxCols will be ignored).
columns ∷ Option TableOptions (Array ColumnOptions)
columns = opt "columns"

-- | If `true` then allows sorting.
-- |
-- | Default is `false`.
columnSorting ∷ Option TableOptions Boolean
columnSorting = opt "columnSorting"

-- | Defines column widths in pixels.
colWidths ∷ Option TableOptions Int
colWidths = opt "colWidths"

-- | CSS class name added to the commented cells.
commentedCellClassName ∷ Option TableOptions String
commentedCellClassName = opt "commentedCellClassNam"

-- | If true, enables the Comments plugin,
-- | which enables an option to apply cell comments
-- | through the context menu.
-- |
-- | Default is `false`.
comments ∷ Option TableOptions Boolean
comments = opt "comments"

-- | Defines if the right-click context menu should be enabled.
-- |
-- | Default is `false`.
contextMenu ∷ Option TableOptions Boolean
contextMenu = opt "contextMenu"

-- | Make cell copyable
-- |
-- | Default is `true`.
copyable ∷ Option TableOptions Boolean
copyable = opt "copyable"

-- | Disable or enable the copy/paste functionality.
-- |
-- | Default is `true`.
copyPaste ∷ Option TableOptions Boolean
copyPaste = opt "copyPaste"

-- | Class name for all visible columns in the current selection.
currentColClassName ∷ Option TableOptions String
currentColClassName = opt "currentColClassName"

-- | Class name for all visible headers in current selection.
currentHeaderClassName ∷ Option TableOptions String
currentHeaderClassName = opt "currentHeaderClassName"

-- | Class name for all visible rows in the current selection.
currentRowClassName ∷ Option TableOptions String
currentRowClassName = opt "currentRowClassName"

-- | Data template for 'checkbox' type
-- | when checkbox is checked.
checkedTemplate ∷ Option TableOptions String
checkedTemplate = opt "checkedTemplate"

-- | Data template for 'checkbox' type
-- | when checkbox is unchecked.
uncheckedTemplate ∷ Option TableOptions String
uncheckedTemplate = opt "uncheckedTemplate"

-- | Setting to `true` enables the debug mode.
-- |
-- | Default is `false`.
debug ∷ Option TableOptions Boolean
debug = opt "debug"

-- | Disable or enable the drag to scroll functionality.
-- |
-- | Default is `true`.
dragToScroll ∷ Option TableOptions Boolean
dragToScroll = opt "dragToScroll"

-- | If `true`, `ENTER` begins editing mode (like in Google Docs).
-- | If `false`, `ENTER` moves to next row (like Excel) and adds a new row if necessary.
-- | `TAB` adds new column if necessary.
-- |
-- | Default is `true`.
enterBeginsEditing ∷ Option TableOptions Boolean
enterBeginsEditing = opt "enterBeginsEditing"

type TableVector =
  { row ∷ Int
  , col ∷ Int
  }

-- | Defines the cursor movement after ENTER was pressed
-- | (SHIFT + ENTER uses a negative vector).
-- |
-- | Default is `TableVector { row: 1, col: 0 }`.
enterMoves ∷ Option TableOptions TableVector
enterMoves = opt "enterMoves"

-- | If defined as `true`, when the user types into
-- | the input area the Autocomplete's suggestion list is updated to
-- | only include those choices starting with what has been typed.
-- | If defined as `false` all suggestions remain shown,
-- | with those matching what has been typed marked in bold.
-- |
-- | Default is `true`.
filter ∷ Option TableOptions Boolean
filter = opt "filter"

-- | If `true`, filtering in the Autocomplete Editor
-- | will be case-sensitive.
-- |
-- | Default is `true`.
filterCaseSensitive ∷ Option TableOptions Boolean
filterCaseSensitive = opt "filterCaseSensitive"

-- | Allows to specify the number of fixed (or frozen) columns
-- | on the left of the table.
-- |
-- | Default is `0`.
fixedColumnsLeft ∷ Option TableOptions Int
fixedColumnsLeft = opt "fixedColumnsLeft"

-- | Allows to specify the number of fixed (or frozen) rows
-- | on the top of the table.
-- |
-- | Default is `0`.
fixedRowsTop ∷ Option TableOptions Int
fixedRowsTop = opt "fixedRowsTop"

-- | CSS class name for cells that did not pass validation.
invalidCellClassName ∷ Option TableOptions String
invalidCellClassName = opt "invalidCellClassName"

-- | Language for Handsontable translation.
-- |
-- | Default is `en-US`.
language ∷ Option TableOptions String
language = opt "language"

-- | Enabling this plugin switches table into one-way data binding
-- | where changes are applied into data source (from outside table)
-- | will be automatically reflected in the table.
-- |
-- | Default is `false`.
observeChanges ∷ Option TableOptions Boolean
observeChanges = opt "observeChanges"

-- | If `true` then virtual rendering mechanism
-- | for handsontable will be disabled.
-- |
-- | Default is `false`.
renderAllRows ∷ Option TableOptions Boolean
renderAllRows = opt "renderAllRows"

-- | Setting to `true` enables the search plugin.
-- |
-- | Default is `false`.
search ∷ Option TableOptions Boolean
search = opt "search"

-- | Set whether to display the current sorting order indicator.
-- |
-- | Default is `false`.
sortIndicator ∷ Option TableOptions Boolean
sortIndicator = opt "sortIndicator"
