if (navigator.geolocation) {
  var options = { timeout:60000, enableHighAccuracy: true, maximumAge: 5000 };
  navigator.geolocation.getCurrentPosition(
    displayPosition, 
    displayError
  );
}
else {
  alert("Geolocation is not supported by this browser");
}

function displayPosition(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  document.getElementById('latitude').value = latitude;
  document.getElementById('longitude').value = longitude;
  }

function displayError(error) {
  var errors = { 
    1: 'Permission denied',
    2: 'Position unavailable',
    3: 'Request timeout'
  };
  alert("Error: " + errors[error.code]);
}