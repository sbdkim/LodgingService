<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 주문상세정보 </h2>
    <form name="formm" method="post">
      <h3> 주문자 정보 </h3>     
      <table id="bookingList">      
      <tr>
        <th>예약일자</th> <th>예약번호</th> <th>예약자</th><th> 예약 가격</th>     
     </tr>     
     <tr>  
       <td> <fmt:formatDate value="${bookingList.bookdate}" type="date"/></td>
       <td> ${bookingList.bseq} </td>    
       <td> ${bookingList.mname} </td>
       <td> <fmt:formatNumber type="currency" value="${bookingList.bprice}" /> </td>
     </tr>    
     </table>      
      
     <h3> 예약 상품 정보 </h3> 
     <table>
     <tr>
       <th>예약숙박업체</th><th>예약객실명</th>  <th>체크인 날짜</th> <th>체크아웃 날짜</th> <th>처리 상태</th>    
     </tr>
     <tr>
 	   <td> ${bookingList.aname} </td>
       <td> ${bookingList.rname} </td>

       <td> ${bookingList.checkin} </td>
       <td> ${bookingList.checkout} </td>

       <td>
         <c:choose>
         <c:when test='${bookingList.status=="0"}'> 예약완료 </c:when>
         <c:when test='${bookingList.status=="1"}'> 입실완료 </c:when>
         <c:when test='${bookingList.status=="3"}'> 이용완료 </c:when>
         <c:otherwise> <span style="color:red"> 취소완료 </span></c:otherwise>
         </c:choose>
       </td>
     </tr>
     </table>   
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  onclick="location.href='index'">
     </div>
    </form>  
  </article>

            
 <%@ include file="../footer.jsp" %>    