$             = require 'jquery'
ShapeCanvas   = require './shape-canvas'
Shapes        = require './shapes'
Markers       = require './markers'
MARKER_SIZE   = 10

module.exports = class Painter
  constructor: ({@image, @canvas} = {}) ->
    @vertices    = [ {x: 200, y:60}, {x: 250, y:60}, {x: 225, y:100} ]
    @shapeCanvas = new ShapeCanvas({@image, @canvas})
    @markers     = new Markers
    @shapes      = new Shapes({@shapeCanvas})
    
    @setupListeners()
    @draw()
  

  addVertex: (e) ->
    vertex =
      x: e.pageX - e.target.parentElement.offsetLeft - MARKER_SIZE / 2
      y: e.pageY - e.target.parentElement.offsetTop - MARKER_SIZE / 2
    @vertices.push vertex

    @draw()

  draw: ->
    @drawMarkers()
    @drawShapes()

  drawMarkers: ->
    @markers.draw(@vertices)

  drawShapes: ->
    @shapes.draw(@vertices)

  setupListeners: ->
    @image.addEventListener "mousedown", (e) => @addVertex(e)
