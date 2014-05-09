{ View } = require 'atom'
MarkerView = require './MarkerView'

module.exports =
class ReferenceView extends View

  @content: ->
    @div class: 'reference'

  constructor: (@editorView, @refactoring) ->
    super()
    @isEnabled = false

  setEnabled: (@isEnabled) ->

  highlight: (ranges) =>
    return unless @isEnabled
    @empty()
    @highlightAt ranges

  highlightAt: (ranges) ->
    for range in ranges
      @append new MarkerView @editorView, @refactoring, range