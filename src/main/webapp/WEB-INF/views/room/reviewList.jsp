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
      
		   #myform fieldset{
			    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
			    direction: rtl; /* 이모지 순서 반전 */
			    border: 0; /* 필드셋 테두리 제거 */
			}
			#myform fieldset legend{
			    text-align: left;
			}
			#myform input[type=radio]{
			    display: none; /* 라디오박스 감춤 */
			}
			#myform label{
			    font-size: 1em; /* 이모지 크기 */
			    color: transparent; /* 기존 이모지 컬러 제거 */
			    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
			}
			#myform label:hover{
			    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
			}
			#myform label:hover ~ label{
			    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
			}
			#myform input[type=radio]:checked ~ label{
			    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
			}
     </style>
			</head>
			
			
				<body>
				
		<form name="myform" id="myform" method="post" action="/save">
          
        <legend>별점주기</legend>
    
         <fieldset>
        <label for="score">⭐</label><input type="radio" name="rating" value="5" id="score" style="display:block">
        <label for="score">⭐</label><input type="radio" name="rating" value="4" id="score" style="display:block">
        <label for="score">⭐</label><input type="radio" name="rating" value="3" id="score" style="display:block">
        <label for="score">⭐</label><input type="radio" name="rating" value="2" id="score" style="display:block">
        <label for="score">⭐</label><input type="radio" name="rating" value="1" id="score" style="display:block">
        </fieldset>
         </form>
				
				<div class="container">
    <form id="reviewForm" name="reviewForm" method="post" >
    <input type="hidden" name="rseq" value="${roomDetail.rseq}">
    <br><br>
        
            <div>
                <span><h4>리뷰</h4></span> <span id="cCnt"></span>
            </div>
            <div id="reply">
                <table id="rep_input" style="width: 650px">     
                    <tr>
                        <td style="width:80%;">
                            <textarea  rows="3" cols="75" id="content" name="content" placeholder="리뷰를 입력하세요"></textarea>
                        </td>
                        <td style="width:10%;">
                            <a href='#' onClick="save_review('${bookingVO.bseq}')" class="btn">등록</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%-- <input type="hidden" id="bseq" name="bseq" value="${bookingVO.bseq }" /> --%>        
    </form>
</div>
				 
		
		              
          
          
            
        
     <input type="hidden" id="rseq" name="rseq" value="${roomVO.rseq }" />

<div class="container">
<table>
    <form id="reviewListForm" name="reviewListForm" method="post">
         <div id="reviewList">
      
        </div>
    </form>
    </table> 
   <!-- 페이지 처리 영역 -->
    <div>
      <ul id="pagination">
      </ul>
   </div>
</div>



</body>

</html>


