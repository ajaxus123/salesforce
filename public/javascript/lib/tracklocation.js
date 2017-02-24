var watchID;
var geo; // for the geo object
var map; // google map object
var mapMarker; // map marker object

// position option
var MAXIMUM_AGE = 200; // milliseconds
var TIMEOUT = 300000;
var HIGHACCURACY = true;

function getGeoLocation() {
	try {
		if( !! navigator.geolocation ) return navigator.geolocation;
		else return undefined;		
	} catch(e) {
		return undefined;
	}
}

function show_map(position) {
	var lat = position.coords.latitude;
	var lng = position.coords.longitude;
	var latlng = new google.maps.LatLng(lat, lng);

	if(map) {
		map.panTo(latlng);
		mapMarker.setPosition(latlng);
	} else {
		var myOptions = {
			zoom: 13,
			center: latlng,
		};
		
		map = new google.maps.Map(document.getElementById("map"), myOptions);
		map.setTilt(0); // turns of default 45% map tilt

		mapMarker = new google.maps.Marker({
			position: latlng,
			title: "You are here."
		});
		mapMarker.setMap(map);
	}
}

function geo_error(error) {
	stopWatching();
	switch(error.code) {
		case error.TIMEOUT:
			alert('Geolocation Timed Out');
			break;
		case error.POSITION_UNAVAILABLE:
			alert('Geolocation is unavailable');
			break;
		case error.PERMISSION_DENIED:
			alert('Geolocation permission was denied.');
			break;
		default:
			alert('Geolocation returned an unknown error code: '+ error.code);	
	}
}

function stopWatching() {
	if(watchID) geo.clearwatch(watchID);
	watchID = null;
}

function stopWatching() {
	watchID = geo.watchPosition(show_map, geo_error, {
		enableHighAccuracy: HIGHACCURACY,
		maximumAge: MAXIMUM_AGE,
		timeout: TIMEOUT
	});
}

window.onload = function() {
	if(geo = getGeoLocation()) {
		stopWatching();
	} else {
		alert('Geolocation not supported by this browser')
	}
}