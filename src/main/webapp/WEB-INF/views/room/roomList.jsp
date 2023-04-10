<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<style>
 /*table */
 /*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 

 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  /*background:#FFCDC3;*/
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}
  

</style>


<script>


$(document).ready(function() {
	  // Get today's date
	  const today = new Date().toISOString().split('T')[0];
	  // Set the minimum date of the input
	  document.getElementById("checkin").setAttribute("min", today);
	  document.getElementById("checkout").setAttribute("min", today);  	
	  
	  $("#refreshDate").click(function() {
		  var form = document.getElementById("date_form");
			form.action = "updateRoom";
			form.submit();
	  })
});
	
</script>
<main>
<div style="display:block;  text-align: center; ">
<h1 >숙소 검색 결과</h1>
<h2 > ${accommodationName} 의 객실 목록</h2>
</div>
			<form name="date_form" id="date_form" method="post" style="display:flex">
				<input type="hidden" name="aseq" value="${param.aseq}">
						<div class=main_checkinout style="display:inline-block">
							<div role=button style="display:inline-block">
								<div class="main_checkinout_buttonbox" style="display:inline-block">
									<div style="display:inline-block">
										<input type='date' id="checkin"  
											class="main_checkin_1" name="checkin" value= "${checkin}" required>
									</div>
									<div style="display:inline-block">
										<input type='date' id="checkout"
											class="main_checkout_1" name="checkout" value = "${checkout}" required>
									</div>
								</div>
							</div>
							<input class="btn" type="button" name="refreshDate" id="refreshDate" value="검색" >
						</div>
					</form>
<article style="display:flex; justify-content:center;">
<form name="roomForm" id="room_form" method="post" style="display:block; margin-bottom: 60px">

	
	<table id="roomList" border="1" width="1000" >
		<tr>
			<th width="225">Image</th><th>방 이름</th><th>가격</th><th>최대 인원</th><th>침대</th><!--  <th>사업자이메일</th><th>전화번호</th>-->
		</tr>
		<c:choose>
			<c:when test="${roomListSize<=0}">
				<tr>
					<td width="100%" colspan="5" align="center" height="23">
					등록된 방이 없습니다...
					</td>
				</tr>
			</c:when>
			<c:when test="${empty roomList}">
				<tr>
					<td width="100%" colspan="5" align="center" height="23">
					해당 날짜에 남아있는 방이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${roomList}" var="roomVO">
				<tr>
					<c:choose>
					    <c:when test="${empty roomVO.rimage}">
					       <td>  <img src="room_images/default.jpg" /></td>
					      
					    </c:when>    
					    <c:otherwise>
					        <td> <img src="room_images/${roomVO.rimage}" /></td>
					    </c:otherwise>
					</c:choose>

					<td><a href="room_detail?rseq=${roomVO.rseq}&checkin=${checkin}&checkout=${checkout}">${roomVO.rname}</a></td>
					<td>${roomVO.price}</td>
					<td>${roomVO.maxcap}</td>
					<td>${roomVO.bed}</td>
				</tr>
				</c:forEach>
			
			</c:otherwise>
		</c:choose>
	</table>
</form>
</article>
</main>
<%@ include file="../footer.jsp"%>