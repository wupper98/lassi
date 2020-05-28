# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
->
mymap = L.map('map').setView([51.505, -0.09], 13)
googleLayer = new L.Google("ROADMAP")
mymap.addLayer(googleLayer)