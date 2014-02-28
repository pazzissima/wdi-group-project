$(document).on("ready page:load", function() {
var map;

function addMarker(pin){
   new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: pin
  });
}

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(37.7749,-122.4194)
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);

  $.ajax({
    url: "/map.json",
    type: "GET",
    //no data? ,
    success: function(response) {
      //console.log(response);
      for (var i=0;i<response.length;i++){
        lat = response[i].latitude;
        lon = response[i].longitude;
        new_pin = new google.maps.LatLng(lat, lon);
        addMarker(new_pin);
      }


    }});
}

initialize();
//google.maps.event.addDomListener(window, 'load', initialize);

});