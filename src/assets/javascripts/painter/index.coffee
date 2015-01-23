Canvas   = require './canvas'
Markers  = require './markers'

module.exports = class Painter
  constructor: ({@image, @canvas} = {}) ->
    @vertices = [ {x: 50, y:50} ]
    @canvas   = new Canvas({@image, @canvas})
    @markers  = new Markers
    
    @setupListeners()

    @draw()
  
  draw: ->
    @drawMarkers()
    @drawTriangles()

  drawMarkers: ->
    @markers.draw(@vertices)

  drawTriangles: ->
    @

  setupListeners: ->
    @image