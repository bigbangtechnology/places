$('div.locationShow').live('pageshow',function(event){
  
  var currentId  = $('.ui-page-active').attr('id');
  var currentStr = "#" + currentId;
  
  var lat = $(currentStr).attr('data-lat');
  var lng = $(currentStr).attr('data-lng');
  
  updateLocation(lat, lng);
});

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