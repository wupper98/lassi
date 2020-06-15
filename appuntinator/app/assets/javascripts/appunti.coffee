# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Create the script tag, set the appropriate attributes

mymap = L.map('map')

window.addEventListener 'load', ->

  studyplace = String( document.getElementById('userdata').getAttribute 'data-user-studyplace' );
  studyplace =  studyplace.split(" ").join "%20"; #sostituisco gli spazi con %20 che è il carattere spazio per le query

  # Mi prendo le coordinate dello studyplace
  urlGetCoordinates = "https://api.mapbox.com/geocoding/v5/mapbox.places/" + studyplace + ".json?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw";

  # richiesta ajax per avere le coordinate dal nome del luogo di studio
  $.ajax
    dataType: 'json'
    url: urlGetCoordinates
    success: (response) ->
      lon = parseFloat(response['features']['0']['center']['0'])
      lat = parseFloat(response['features']['0']['center']['1'])
      
      mymap.setView([String(lat), String(lon)], 13);

      L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'
      }).addTo(mymap);

      # bounding box per definire il range in cui trovare le copiesterie vicine
      dim = 0.03
      bbox = String(lon - dim) + "," + String(lat - dim) + "," + String(lon + dim) + "," + String(lat + dim)
      # url per cercare le copisterie nella bounding box
      urlGetCopisterie = "https://api.mapbox.com/geocoding/v5/mapbox.places/office%20supplies.json?bbox=" + bbox + "&access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw"

      #richiesta ajax per avere le copisterie vicine alle coordinate del luogo di studio
      $.ajax
        dataType: 'json'
        url: urlGetCopisterie
        success: (response1) ->
          console.log(response1)
          i = 0
          while i < response1['features'].length
            lon1 = parseFloat(response1['features'][String(i)]['center']['0'])
            lat1 = parseFloat(response1['features'][String(i)]['center']['1'])
            L.marker([lat1, lon1]).addTo(mymap);
            i++
          return
        error: (err1) ->
          console.log "AJAX Error: #{err}"
      return
    error: (err) ->
      console.log "AJAX Error: #{err}"

