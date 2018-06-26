import GMaps from 'gmaps/gmaps.js';

function drawMap() {
  const mapElement = document.getElementById('map');
  const mapMarkers = document.getElementById("map-markers");
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapMarkers.dataset.markers);
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(20);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(10);
    } else {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(10);
    }
  }
}

export { drawMap };
