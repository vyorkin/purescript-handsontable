module Handsontable.Options.Class where
-- | There are a lot of intersecting options
-- | so we need a way to distinguish them.

class IsSharedOption a

-- | The `IsTableOption` type class represents those types of
-- | options which can be set for the whole table.
class (IsSharedOption a) <= IsTableOption a

-- | The `IsColumnOption` type class represents those types of
-- | options which can be set for a column.
class (IsSharedOption a) <= IsColumnOption a

-- | The `IsCellOption` type class represents those types of
-- | options which can be set for a cell.
class (IsSharedOption a) <= IsCellOption a
