document.addEventListener('turbolinks:load', function(){
  const locations = JSON.parse(document.querySelector("#map").dataset.locations)
      handler = Gmaps.build('Google');
      handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers(locations);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });

});
