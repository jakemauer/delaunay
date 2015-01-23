$        = require 'jquery'
Painter  = require './painter'

$ ->
  image = document.getElementById("image")
  canvas = document.getElementById("canvas")

  new Painter({image: image, canvas: canvas})
