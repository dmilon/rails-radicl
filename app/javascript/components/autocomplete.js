function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var gardenAddress = document.getElementById('garden_address');

    if (gardenAddress) {
      var autocomplete = new google.maps.places.Autocomplete(gardenAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(gardenAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
