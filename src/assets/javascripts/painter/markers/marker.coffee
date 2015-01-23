module.exports = class Marker
  @create: ({@vertex, @size, @i} = {}) ->
    @size ?= 10

    marker = document.createElement("div")
    
    marker.className    = "marker"
    marker.id           = @i
    marker.style.width  = @size + "px"
    marker.style.height = @size + "px"
    marker.style.top    = @vertex.y + "px"
    marker.style.left   = @vertex.x + "px"
    
    return marker