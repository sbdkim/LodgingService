<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="tap_wrapper" style="align-items: start; width: 1500px; margin: auto">
		<%@ include file="sub_menu.jsp"%>
		<div class="sub_wrapper" style="text-align: center; width: 1300px; margin-left: 10px">
			<article>
				<h2 align="center">예약 내역 확인</h2>
				<div id="buttons">
					<input type="button" value="예약 계속하기" class="cancel" onclick="location.href='index'">
				</div>
				<br>
				<form name="formm" method="post">
					<table id="bookingList" border="1" width="1500">
						<tr>
							<th>예약일자</th>
							<th>예약번호</th>
							<th>숙박업체명</th>
							<th>객실명</th>
							<th>결제 금액</th>
							<th>예약 상세</th>
						</tr>
	
						<c:choose>
							<c:when test="${empty bookingList}">
								<td width="100%" colspan="6" align="center" height="23">
								  현재 예약이 없습니다.
								  </td>
							</c:when>
							<c:otherwise>
								<c:forEach items="${bookingList}" var="bookingVO">
							<tr>
								<td align="center" width="150px">
									<fmt:formatDate	value="${bookingVO.bookdate}" type="date" />
								</td>
								<td align="center" width="150px">${bookingVO.bseq}</td>
	
								<td align="center" width="500px">${bookingVO.aname}</td>
								<td align="center" width="200px">${bookingVO.rname}</td>
	
								<td align="center" width="150px">
									<fmt:formatNumber value="${bookingVO.bprice}" type="currency" currencySymbol="￦" />
								</td>
								<td align="center" width="150px">
									<a href="booking_detail?bseq=${bookingVO.bseq}">조회</a>
								</td>
							</tr>
						</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</table>
					<br>
					<br>
				</form>
			</article>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp"%>
