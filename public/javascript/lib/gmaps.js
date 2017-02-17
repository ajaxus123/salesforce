    var map;
    
    function initMap () {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: <%= params[:latitude] %>, lng: <%= params[:longitude] %>},
          zoom: 16,
          scrollwheel: false,
        });
    

    var json = <%= raw @locations.map.to_json {|store| "<div id='store_#{store.id}' class='store-object' data-latitude='#{store.latitude}' data-longitude='#{store.longitude}' data-name='#{store.storename}' data-path='#{store_path(store)}'></div>".html_safe} %>;

    for (var i = 0, length = json.length; i < length; i++) {
    var data = json[i],
      LatLng = {lat: data.latitude, lng: data.longitude};

    var marker = new google.maps.Marker({
    position: LatLng,
    map: map,
    animation: google.maps.Animation.DROP,
    title: data.storename
    });
  };

}