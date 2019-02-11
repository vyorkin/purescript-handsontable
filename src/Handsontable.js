const Handsontable = require("handsontable");

function effeize(method) {
  return function() {
    const self = arguments[arguments.length - 1];
    const args = Array.prototype.slice.call(arguments, 0, -1);
    return function() {
      return self[method].apply(self, args);
    }
  }
}

exports._handsontable = function(id, options) {
  var el = document.getElementById(id);
  return new Handsontable(el, options);
};

exports._handsontableNode = function(node, options) {
  return new Handsontable(node, options);
};

exports._clear = effeize('clear');
exports._destroy = effeize('destroy');
exports._render = effeize('render');
exports._updateSettings = effeize('updateSettings');
exports._getSchema = effeize('getSchema');
exports._getRowHeader = effeize('getRowHeader');
exports._getColHeader = effeize('getColHeader');
exports._setCellMeta = effeize('setCellMeta');
exports._setCellMetaObject = effeize('setCellMetaObject');
exports._setDataAtCell = effeize('setDataAtCell');
exports._setDataAtRowProp = effeize('setDataAtRowProp');
exports._getSourceData = effeize('getSourceData');
exports._getSourceDataArray = effeize('getSourceDataArray');
exports._getSourceDataAtCell = effeize('getSourceDataAtCell');
exports._getSourceDataAtCol = effeize('getSourceDataAtCol');
exports._getSourceDataAtRow = effeize('getSourceDataAtRow');
exports._getValue = effeize('getValue');
exports._propToCol = effeize('propToCol');
exports._colToProp = effeize('colToProp');
exports._getCell = effeize('getCell');
exports._loadData = effeize('loadData');
