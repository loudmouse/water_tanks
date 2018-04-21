document.addEventListener('turbolinks:load', function(){
  createMapWithMarkers()
  allowMarkerDrop()
});




function createMapWithMarkers(){
  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {maxZoom: 17}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}

function allowMarkerDrop(){
  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    const lat = event.latLng.lat()
    const lng = event.latLng.lng()
    const formLat = document.querySelector("#tank_location_latitude")
    const formLng = document.querySelector("#tank_location_longitude")
    handler.addMarker({"lat": lat, "lng": lng})
    formLat.value = lat
    formLng.value = lng
  });
}