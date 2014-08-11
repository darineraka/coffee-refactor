# { Range } = require 'atom'
Range = require '../vender/text-buffer/src/range'

module.exports =
class LocationDataUtil

  @locationDataToRange: ({ first_line, first_column, last_line, last_column }) ->
    last_line ?= first_line
    last_column ?= first_column
    new Range [ first_line, first_column ], [ last_line, last_column + 1 ]

  @rangeToLocationData: ({ start, end }) ->
    first_line  : start.row
    first_column: start.column
    last_line   : end.row
    last_column : end.column - 1

  @isEqualsLocationData: (a, b) ->
    a.first_line   is b.first_line   and
    a.first_column is b.first_column and
    a.last_line    is b.last_line    and
    a.last_column  is b.last_column

  # @pointToLineColumn: ({ row, column }) ->
  #   { line: row, column }

  @isContains: ({ first_line, first_column, last_line, last_column }, { row, column }) ->
    last_column++
    if first_line == row == last_line
      first_column <= column <= last_column
    else if first_line == row < last_line
      first_column <= column
    else if first_line < row == last_line
      column <= last_column
    else if first_line < row < last_line
      true
    else
      false
