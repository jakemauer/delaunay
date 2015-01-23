Delaunay = require '../delaunay'

module.exports = class Shapes
  constructor: ({@shapeCanvas} = {}) ->
    @context  = @shapeCanvas.context()
    @canvasEl = @shapeCanvas.el()
  
  draw: (vertices) ->
    @clearCanvas()
    @triangles = Delaunay.triangulate(vertices)
    @context.lineWidth = 0.75

    i = 0
    l = @triangles.length

    while i < l
      triangle = @triangles[i]
      @context.beginPath()
      @context.moveTo triangle.a.x, triangle.a.y
      @context.lineTo triangle.b.x, triangle.b.y
      @context.lineTo triangle.c.x, triangle.c.y
      @context.closePath()

      color = @shapeCanvas.getColorAt(triangle.x, triangle.y)
      
      @context.fillStyle = color
      @context.fill()
      @context.strokeStyle = color
      @context.stroke()
      i++

  clearCanvas: ->
    @context.clearRect 0, 0, @canvasEl.width, @canvasEl.height


