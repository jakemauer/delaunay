$      = require 'jquery'
Marker = require './marker'

module.exports = class Markers
  constructor: ->
    @$markers = $('#markers')

  draw: (vertices) ->
    vertices.forEach (vertex, i) =>
      @$markers.append Marker.create({vertex: vertex, i: i})