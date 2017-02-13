<script>
      function initMap() {
        <%- @stores.near([@latitude, @longitude], 0.5).each do |store| %>
        var lat = <%= store.latitude %>
        var lng = <%= store.longitude %>
        var mylatlng = {lat: lat, lng: lng}
        <% end %>
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: mylatlng
        });
        
        var marker = new google.maps.Marker({
          position: mylatlng,
          title: 'Click to Visit this store',
          map: map
        });
    }
     
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsnTpV-sEjE_DZdX7IggTizvfn9b_eV3s&callback=initMap">
    </script>