document.addEventListener('turbolinks:load', function(){

  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
  const handler = Gmaps.build('Google');
  
  handler.buildMap({ provider: {maxZoom: 17}, internal: {id: 'map'}}, ()=>{
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
 
 

        // neighborhoodOverlayLayer.addListener('click', (kmlEvent) => {
        //   let text = kmlEvent.featureData.infoWindowHtml;
        //   console.log(kmlEvent)
        //   console.log(text.match(/sec_neigh<\/td><td>(.*)\<\/td>/)[1]);
        // });


 
  if(document.querySelector(".tank_locations_new")){
    allowDropPin(handler)
  }
});

function allowDropPin(map) {
  let lastMarker
  const geocoder = new google.maps.Geocoder
  const neighborhoodOverlay = "https://data.cityofchicago.org/api/geospatial/bbvz-uum9?method=export&format=KML" 
  const neighborhoodOverlayLayer = new google.maps.KmlLayer({
          url: neighborhoodOverlay,
          suppressInfoWindows: true,
          map: map.getMap()
        });

  neighborhoodOverlayLayer.addListener('click', (kmlEvent) => {
    
    if(lastMarker){
      lastMarker.setMap(null)
      map.removeMarker(lastMarker)
    }

    let location = {
      "lat": kmlEvent.latLng.lat(),
      "lng": kmlEvent.latLng.lng()
    }

    geocoder.geocode({location: location}, (results, status) => {
      document.querySelector("#tank_location_address").value = results[0].formatted_address
    })

    lastMarker = map.addMarker(location)

    document.querySelector("#tank_location_latitude").value  = location.lat
    document.querySelector("#tank_location_longitude").value = location.lng
  });
}


// function allowDropPin(map) {
//   let lastMarker
//   const geocoder = new google.maps.Geocoder

//   google.maps.event.addListener(map.getMap(), 'click', (event) => {

//     if(lastMarker){
//       lastMarker.setMap(null)
//       map.removeMarker(lastMarker)
//     }

//     let location = {
//       "lat": event.latLng.lat(),
//       "lng": event.latLng.lng()
//     }

//     geocoder.geocode({location: location}, (results, status) => {
//       document.querySelector("#tank_location_address").value = results[0].formatted_address
//     })

//     lastMarker = map.addMarker(location)

//     document.querySelector("#tank_location_latitude").value  = location.lat
//     document.querySelector("#tank_location_longitude").value = location.lng
//   });
// }



