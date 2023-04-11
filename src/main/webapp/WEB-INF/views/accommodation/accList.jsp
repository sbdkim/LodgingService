<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<style>
/*table */
/*** Table Styles **/
.table-fill {
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	height: 320px;
	margin: auto;
	max-width: 600px;
	padding: 5px;
	width: 100%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

th {
	color: #D5DDE5;;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 23px;
	font-weight: 100;
	padding: 24px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

th:first-child {
	border-top-left-radius: 3px;
}

th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 16px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:first-child {
	border-top: none;
}

tr:last-child {
	border-bottom: none;
}

tr:nth-child(odd) td {
	background: #EBEBEB;
}

tr:nth-child(odd):hover td {
	/*background:#FFCDC3;*/
	
}

tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

td {
	background: #FFFFFF;
	padding: 20px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 18px;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
}

td:last-child {
	border-right: 0px;
}
</style>
<main>
	<div class="tap_wrapper">
		<div class="sub_wrapper">
			<article style="text-align: center;">
				<h1>숙소 검색</h1>
				<form name="frm" id="acc_form" action="room" method="post" style="display: flex">

					<input type="hidden" name="ro_count" id="ro_count" value="${ro_count}">
					<table style="border: double">
						<tr id="searchtr" style="background: white">
							<td width="650">지역 
								<input type="text" name="key" id="key" value="${key}">
								<input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
								<input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
							</td>
							<td>
								<div class=main_checkinout style="display: inline-block">
									<div role=button style="display: inline-block">
										<div class="main_checkinout_buttonbox"
											style="display: inline-block">
											<div style="display: inline-block">
												<input type='date' id="checkin" class="main_checkin_1" name="checkin" value="${checkin}" required>
											</div>
											<div style="display: inline-block">
												<input type='date' id="checkout" class="main_checkout_1" name="checkout" value="${checkout}" required>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>

					<table id="accommodationList" border="1" width="1500">
						<tr>
							<th>번호</th>
							<th>숙소명</th>
							<th>주소</th>
							<th>숙소 살펴보기</th>
							<th>전화번호</th>
						</tr>
						<c:choose>
							<c:when test="${accommodationListSize<=0}">
								<tr>
									<td width="100%" colspan="5" align="center" height="23">등록된 숙소가 없습니다.</td>	
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${accommodationList}" var="accommodationVO" varStatus="status">
									<tr>
										<td>${accommodationVO.aseq}</td>
										<td>${accommodationVO.aname}</td>
										<td>${accommodationVO.address}</td>
										<td><input type="hidden" name="aseq" value="${accommodationVO.aseq}"> 
											<a href="#" onclick="location.href='room?aseq=${accommodationVO.aseq}&checkin='+document.getElementById('checkin').value+'&checkout='+document.getElementById('checkout').value">숙소 살펴보기</a>
										</td>
										<td>${accommodationVO.tel}</td>
									</tr>
								</c:forEach>
								<tr id="pagination" style="background: white">
									<td colspan="5" style="text-align: center;"><%@ include file="page_area.jsp"%></td>
								</tr>
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
						document.getElementById("key").value = "";
						form.action = "acc_search_list";
						form.submit();
					}

					// Get today's date
					const today = new Date().toISOString().split('T')[0];
					// Set the minimum date of the input
					document.getElementById("checkin").setAttribute("min",today);		
					document.getElementById("checkout").setAttribute("min",today);	
				</script>
			</article>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp"%>