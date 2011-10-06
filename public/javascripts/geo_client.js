(function() {
  var GeoClient;
  
  GeoClient = (function() {
    function GeoClient() {
      refreshCoordinates();
    }
    
    return GeoClient;
  })();
  
  GeoClient.latitude  = "0.0";
  GeoClient.longitude = "0.0";
  
  GeoClient.prototype.startTracking = function() {
    if (Modernizr.geolocation) {
      navigator.geolocation.getCurrentPosition(geoSuccess, null, { maximumAge: 60000 });
    }
  }
  
  this.GeoClient = GeoClient;
  
  function geoSuccess(position) { 
    if (coordinatesChanged(position) == false) {
      return true
    }
    
    refreshCoordinates();
    
    $.ajax({
      type: "POST",
      url:  "/geolocation",
      data: position
    });
  }
  
  function coordinatesChanged(position) {
    currentCoords = position.coords;
    
    if ((currentCoords.latitude != GeoClient.latitude) || (currentCoords.longitude != GeoClient.longitude)) {
      return true;
    }
    
    return false;
  }
  
  function refreshCoordinates() {
    GeoClient.latitude  = $("meta[name|=cached-geo-latitude]").attr("content");
    GeoClient.longitude = $("meta[name|=cached-geo-longitude]").attr("content");
  }
  
}).call(this);