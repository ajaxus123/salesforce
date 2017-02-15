<%- @locations.map {|store| "<div id='store_#{store.id}' class='store-object' data-latitude='#{store.latitude}' data-longitude='#{store.longitude}' data-name='#{store.storename}' data-path='#{store_path(store)}'></div>".html_safe} %>

function initMap() {
  var $stores = $(".store-object");
  $stores.each(function() {
    var lat = $(this).data("latitude");
    var lng = $(this).data("longitude");
    var mylatlng = {lat: lat, lng: lng}

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: mylatlng
    }); 

    var marker = new google.maps.Marker({
      position: mylatlng,
      map: map,
      animation: google.maps.Animation.DROP,
    });

    google.maps.event.addListener(marker, 'click', function () {
      var c = confirm('Would you like to visit this store?')
      if (c === true) {
        window.location.href = $(this).data("path");  
      }
      if (c === false) {
        window.location.href = '<%= dashboard_path %>';   
      }
    });

    var contentString = 'Please click on this Marker to visit' + ' ' + $(this).data("name");   

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });

    google.maps.event.addListenerOnce(map, 'tilesloaded', function() {
      infowindow.open(map, marker);
    });  
  });
}