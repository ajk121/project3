var myMap = myMap || {} ;

myMap.initialize = function(){
  // myMap.events = $([]);


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

$.get('/events.json').success(function(eventsData) {
  $events = $(eventsData);
  $events.each(function(index, event) {
    var markerOptions = {
      position: new google.maps.LatLng(event.latitude, event.longitude),
      map: map
    }
    var marker = new google.maps.Marker(markerOptions);

    var infoWindowOptions = {
      content: 'We are here!'     }

    var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

    google.maps.event.addListener(marker, 'click', function(){
      infoWindow.open(map, marker);

    });

  });
})





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


