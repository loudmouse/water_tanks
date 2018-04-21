document.addEventListener('turbolinks:load', function(){
  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  var lastMarker

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {maxZoom: 17}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });


  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    if(lastMarker){
      lastMarker.setMap(null)
    }
    let lat = event.latLng.lat()
    let lng = event.latLng.lng()

    lastMarker = new google.maps.Marker({
      map: handler.getMap(),
      position: new google.maps.LatLng(lat, lng)
    });
    const formLat = document.querySelector("#tank_location_latitude")
    const formLng = document.querySelector("#tank_location_longitude")
    // handler.addMarker({"lat": lat, "lng": lng})
    formLat.value = lat
    formLng.value = lng
  });
});







