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
          infoWindow = new google.maps.InfoWindow
            content: ''
          google.maps.event.addListener(p, 'click', (event) ->
            infoWindow.close()
            contentString = '<table><thead><tr><th>Date</th><th>Target Species</th><th>Vessel Name</th><th>Primary Method</th><th>Catch Total</th><th>Trip Summary</th></tr></thead><tbody><b>' + this.loc.short_name + '</b> <br>' + this.loc.long_name + '<br> <br>'
            for j in [0..this.rep.length-1] by 1
              contentString += '<tr><td>' + this.rep[j].rep.date + '</td> <td>' + this.rep[j].rep.species + '</td><td>' + this.rep[j].vessel_name + '</td><td>' + this.rep[j].rep.primary_method + '</td><td>' + this.rep[j].rep.catch_total + '</td><td>' + this.rep[j].rep.trip_summary + '</td></tr>'
            contentString += '</tbody></table>'
            infoWindow = new google.maps.InfoWindow
              disableAutoPan: false
            infoWindow.setContent(contentString)
            infoWindow.setPosition(event.latLng)
            google.maps.event.addListener(infoWindow, 'domready' , () ->
              iwOuter = $('.gm-style-iw')
              gmStyleTable = $('.gm-style-iw').children(':nth-child(1)').addClass('gm-style-table')
              gmStyleTable.css
                'display': 'table-row'
                'width': '100%'
              iwBackground = iwOuter.prev()
              iwBackground.children(':nth-child(2)').css
                'display': 'none'
              iwBackground.children(':nth-child(4)').css
                'display': 'none'
              iwBackground.children(':nth-child(3)').find('div').children().css
                'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px'
                'z-index': '1'
              iwCloseBtn = iwOuter.next()
              iwCloseBtn.addClass('close-button')
              if $(window).width() >= 768
                iwCloseBtnCss = '44px'
              else
                iwCloseBtnCss = '-15px'
                $('.close-button').next().css
                  'right': '-15px'
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
            infoWindow.open(map)
          )
      error: (xhr) ->
        console.log(xhr)
  $('#species_select, #state_select').change ->
    window.initMap()
