// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(navigator).ready(function() {
  
  if (Modernizr.geolocation) {
    navigator.geolocation.getCurrentPosition(geo_success, null, {maximumAge: 60000});
  }
  
});

function geo_success(position) {
  $.ajax({
    type: "POST",
    url:  "/geolocation",
    data: position
  });
}