$ ->
  map = exports ? this
  infoWindow = exports ? this
  openInfoWindow = (loc, map, event)->
    contentString = '<table><thead><tr><th>Date</th><th>Species</th><th>Vessel Name</th><th>Primary Method</th><th>Catch Total</th><th>Trip Summary</th></tr></thead><tbody><b>' + loc.short_name + '</b> <br>' + loc.long_name + '<br> <br>'
    $.ajax
      async: true
      url:'/reports_of_location'
      type: 'get'
      data:
        location_id: loc.id
        species_id: $('#species_select').val()
      success: (reports) ->
        for i in [0..reports.length-1] by 1
          contentString += '<tr><td>' + reports[i].date + '</td> <td>' + reports[i].species.name + '</td><td>' + reports[i].user.vessel_name + '</td><td>' + reports[i].primary_method + '</td><td>' + reports[i].catch_keepers + '</td><td>' + reports[i].trip_summary + '</td> </tr>'
        contentString += '</tbody></table>'
        infoWindow.close() if infoWindow
        infoWindow = new google.maps.InfoWindow
          disableAutoPan: false
        infoWindow.setContent(contentString)
        infoWindow.setPosition(event.latLng)
        infoWindow.open(map)
        google.maps.event.addListener(infoWindow, 'domready', () ->
          iwOuter = $('.gm-style-iw')
          gmStyleTable = $('.gm-style-iw').children(':nth-child(1)').addClass('gm-style-table')
          gmStyleTable.css
            'width': '100%'
            'display': 'table-row'
          iwBackground = iwOuter.prev()
          iwBackground.children(':nth-child(2)').css
            'display': 'none'
          iwBackground.children(':nth-child(4)').css
            'display': 'none'
          iwBackground.children(':nth-child(3)').find('div').children().css
            'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px',
            'z-index': '1'
          iwCloseBtn = iwOuter.next()
          iwCloseBtn.addClass('close-button')
          if $(window).width() >= 768
            iwCloseBtnCss = "44px"
          else
            iwCloseBtnCss = "-15px"
            $('.close-button').next().css
              'right': "-15px"
          iwCloseBtn.css
            'opacity': '1'
            'top': '8px'
            'right': iwCloseBtnCss
            'border-radius': '13px'
            'box-shadow': '0 0 5px #3990B9'
            iwCloseBtn.mouseout ->
              $(this).css
                'opacity': '1'
        )

  window.initMap = ->
    myOptions =
      zoom: 8
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
        lat = response[response.length-2].lat
        lng = response[response.length-2].lng
        zoom = response[response.length-1].zoom
        map.setCenter
          lat: lat
          lng: lng
        map.setZoom(zoom)
        google.maps.event.addListener(map, 'click', (event) ->
          infoWindow.close()
        )
        for i in [0..response.length-3] by 1
          if(response[i].coordinate_file)
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
            p = polygons[polygons.length - 1]
            p.setMap(map)
            google.maps.event.addListener(p, 'mouseover',(event) ->
              $("#locdetails").css("display","block")
              $("#locdetails").append("<div class='hoverrow'> <div class='hoverclass'>Location</div> <div class='hoverclass'>Average Catch Per Trip</div> <div class='hoverclass'>Reports posted past 7 days</div> </div> <br> <div class='hoverrow'><div class='hoverclass'>" + this.loc.short_name + "</div>" + "<div class='hoverclass'>" + this.moving_average + "</div>" + "<div class='hoverclass'>" + this.rep + "</div></div>")
              map.data.revertStyle()
              this.setOptions
                strokeColor: "#F7F8FF"
                strokeWeight: 3
                fillOpacity: 0.75
              )
            google.maps.event.addListener(p, 'click', (event) ->
              notification  = 'Feteching reports for ' + this.loc.short_name + '<br>Please wait...'

              infoWindow.close() if infoWindow
              infoWindow = new google.maps.InfoWindow
                disableAutoPan: false
              infoWindow.setContent(notification)
              infoWindow.setPosition(event.latLng)
              infoWindow.open(map)
              openInfoWindow(this.loc, this.map, event)
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
          else
            continue
      error: (xhr) ->
        console.log(xhr)
  $('#species_select, #state_select').change ->
    window.initMap()
