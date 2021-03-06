module.exports = class PolyCanvas
  constructor: ({@image, @canvas} = {}) ->
    @setupDimensions()
    @setupInitialImage()
    @imageData = @grabImageData()
  
  context: ->
    @canvas.getContext('2d')

  grabImageData: ->
    @context().getImageData(0, 0, @canvas.width, @canvas.height).data

  getColorAt: (x,y) ->
    return "rgba(0,0,0,0)"  if x < 0 or y < 0
    return "rgba(0,0,0,0)"  if x > @canvas.width or y > @canvas.height

    data = @imageData
    index = ((x | 0) + (y | 0) * @canvas.width) * 4
    "rgba(" + data[index] + "," + data[index + 1] + "," + data[index + 2] + "," + data[index + 3] + ")"
  
  el: ->
    @canvas

  setupDimensions: ->
    @canvas.width          = @image.width
    @canvas.height         = @image.height

  setupInitialImage: ->
    @context().drawImage @image, 0, 0