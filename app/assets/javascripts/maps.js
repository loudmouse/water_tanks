document.addEventListener('turbolinks:load', function(){
  createMapWithMarkers()
  allowMarkerDrop()
});




function createMapWithMarkers(){
  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}

function allowMarkerDrop(){
  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    const lat = event.latLng.lat()
    const lng = event.latLng.lng()
    handler.addMarker({"lat": lat, "lng": lng})
  });
}