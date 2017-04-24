window.initMap = ->
  myOptions =
    zoom: 9
    center: new google.maps.LatLng 42.05, -70.25
    mapTypeId: google.maps.MapTypeId.SATELLITE
    scrollwheel: false
    scaleControl: false
  map = new google.maps.Map $('#map')[0], myOptions
  polygons = []
  $.ajax
    async: true
    url: '/species_filter'
    type: 'get'
    data:
      species: $("#species_select").val()
    success: (response) ->
	    for i in [0..response.length-1] by 1
		    console.log("coordinate " + i + ": "  + response[i].coordinate_file.length)
		    polygons.push new google.maps.Polygon
		      paths: response[i].coordinate_file
		      strokeColor: '#F7F8FF'
		      strokeOpacity: 0.8
		      strokeWeight: .35
		      fillColor: response[i].color
		      fillOpacity: 0.45
		      editable: false
		      map: map
		      loc: response[i].location
		      rep: response[i].reports
		      moving_average: response[i].moving_average
	    polygons[polygons.length - 1].setMap(map)
