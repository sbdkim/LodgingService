<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--<link rel="stylesheet" href="/webapp/star-rating/css/star.css" media="all" type="text/css"/>
<link rel="stylesheet" href="/LodgingService/star-rating/themes/krajee-svg/theme.css" media="all" type="text/css"/> 
<link href="starrating.css" rel="stylesheet"/>  -->


<style>
#cCnt {
	border-radius: 1px;
	border: 1px solid #000;
	padding: 5px;
}

#reply {
	margin-top: 8px;
	border-radius: 3px;
	border: 1px solid #ccc;
	padding: 5px;
}

table#rep_input td {
	border: 0px dotted;
}

.btn {
	width: 60px;
	 padding: 10px 20px;
  background-color: #ff5a5f;
  color: #fff;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  margin: 0 5px;
}

#reviewList {
	background-color: rgba(254, 206, 229, 0.3);
	border-radius: 3px;
}

#myform fieldset {
	display: flex; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	/*direction: rtl; /* 이모지 순서 반전 */
	border: 0; /* 필드셋 테두리 제거 */
}

#myform fieldset legend {
	text-align: left;
}

#myform label {
	font-size: 1em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	width: 30px;
	border: none;
}

#myform input[type=radio] {
	display: inline;
}

#myform label:hover {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}




/* make the current radio visually hidden */
input[type=radio]{ 
  -webkit-appearance: none;
  margin: 0;
  box-shadow: none; /* remove shadow on invalid submit */
}

/* generated content is now supported on input. supporting older browsers? change button above to {position: absolute; opacity: 0;} and add a label, then style that, and change all selectors to reflect that change */
input[type=radio]::after {
  content: '\2605';
  font-size: 32px;
}

/* by default, if no value is selected, all stars are grey */
input[type=radio]:invalid::after {
  color: #ddd;
}

/* if the rating has focus or is hovered, make all stars darker */
rating:hover input[type=radio]:invalid::after,
rating:focus-within input[type=radio]:invalid::after
{color: #888;}

/* make all the stars after the focused one back to ligh grey, until a value is selected */
rating:hover input[type=radio]:hover ~ input[type=radio]:invalid::after,
rating input[type=radio]:focus ~ input[type=radio]:invalid::after  {color: #ddd;}


/* if a value is selected, make them all selected */
rating input[type=radio]:valid {
  color: orange;
}
/* then make the ones coming after the selected value look inactive */
rating input[type=radio]:checked ~ input[type=radio]:not(:checked)::after{
  color: #ccc;
  content: '\2606'; /* optional. hollow star */
}

.star-rating{
  display: flex;
  flex-direction: row-reverse;
}


.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

/*star box design*/
/*TAB_DESIGN*/
label { 
	display: block; 
	border: none;
	width: 50px; 
	height: 50px; 
	float: left;
	line-height: 50px;
	text-align: center;
}


</style>
</head>


<body>

	<div class="container">
		<form id="reviewForm" name="reviewForm" method="post">
			<input type="hidden" name="rseq" value="${roomDetail.rseq}">
			<br>
			<br>
			<div class="wrap" style="text-align:left">
			<div>
				<span><h4>리뷰</h4></span> <span id="cCnt" ></span>
			</div>
			<div class="star-rating space-x-4 mx-auto" style="justify-content: center;">
				<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				<label for="1-star" class="star">★</label>
			</div>
			<div id="reply">
				<table id="rep_input" style="width: 700px">
					<tr>
						<td style="width: 75%;"><textarea rows="3" cols="75"
								id="content" name="content" placeholder="리뷰를 입력하세요"></textarea>
						</td>
						<td style="width: 200px;"><a href='#'
							onClick="save_review('${bookingVO.bseq}')" class="btn">등록</a></td>
					</tr>
				</table>
			</div>
			</div>
		</form>
	</div>
	<%-- <input type="hidden" id="bseq" name="bseq" value="${bookingVO.bseq }" /> --%>






	<input type="hidden" id="rseq" name="rseq" value="${roomVO.rseq }" />

	<div class="container">
			<form id="reviewListForm" name="reviewListForm" method="post">
				<div id="reviewList"></div>
			</form>
		<!-- 페이지 처리 영역 -->
		<div>
			<ul id="pagination">
			</ul>
		</div>
	</div>



</body>

</html>


