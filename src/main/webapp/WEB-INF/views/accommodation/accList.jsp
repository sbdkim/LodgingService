<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<article>
<h1>숙소 검색</h1>
<form name="frm" id="acc_form" action="room" method="post" style="display:block">
<input type="hidden" name="key" id="key" value="${key}">
	<table>
		<tr>
			<td width="650">
				지역
				<input type="text" name="key" id="key">
				<input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
				<input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
			</td>
			<td>
						<div class=main_checkinout style="display:inline-block">
							<div role=button style="display:inline-block">
								<div class="main_checkinout_buttonbox" style="display:inline-block">
									<div style="display:inline-block">
										<input type='date' id="checkin1" 
											class="main_checkin_1" name="checkin1" 
											required>
									</div>
									<div style="display:inline-block">
										<input type='date' id="checkout1" 
											 class="main_checkout_1" name="checkout1"
											 required>
									</div>
								</div>
							</div>
						</div>
			</td>
		</tr>
	</table>
	
	<table id="accommodationList" border="1" width="1500">
		<tr>
			<th>번호</th><th>숙소명</th><th>주소</th><th>숙소 살펴보기</th><!--  <th>사업자이메일</th><th>전화번호</th>-->
		</tr>
		<c:choose>
			<c:when test="${accommodationListSize<=0}">
				<tr>
					<td width="100%" colspan="5" align="center" height="23">
					등록된 숙소가 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${accommodationList}" var="accommodationVO" varStatus="status">
				
				<tr>
				
					<td>${status.count}</td>
					<td>${accommodationVO.aname}</td>
					<td>${accommodationVO.address}</td>
					  
					<td>
					
						<input type="hidden" name="aseq" value="${accommodationVO.aseq}">
						<a href="#" onclick="location.href='room?aseq=${accommodationVO.aseq}&checkin1='+document.getElementById('checkin1').value+'&checkout1='+document.getElementById('checkout1').value">숙소 살펴보기</a>
						<%--  <button  type=submit>숙소 살펴보기</button> --%>
					</td>
     				<!-- <td>${accommodationVO.email}</td> -->
					<!-- <td>${accommodationVO.tel}</td>   -->
				</tr>
				</c:forEach>
				<tr><td colspan="4" style="text-align:center;"> ${paging} </td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
<script>
function go_search() {
	var form = document.getElementById("acc_form");
	form.action = "acc_search_list";
	form.submit();
}

function go_total() {
	var form = document.getElementById("acc_form");
	document.getElementById("address").value = "";
	form.action = "acc_search_list";
	form.submit();
}
</script>
<%@ include file="page_area.jsp" %>


<script>
  // Get today's date
  const today = new Date().toISOString().split('T')[0];
  // Set the minimum date of the input
  document.getElementById("checkin1").setAttribute("min", today);
  document.getElementById("checkout1").setAttribute("min", today);   
  
</script>

<%--  bring the value of the previous page to be stored --%>
<%
  String key = request.getParameter("address");
  String checkin = request.getParameter("checkin");
  String checkout = request.getParameter("checkout");
%>

<script>
  // Set the values of the date inputs
  document.getElementById("key").value = '<%= key %>';
  document.getElementById("checkin1").value = '<%= checkin %>';
  document.getElementById("checkout1").value = '<%= checkout %>';

  
  
</script>
</article>
<%@ include file="../footer.jsp"%>