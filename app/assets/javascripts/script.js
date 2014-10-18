var myMap = myMap || {} ;

myMap.initialize = function(){

//simple map:
var mapOptions = {
  center: { lat: 51.53, lng: -0.115 }, 
  zoom: 14, 
  mapTypeId: google.maps.MapTypeId.ROADMAP, 
  streetViewControl: false,
  mapTypeControl: false
};

  // plain js:
  // var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  //jquery
  var mapCanvas = $('#map-canvas')[0];
  var map = new google.maps.Map(mapCanvas, mapOptions);

//marker;

var markerOptions = {
  position: new google.maps.LatLng(51.522581, -0.109446),
  map: map
}

var marker = new google.maps.Marker(markerOptions);

//marker.setMap(map);
//reposition - point
setTimeout(function(){
  map.setCenter(marker.getPosition())},5000);

// map.center = marker.getPosition()
// map.setCenter(marker.getPosition());


//infowindow

var infoWindowOptions = {
  content: 'We are here!'
};

var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

google.maps.event.addListener(marker, 'click', function(){
  infoWindow.open(map, marker);

});

var autocomplete = new google.maps.places.Autocomplete($('#autocomplete')[0]);
autocomplete.bindTo('bounds', map);

google.maps.event.addListener(autocomplete, 'place_changed', function() {
  infoWindow.close();

  var place = autocomplete.getPlace();

  if (place.geometry.viewport) {
    map.fitBounds(place.geometry.viewport);
  } else {
    map.setCenter(place.geometry.location);
    map.setZoom(17);
  }

  marker.setPosition(place.geometry.location);

  infoWindow.setContent('<div>'+ place.name +'</div>');
  // popup.open(map, marker);

});


$('#locate').on('click', function(){
  // console.log('click');

  if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    } else {
      alert("Your browser doesn't support geolocation");
    }

    function successCallback(position){
      console.log(position);
      // position.coords.latitude;
    }

    function errorCallback(error){
      console.log();
    }
});



}

google.maps.event.addDomListener(window, 'load', myMap.initialize);

// navigator.geolocation:

// navigator.geolocation.getCurrentPosition(successCallback, errorCallback);

// navigator.geolocation.getCurrentPosition(function(position) {
//   //The position object contains the lat/long co-ords
//   console.log(position);
// }, 
// function(error){
//   console.log(error);

// }

// );
