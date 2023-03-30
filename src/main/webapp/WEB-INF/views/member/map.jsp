<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Map</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e7f93acd8ebd3ac5f152b7e6dc18559&libraries=services"></script>



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
  /*
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
  };  
    var map = new kakao.maps.Map(mapContainer, mapOption);

 
    <c:forEach var="location" items="${locations}">
    var geocoder = new kakao.maps.services.Geocoder();
    console.log(${location.address});
  
      geocoder.addressSearch(location.address, function(result, status) {
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
   
      </c:forEach>
      */
  $(document).ready(function() {
	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  mapOption = {
	      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	      level: 3 // 지도의 확대 레벨
	  };  
	  var map = new kakao.maps.Map(mapContainer, mapOption);
	    
	  var geocoder = new kakao.maps.services.Geocoder();
	  
	  $.ajax({
		  type: 'POST',
		  url: 'map',
		  dataType: 'json',
		  contentType: 'application/x-www-form-urlencoded; charsetset=utf-8',
		  success : function(data) {
			  $.each(data, function(index, location){
				 //console.log(location.address); 
				  geocoder.addressSearch(location.address, function(result, status) {
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
			  })
		  },
		  error : function() {
			  alert("데이터 수신이 실패하였습니다.");
		  }
	  })
  });
  </script>
</body>
</html>

<%@ include file="../footer.jsp"%>
