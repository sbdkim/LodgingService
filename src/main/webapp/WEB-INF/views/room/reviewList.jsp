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
	border: 1px solid #ccc;
	border-radius: 3px;
	background: #f00;
	color: #fff;
	padding: 5px;
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

.starpoint_wrap{display:inline-block;}
.starpoint_box{position:relative;background:url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 0 no-repeat;font-size:0;}
.starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 -20px no-repeat;pointer-events:none;}
.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box; border:none;}
.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}
</style>
</head>


<body>

	<div class="container">
		<form id="reviewForm" name="reviewForm" method="post">
			<input type="hidden" name="rseq" value="${roomDetail.rseq}">
			<br>
			<br>
			<div class="wrap">
			<div>
				<span><h4>리뷰</h4></span> <span id="cCnt"></span>
			</div>

			<div id="reply">
				<table id="rep_input" style="width: 650px">
					<tr>
						<td>
							<div class="starpoint_wrap">
							  <div class="starpoint_box">
							    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
							    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
							    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
							    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
							    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
							    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
							    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
							    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
							    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
							    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
							    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
							    <span class="starpoint_bg"></span>
							  </div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 80%;"><textarea rows="3" cols="75"
								id="content" name="content" placeholder="리뷰를 입력하세요"></textarea>
						</td>
						<td style="width: 10%;"><a href='#'
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


