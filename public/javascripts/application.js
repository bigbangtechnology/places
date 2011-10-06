// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(navigator).ready(function() {  
  
  var geoClient = new GeoClient();
  geoClient.startTracking();
  
});