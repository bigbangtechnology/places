// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(navigator).ready(function() {
  
  if (Modernizr.geolocation) {
    navigator.geolocation.getCurrentPosition(geo_success, null, {maximumAge: 60000});
  }
  
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