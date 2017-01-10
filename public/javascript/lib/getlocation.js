
if (navigator.geolocation)  {
          navigator.geolocation.getCurrentPosition(sendLocation);
        } else {
          alert("Geolocation is not supported by this browser.");
        }

        function sendLocation(position){
          var latitude = position.coords.latitude;
              longitude = position.coords.longitude;
           document.getElementById('latitude').value = latitude;
           document.getElementById('longitude').value = longitude;
           enableHighAccuracy: true;
          }