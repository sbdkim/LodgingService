<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Map</title>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e7f93acd8ebd3ac5f152b7e6dc18559"></script>
  <style type="text/css">
    #map {
      width: 100%;
      height: 600px;
    }
  </style>
</head>
<body>
  <div id="map"></div>
  <script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
      center: new kakao.maps.LatLng(37.5665, 126.9780),
      level: 11
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);

    for(let i = 0; i < locations.length; i++){
      var geocoder = new kakao.maps.services.Geocoder();
      geocoder.addressSearch( document.getElementById('address')  , function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
          var marker = new kakao.maps.Marker({
            position: markerPosition
          });
          marker.setMap(map);
        } else {
          console.log('Geocoder failed due to: ' + status);
        }
      });
      }
  </script>
</body>
</html>
