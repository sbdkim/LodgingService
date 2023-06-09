<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<article style="display: block; justify-content: center; text-align: center">
			<h2>객실상세정보</h2>
			<form name="formm" method="post" action="booking" style="display: block">
				<input type="hidden" name="rseq" value="${roomDetail.rseq}">
				<input type="hidden" name="checkin" id="checkin" value="${param.checkin}">
				<input type="hidden" name="checkout" id="checkout" value="${param.checkout}">
				<table id="roomDetail" align="center" border="1" width="700">
					<tr>
						<td rowspan="6" width="225" height="225">
							<c:choose>
							
								<c:when test="${roomDetail.rimage == null}">
									<img src="room_images/default.jpg" />
								</c:when>
								
								<c:otherwise>
									<img src="room_images/${roomDetail.rimage}" />
								</c:otherwise>
								
							</c:choose>
						</td>
						<td><b>객실명</b></td>
						<td>${roomDetail.rname}</td>
					</tr>
					<tr>
						<td><b>가격</b></td>
						<td>${roomDetail.price}</td>
					</tr>
					<tr>
						<td><b>수용 인원</b></td>
						<td>${roomDetail.maxcap}</td>
					</tr>
					<tr>
						<td><b>체크인</b></td>
						<td>${roomDetail.ckintime}</td>
					</tr>
					<tr>
						<td><b>체크아웃</b></td>
						<td>${roomDetail.ckouttime}</td>
					</tr>
					<tr>
						<td><b>침대</b></td>
						<td>${roomDetail.bed}</td>
					</tr>
					<tr>
						<td colspan="3"><b>시설 및 서비스</b></td>
					</tr>
					<tr>
						<td colspan="3" height="200">
							<c:choose>
								<c:when test='${roomDetail.wifi=="1"}'>와이파이&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.kitchen=="1"}'>주방(가스)&nbsp;</c:when>
								<c:when test='${roomDetail.kitchen=="2"}'>주방(인덕션)&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.pool=="1"}'>수영장&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.ac=="1"}'>에어컨&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.tv=="1"}'>TV&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.coffeemachine=="1"}'>커피머신&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.fridge=="1"}'>냉장고&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.bathtub=="1"}'>욕조&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.parking=="1"}'>주차&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.heater=="1"}'>난방&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.microwave=="1"}'>전자레인지&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.kettle=="1"}'>전기포트&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.washer=="1"}'>세탁기&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.bbq=="1"}'>바비큐&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.hairdrier=="1"}'>헤어드라이어&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.amenity=="1"}'>어메니티&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.towel=="1"}'>수건&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.elevator=="1"}'>엘리베이터&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.breakfast=="1"}'>조식&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.smoking=="1"}'>흡연&nbsp;</c:when>
								<c:otherwise>금연&nbsp;</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.gym=="1"}'>피트니스&nbsp;</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${roomDetail.roomservice=="1"}'>룸서비스&nbsp;</c:when>
							</c:choose>
						</td>
					</tr>
				</table>
				<br><br>
				<div class="clear"></div>
				<input type="submit" value="예약하기">
				<input type="button" value="다른 객실 보기" onclick="history.back(1)">
			</form>
			<%@ include file="reviewList.jsp"%>
		</article>
	</div>
</div>
</main>

