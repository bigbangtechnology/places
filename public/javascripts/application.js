// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(navigator).ready(function() {
  
  if (Modernizr.geolocation) {
    navigator.geolocation.getCurrentPosition(geo_success, null, {maximumAge: 60000});
  }
  
});

$('div.locationShow').live('pageshow',function(event){
  
  var currentId  = $('.ui-page-active').attr('id');
  var currentStr = "#" + currentId;
  
  var lat = $(currentStr).attr('data-lat');
  var lng = $(currentStr).attr('data-lng');
  
  updateLocation(lat, lng);
});

function geo_success(position) {
  var current_lat = position.coords.latitude;
  var current_lng = position.coords.longitude;  
  
  var cached_lat  = $("meta[name|=cached-geo-latitude]").attr("content");
  var cached_lng  = $("meta[name|=cached-geo-longitude]").attr("content");
  
  if ((current_lat != cached_lat) || (current_lng != cached_lng)) {
    $.ajax({
      type: "POST",
      url:  "/geolocation",
      data: position
    }); 
  }
}

function updateLocation(lat, lng) {
  var locationLatLng = new google.maps.LatLng(lat, lng);
  
  $('.map_canvas').gmap();
  $('.map_canvas').gmap({'center': locationLatLng, 'zoom': 18});
  
  $('.map_canvas').gmap('addMarker', { 
    'position': locationLatLng, 
    'bounds': null, 
    'animation': google.maps.Animation.DROP,
    'clickable': false,
    'title': 'HELLO'
  });
  
  $('.map_canvas').gmap('addMarker', { 
    'position': currentLatLng(), 
    'bounds': null, 
    'animation': google.maps.Animation.DROP,
    'clickable': false
  });
}

function currentLatLng() {
  var lat = $("meta[name|=cached-geo-latitude]").attr("content");
  var lng = $("meta[name|=cached-geo-longitude]").attr("content");
  
  return new google.maps.LatLng(lat, lng);
}