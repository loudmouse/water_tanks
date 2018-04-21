document.addEventListener('turbolinks:load', function(){

  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  let lastMarker

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {maxZoom: 17}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });


  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    if(lastMarker){
      lastMarker.setMap(null)
      handler.removeMarker(lastMarker)
    }

    let location = {
      "lat": event.latLng.lat(),
      "lng": event.latLng.lng()
    }

    lastMarker = handler.addMarker(location)

    document.querySelector("#tank_location_latitude").value  = location.lat
    document.querySelector("#tank_location_longitude").value = location.lng

  });
});








