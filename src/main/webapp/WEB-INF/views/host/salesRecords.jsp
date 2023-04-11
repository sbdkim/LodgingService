<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


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
	<%--arrBprice = JSON.parse("[" + price + "]");--%>
	
	function drawChart(result) {
		// 차트 그리는데 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "aname");
		data.addColumn("number", "₩");
		
		
	
		
		// 콘트롤러에서 json타입으로 전달된 데이터를 
		// 자바스크립트의 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.aname, obj.bprice]);
		
		})
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		
	
		
		
	
		
		// 바차트 그리기
		var options = {
			width: 800,
			height: 600,
			vAxis : {title : '숙소이름'},
		    hAxis : {title : '매출'},
		    font: { // [타이틀 폰트 스타일 변경]
				family: 'Comic Sans MS',
				size: 20,
				weight: 'bold',
				lineHeight: 1.2,    							
			}
			
		}
		
		//var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart'));
		
		//barchart.draw(data, barchart_options);
		 chart.draw(data, options);
	}
	
	
});
</script>
	<main>
	<div class="tap_wrapper" style="align-items: start ; padding-top:50px">
		<%@ include file="sub_menu_host.jsp"%>
		<div class="sub_wrapper" style="width: 1000px">
			
			<div align="center">
			<h1>숙소별 매출</h1>
			<table>
		
				<tr>
		
					<td><div id="ColumnChart" style="border:1px solid #ccc"></div></td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	</main>
<%@ include file="../footer.jsp"%>
