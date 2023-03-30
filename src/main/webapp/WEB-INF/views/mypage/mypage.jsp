<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>        
  <article>
    <h2> 예약내역확인 </h2>
    <form name="formm" method="post">
      <table id="bookingList">
      <tr>
        <th>예약일자</th> <th>예약번호</th> <th>객실명</th> <th>결제 금액</th> <th>예약 상세</th> </th>    
      </tr>
      <c:forEach items="${bookingList}"  var="bookingVO">
      <tr>  
        <td> <fmt:formatDate value="${bookingVO.Bookdate}" type="date"/></td>
        <td> ${bookingVO.bseq} </td>    
        <td> ${bookingVO.rname} </td>
        <td> <fmt:formatNumber value="${bookingVO.price}" type="currency" currencySymbol="￦"/> </td>
        <td> <a href="booking_detail?bseq=${bookingVO.bseq}"> 조회 </a></td>
      </tr>
      </c:forEach>    
      </table>   
          
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  onclick="location.href='index'"> 
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>    