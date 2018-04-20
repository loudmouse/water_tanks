document.addEventListener('turbolinks:load', function(){
  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(locations);
    console.log(locations)
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    console.log("firing")
    const lat = event.latLng.lat()
    const lng = event.latLng.lng()
    handler.addMarker({"lat": lat, "lng": lng})
  });
});
