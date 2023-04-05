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
 <link rel="stylesheet" href="/webapp/star-rating/css/star-rating.css" media="all" type="text/css"/>
<link rel="stylesheet" href="/LodgingService/star-rating/themes/krajee-svg/theme.css" media="all" type="text/css"/> 
<script src="/LodgingService/star-rating/js/star-rating.js" type="text/javascript" ></script>
<script src="/LodgingService/star-rating/themes/krajee-svg/theme.js" type="text/javascript"></script>
    
    <style>
    #cCnt {
    	border-radius: 3px;
    	border: 1px solid #000;
    	padding: 5px;
    }
    
    #reply {
    	margin-top: 8px;
    	border-radius: 3px;
    	border: 1px solid #ccc;
    	padding: 5px;
    }
    table#rep_input td{
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
    </style>
</head>

 	

<div class="container">
    <form id="reviewForm" name="reviewForm" method="post" >
    <input type="hidden" name="rseq" value="${roomDetail.rseq}">
    <br><br>
        <div>
            <div>
                <span><h4>리뷰</h4></span> <span id="cCnt"></span>
            </div>
            <div id="reply">
         
					<br>
					&nbsp;&nbsp;&nbsp;<label for="score" class="control-label">별점 주기</label>
					<table>
						<tr>
				<td width="30"></td>
				<td width="250">
					<input id="score" name="score" class="rating rating-loading" data-min="0" data-max="5" data-step="1" >
				</td>
                        <td style="width:80%;">
                            <textarea  rows="3" cols="75" id="content" name="content" placeholder="리뷰를 입력하세요"></textarea>
                        </td>
                        <td style="width:10%;">
                            <a href='#' onClick="save_review('${roomDetail.rseq}')" class="btn">등록</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%-- <input type="hidden" id="bseq" name="bseq" value="${bookingVO.bseq }" /> --%>        
    </form>
</div>
<div class="container">
    <form id="reviewListForm" name="reviewListForm" method="post">
        <div id="reviewList">
        </div>
    </form>
	<!-- 페이지 처리 영역 -->
    <div>
		<ul id="pagination">
		</ul>
	</div>
</div>


</body>
</html>



