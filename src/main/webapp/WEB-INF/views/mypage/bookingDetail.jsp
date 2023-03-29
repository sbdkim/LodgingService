<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 주문상세정보 </h2>
    <form name="formm" method="post">
      <h3> 주문자 정보 </h3>     
      <table>      
      <tr>
        <th>예약일자</th> <th>예약번호</th> <th>예약자</th>
 <th> 예약 가격</th>     
     </tr>     
     <tr>  
       <td> <fmt:formatDate value="${bookingDetail.indate}" type="date"/></td>
       <td> ${bookingDetail.bseq} </td>    
       <td> ${bookingDetail.email} </td>
       <td> <fmt:formatNumber type="currency" 
value="${totalPrice}" /> </td>
     </tr>    
     </table>         
     <h3> 예약 상품 정보 </h3> 
     <table>
     <tr>
       <th>예약객실명</th> <th>객실번호</th> <th>체크인 날짜</th> <th>체크아웃 날짜</th>
 <th>가격</th> <th>처리 상태</th>    
     </tr>
     <c:forEach items="${bookingList}"  var="bookingVO">
     <tr>
       <td> ${bookingVO.pname} </td>
       <td> ${bookingVO.rseq} </td>          
       <td> ${bookingVO.ckindate} </td>
       <td> ${bookingVO.ckoutdate} </td>
       <td> <fmt:formatNumber type="currency"
       value="${totalPrice}" /> </td>
       <td>
         <c:choose>
         <c:when test='${bookingVO.status=="0"}'> 예약완료 </c:when>
         <c:when test='${bookingVO.status=="1"}'> 입실완료 </c:when>
         <c:when test='${bookingVO.status=="0"}'> 이용완료 </c:when>
         <c:otherwise> <span style="color:red"> 취소완료 </span></c:otherwise>
         </c:choose>
       </td>
     </tr>
     </c:forEach>    
     </table>   
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  
onclick="location.href='index'">
     </div>
    </form>  
  </article>

       
       
       
       
       
       
       
       
 <%@ include file="../footer.jsp" %>    