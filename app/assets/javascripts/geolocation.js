var data = "latitude=" + encodeURIComponent($('latitude').val());
var data = "longitude=" + encodeURIComponent($('longitude').val());

$.ajax({
  url: '/stores/locate',
  data: data,
  type: 'post'
})
.done(function(response) {
  alert('Successfully Geolocated Store')
})
.fail(function(error) {
  alert('Sorry we could not locate this store, please contact Administrator')
});