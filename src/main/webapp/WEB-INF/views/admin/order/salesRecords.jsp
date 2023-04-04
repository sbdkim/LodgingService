<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">

$(document).ready(function() {
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-type": "application/json; charset=utf-8"
		},
		url: 'booking_record_chart',
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
		
		data.addColumn("string", "aname");
		data.addColumn("number", "revenue");
		
		// 콘트롤러에서 json타입으로 전달된 데이터를 
		// 자바스크립트의 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.aname, obj.revenue]);
		})
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		
	
		
		
	
		
		// 바차트 그리기
		var barchart_options = {
			title: '연도별 숙소 예약 현황',
			width: 300,
			height: 300
		}
		
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		
		barchart.draw(data, barchart_options);
	}
	
	
});
</script>

	<div align="center">
	<h1>연도별 숙소 예약 현황</h1>
	<table>
		<tr>
			
			<td><div id="barchart_div" style="border:1px solid #ccc"></div></td>
		</tr>
	</table>
	</div>
<%@ include file="../footer.jsp"%>
