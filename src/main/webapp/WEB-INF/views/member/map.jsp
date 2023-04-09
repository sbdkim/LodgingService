	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Map</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e7f93acd8ebd3ac5f152b7e6dc18559&libraries=services"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

















  <style type="text/css">
    #map {
      width: 100%;
      height:900px;
    }
  </style>
</head>
<body >


<div style="display: flex;
  justify-content: center;
  align-items: center; margin: 30px">
<table>
			<tr>
				<td>주소</td>
				<td><input type="text" name="detailAddress" id="address"></td>
				<td><button type="button" id="searchBtn">검색</button></td>
			</tr>
			<tr>
				<td>상세 주소</td>
				<td><input type="text" name="detailAddress2"></td>
				<td></td>
			</tr>
		</table>
		</div>
		
		<div id="map" style="width:90%; height: 700px; margin: 0 auto;"></div>
  
  
  
  
  
  
  
  <script>
  $(document).ready(function() {
	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  
	  
	  
	  mapOption = {

		  
				 center: new kakao.maps.LatLng(37.564369, 126.980058), // 지도의 중심좌표
			      level: 7 // 지도의 확대 레벨

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
				 console.log(location.aname); 
				  geocoder.addressSearch(location.address, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				          var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
				          var marker = new kakao.maps.Marker({
				            position: markerPosition
				          });
				          marker.setMap(map);
				          
				          
				          
				          
				       		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
				         // var iwContent = '<div style="padding:5px;">' + location.aname + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				          
				         var iwContent = '<div style="padding:5px; margin:5px"><table style="border:none"><tr><td width="50" height="50"><img src="accommodation_images/'+ location.aseq + '.jpg" style="width:50px; height:50px;  margin:5px "></td><td style="padding:5px"><p>' + location.aname + '</p><p>' + location.address + '</p></td></tr></table></div>'; 
				          
				          
				          

				          // 인포윈도우를 생성합니다
				          var infowindow = new kakao.maps.InfoWindow({
				              content : iwContent
				          });

				          // 마커에 마우스오버 이벤트를 등록합니다
				          kakao.maps.event.addListener(marker, 'mouseover', function() {
				            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				              infowindow.open(map, marker);
				          });

				          // 마커에 마우스아웃 이벤트를 등록합니다
				          kakao.maps.event.addListener(marker, 'mouseout', function() {
				              // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				              infowindow.close();
				          });
				          
				          
				          
				       // 마커에 클릭이벤트를 등록합니다
				          kakao.maps.event.addListener(marker, 'click', function() {
				        	  // set the URL of the new page to navigate to
				        	  // get the aseq value
				        	  var aseq = location.aseq; // replace this with your actual aseq value
				        	  // set the URL of the new page to navigate to, including the aseq value as a query parameter
				        	  var url = "room?aseq=" + aseq + "&checkin=" + today + "&checkout=" +tomorrow;
				        	  // navigate to the new page
				        	  window.location.href = url;
				          });
				          
				          
				          
				          
				          
				          
				          
				          
				          
				          
				          
				          
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
	  
	  
	  $('#searchBtn').click(function(){
			// 버튼을 click했을때
			 //var map = new kakao.maps.Map(mapContainer, mapOption);
			// 주소-좌표 변환 객체를 생성합니다
			//var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($('#address').val(), function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 추출한 좌표를 통해 도로명 주소 추출
			        let lat = result[0].y;
			        let lng = result[0].x;
			        getAddr(lat,lng);
			        function getAddr(lat,lng){
			            let geocoder = new kakao.maps.services.Geocoder();
		
			            let coord = new kakao.maps.LatLng(lat, lng);
			            let callback = function(result, status) {
			                if (status === kakao.maps.services.Status.OK) {
			                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
			                    $('#address').val(result[0].road_address.address_name);
			                }
			            }
			            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			        }
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
		});
	  
	  
	  
	  
	  
	  
  });
      
      
      
      
	  
      
      
  </script>
  
<script>
  // Get today's date
  const today = new Date().toISOString().split('T')[0];
  
  
  const tom = new Date();
  tom.setDate(tom.getDate() + 1);
  const tomorrow = tom.toISOString().split('T')[0];
</script>
  
</body>
</html>

<%@ include file="../footer.jsp"%>
