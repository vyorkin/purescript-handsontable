const Handsontable = require("handsontable")

function effeize(method) {
  return function() {
    const self = arguments[arguments.length - 1]
    const args = Array.prototype.slice.call(arguments, 0, -1)
    return function() {
      return self[method].apply(self, args)
    }
  }
}

exports._handsontable = function(id, options) {
  var el = document.getElementById(id)
  return new Handsontable(el, options)
}

exports._handsontableNode = function(node, options) {
  return new Handsontable(node, options)
}

exports._clear = effeize('clear')
exports._destroy = effeize('destroy')
exports._render = effeize('render')
exports._updateSettings = effeize('updateSettings')
exports._getSchema = effeize('getSchema')

exports._getRowHeader = effeize('getRowHeader')
exports._getColHeader = effeize('getColHeader')

exports._setCellMeta = effeize('setCellMeta')
exports._setCellMetaObject = effeize('setCellMetaObject')

exports._setDataAtCell = effeize('setDataAtCell')
exports._setDataAtRowProp = effeize('setDataAtRowProp')

exports._getSourceData = effeize('getSourceData')
exports._getSourceDataArray = effeize('getSourceDataArray')
exports._getSourceDataAtCell = effeize('getSourceDataAtCell')
exports._getSourceDataAtCol = effeize('getSourceDataAtCol')
exports._getSourceDataAtRow = effeize('getSourceDataAtRow')

exports._getValue = effeize('getValue')

exports._propToCol = effeize('propToCol')
exports._colToProp = effeize('colToProp')

exports._getCell = effeize('getCell')
exports._loadData = effeize('loadData')

exports._alter = effeize('alter')

exports._colOffset = effeize('colOffset')
exports._rowOffset = effeize('rowOffset')

exports._countCols = effeize('countCols')
exports._countRows = effeize('countRows')
exports._countEmptyCols = effeize('countEmptyCols')
exports._countEmptyRows = effeize('countEmptyRows')
exports._countRenderedCols = effeize('countRenderedCols')
exports._countRenderedRows = effeize('countRenderedRows')
exports._countVisibleCols = effeize('countVisibleCols')
exports._countVisibleRows = effeize('countVisibleRows')
exports._countSourceCols = effeize('countSourceCols')
exports._countSourceRows = effeize('countSourceRows')

// exports._getPlugin = effeize('getPlugin')

// exports._spliceCol = effeize('spliceCol')
// exports._spliceRow = effeize('spliceRow')

// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
// exports._ = effeize('')
