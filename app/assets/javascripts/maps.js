document.addEventListener('turbolinks:load', function(){

  const locations = JSON.parse(document.querySelector("#map").dataset.locations)

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {maxZoom: 17}, internal: {id: 'map'}}, ()=>{
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

  if(document.querySelector(".tank_locations_new")){
    allowDropPin()
  }
});

function allowDropPin() {
  let lastMarker
  const geocoder = new google.maps.Geocoder

  google.maps.event.addListener(handler.getMap(), 'click', (event)=> {
    if(lastMarker){
      lastMarker.setMap(null)
      handler.removeMarker(lastMarker)
    }

    let location = {
      "lat": event.latLng.lat(),
      "lng": event.latLng.lng()
    }

    geocoder.geocode({location: location}, (results, status) => {
      document.querySelector("#tank_location_address").value = results[0].formatted_address
    })

    lastMarker = handler.addMarker(location)

    document.querySelector("#tank_location_latitude").value  = location.lat
    document.querySelector("#tank_location_longitude").value = location.lng
  });
}