<script type="text/javascript">
	$(document).ready(function() {
		console.log("review list 조회");
		// 상품상세정보 로딩 시에 상품평 목록을 조회하여 출력
		getListReview();
	});

	// 상품평 목록 불러오기
	function getListReview() {

		$.ajax({
			type : 'GET',
			url : 'review/list',
			dataType : 'json',
			data : $("#reviewForm").serialize(),//일련화 시킴, 연속화
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var pageMaker = data.pageInfo;
				var total = data.total;
				var reviewList = data.reviewList;

				showHTML(pageMaker, reviewList, total);
			},
			error : function() {
				alert("리뷰 목록을 조회하지 못했습니다.")
			}
		});
	}

	function getReviewPaging(pagenum, rowsperpage, rseq) {
		$.ajax({
			type : 'GET',
			url : 'review/list',
			dataType : 'json',
			data : {
				"pageNum" : pagenum,
				"rowsPerPage" : rowsperpage,
				"rseq" : rseq
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var pageMaker = data.pageInfo;
				var totalCount = data.total;
				var reviewList = data.reviewList;
				console.log("pageMaker=", pageMaker);
				console.log("count=", totalCount);
				console.log("review=", reviewList);

				showHTML(pageMaker, reviewList, totalCount);
			},
			error : function() {
				alert("상품평 목록을 조회하지 못했습니다.")
			}
		});
	}

	function showHTML(pageMaker, reviewList, total) {
		var html = "";
		var p_html = "";

		if (reviewList.length > 0) {
			// 상품평의 각 항목별로 HTML 생성
			$.each(reviewList, function(index, item) {
				html += "<div>";
				html += "<div id=\"review_item\"> <strong>작성자: " + item.email + "</strong>&nbsp&nbsp&nbsp";
				html += "<span id=\"write_date\">" + displayTime(item.indate) + "</span><br>";
				if (item.score == 1) {
					html += "<td>★☆☆☆☆</td>";
				} else if (item.score == 2) {
					html += "<td>★★☆☆☆</td>";
				} else if (item.score == 3) {
					html += "<td>★★★☆☆</td>";
				} else if (item.score == 4) {
					html += "<td>★★★★☆</td>";
				} else if (item.score == 5) {
					html += "<td>★★★★★</td>";
				}
				html += "<br>"
				html += item.content + "<br></div>";
				html += "<a href='#' onclick='review_delete(" + item.reseq + ");'>삭제</a>";
				/* html += "<input type="hidden" value="'+ item.reseq +'">"; */
				html += "</div>";
			});

			// 페이징 버튼 출력`
			if (pageMaker.prev == true) {
				p_html += "<li class=\"paginate_button previous\">";
				p_html += "<a href='javascript:getReviewPaging(" + pageMaker.startPage - 1 + ","
						+ pageMaker.criteria.rowsPerPage + "," + ${roomVO.rseq} +")'>[이전]</a></li>";

			}

			for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
				p_html += "<a href='javascript:getReviewPaging(" + i + ","
						+ pageMaker.criteria.rowsPerPage + "," + ${roomVO.rseq} +")'>[" + i + "]</a></li>";
				console.log(p_html);
			}

			if (pageMaker.next == true) {
				p_html += "<li class=\"paginate_button next\">";
				p_html += "<a href='javascript:getReviewPaging(" + (pageMaker.endPage + 1) + ","
						+ pageMaker.criteria.rowsPerPage + "," + ${roomVO.rseq} +")'>[다음]</a></li>";
			}

		} else { // 조회된 상품평이 없을 경우
			html += "<div>";
			html += "<h5>등록된 리뷰가 없습니다.</h5>";
			html += "</div>";
		}

		// 상품평 갯수 출력
		$("#cCnt").html("댓글 " + "<span style='color:#00f;'>" + total + "</span>");
		// 상품평 목록 출력
		$("#reviewList").html(html);
		// 페이징 버튼 출력
		$("#pagination").html(p_html);

	}

	/*
	 ** 입력 파라미터:
	 **     timeValue - 상품평 등록 시간
	 */
	function displayTime(timeValue) {
		var today = new Date();

		// 현재시간에서 댓글등록시간을 빼줌
		var timeGap = today.getTime() - timeValue;

		// timeValue를 Date객체로 변환
		var dateObj = new Date(timeValue);

		// timeGap이 24시간 이내인지 판단
		if (timeGap < (1000 * 60 * 60 * 24)) { // 시, 분, 초를 구함
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			//return hh + ':' + mi + ':' + ss;
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			//return yy + "-" + mm + "-" + dd;
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	}

	/*
	 ** 상품 댓글 등록
	 */
	function save_review(rseq) {
		$.ajax({
			type : 'POST',
			url : 'review/save',
			data : $("#reviewForm").serialize(),
			success : function(data) {
				if (data == 'success') { // 상품평 등록 성공
					getListReview(); // 상품평 목록 요청함수 호출
					$("#score").val(),
					$("#content").val("");
				} else if (data == 'fail') {
					alert("리뷰 등록이 실패하였습니다. 다시 시도해 주세요.");
				} else if (data == 'not_logedin') {
					alert("리뷰 등록은 로그인이 필요합니다.");
				}
			},
			error : function(request, status, error) {
				alert("error:" + error);
			}
		});
	}

	// 삭제 함수
	function review_delete(reseq) {
		$.ajax({
			url : 'review/delete',
			type : "post",
			data : {reseq : reseq},
			success : function(data) {
				if (data == "success") {
					getListReview();
					location.reload();
				} else if (data == 'not_logedin') {
					alert("리뷰 삭제는 로그인이 필요합니다.");
				} else {
					alert("리뷰 삭제가 실패하였습니다. 다시 시도해 주세요.");
				}
			}
		}); // ajax() end
	} // review_delete end

</script>
<%@ include file="../footer.jsp"%>