$ -> 
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
        state: $("#state_select").val()
      success: (response) ->
        for i in [0..response.length-1] by 1
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
          p = polygons[i]
          google.maps.event.addListener(p, 'mouseover',(event) ->
            $("#locdetails").css("display","block")
            $("#locdetails").append("<div class='hoverrow'> <div class='hoverclass'>Location</div> <div class='hoverclass'>Average Catch Per Trip</div> <div class='hoverclass'>Reports posted past 7 days</div> </div> <br> <div class='hoverrow'><div class='hoverclass'>" + this.loc.short_name + "</div>" + "<div class='hoverclass'>" + this.mavg + "</div>" + "<div class='hoverclass'>" + this.rep.length + "</div></div>")
            map.data.revertStyle()
            this.setOptions
            strokeColor: "#F7F8FF"
            strokeWeight: 3
            fillOpacity: 0.75
            )
          google.maps.event.addListener(p, 'mouseout', (event) ->
            $("#locdetails").css("display","none")
            $("#locdetails").empty()
            map.data.revertStyle()
            this.setOptions
            strokeColor: "F7F8FF"
            strokeOpacity: 0.8
            strokeWeight: .35
            fillOpacity: 0.5
                      )
  $('#species_select, #state_select').change ->
    window.initMap()
