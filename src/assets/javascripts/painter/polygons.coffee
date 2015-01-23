Delaunay = require '../delaunay'

module.exports = class Polygons
  constructor: ({@polyCanvas} = {}) ->
    @context  = @polyCanvas.context()
    @canvasEl = @polyCanvas.el()
  
  draw: (vertices) ->
    @clearCanvas()
    @triangles = Delaunay.triangulate(vertices)
    @context.lineWidth = 0.75

    i = 0
    l = @triangles.length

    while i < l
      @drawTriangle @triangles[i]
  
  drawTriangle: (triangle) ->
    @context.beginPath()
    @context.moveTo triangle.a.x, triangle.a.y
    @context.lineTo triangle.b.x, triangle.b.y
    @context.lineTo triangle.c.x, triangle.c.y
    @context.closePath()

    color = @polyCanvas.getColorAt(triangle.x, triangle.y)
    
    @context.fillStyle = color
    @context.fill()
    @context.strokeStyle = color
    @context.stroke()
    i++

  clearCanvas: ->
    @context.clearRect 0, 0, @canvasEl.width, @canvasEl.height


