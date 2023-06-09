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
	<div class="tap_wrapper">
		<div class="sub_wrapper">
			<article style="justify-content: center">
				<h2>주문상세정보</h2>
				<form name="formm" method="post" action="booking_delete">
					<table id="booking" border="1">
						<tr>
							<th height="87.5">예약일자</th>
							<th>예약번호</th>
							<th>예약자</th>
							<th>예약 가격</th>
						</tr>
						<tr>
							<td><fmt:formatDate value="${booking.bookdate}" type="date" /></td>
							<td><input type="hidden" name="bseq" id="bseq" value="${booking.bseq}"> ${booking.bseq}</td>
							<td>${booking.memail}</td>
							<td><fmt:formatNumber type="currency" value="${booking.bprice}" /></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<th>예약숙박업체</th>
							<th>예약객실명</th>
							<th>체크인 날짜</th>
							<th>체크아웃 날짜</th>
							<th>처리 상태</th>
							<th>예약 취소</th>
						</tr>
						<tr>
							<td>${booking.aname}</td>
							<td>${booking.rname}</td>
							<td>${booking.checkin}</td>
							<td>${booking.checkout}</td>
							<td>
								<c:choose>
							
									<c:when test='${booking.status=="0"}'> 예약완료 </c:when>
									<c:when test='${booking.status=="1"}'> 입실완료 </c:when>
									<c:when test='${booking.status=="3"}'> 이용완료 </c:when>
									
									<c:otherwise>
										<span style="color: red"> 취소완료 </span>
									</c:otherwise>
									
								</c:choose>
							</td>
								
							<td><input type="submit" value="예약취소"></td>
						</tr>
					</table>
				</form>
				<br>
				<div id="buttons" style="float: right">
					<input type="button" value="예약 계속하기" class="cancel" onclick="location.href='index'"> <input type="button" value="돌아가기" onclick="location.href='mypage'">
				</div>
			</article>
		</div>
	</div>
</main>

<%@ include file="../footer.jsp"%>