<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>

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

<h1>숙소 검색 결과</h1>
<h2> ${accommodationName} 의 객실 목록</h2>
			<form name="date_form" id="date_form" method="post" style="display:block">
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
<article>
<form name="roomForm" id="room_form" method="post" style="display:block">

	
	<table id="roomList" border="1" width="1000">
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
				<tr><td colspan="6" style="text-align:center;"> ${paging} </td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</article>
<%@ include file="../footer.jsp"%>