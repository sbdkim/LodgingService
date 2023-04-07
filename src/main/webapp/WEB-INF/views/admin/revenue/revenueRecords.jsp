<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-type": "application/json; charset=utf-8"
		},
		url: 'monthlyChart',
		success: function(result) {
			// 최신 버전의 구글 코어차트 패키지 로드해준다.
			google.charts.load('current', {'packages':['corechart']});
			
			// 차트API가 로드완료했을 때 실행할 콜벡함수 선언
			google.charts.setOnLoadCallback(function() {
				drawChart(result);
			});
		},
		error: function() {
			alert("Chart drawing error!");
		}
	});
	
	function drawChart(result) {
		// 차트 그리는데 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "MONTH");
		data.addColumn("number", "PRICE");
		
		// 콘트롤러에서 json타입으로 전달된 데이터를 
		// 자바스크립트의 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.month, obj.price]);
		})
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		
		// 파이차트 그리기
		var options = {
			title: '월 별 매출', 
			0: { color: '#ffc107' }
		};
		
		 var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart'));
		
		 chart.draw(data, options);
	}
	
	
});
</script>

	<div align="center">
	<h1>월 별 매출</h1>
		<div id="ColumnChart" style="width: 1200px; height: 600px;  margin-left:-125px;"></div>
	</div>
<%@ include file="../footer.jsp"%>
