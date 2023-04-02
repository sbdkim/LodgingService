<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>        
  <article>
    <h2 align="center"> 예약 내역 확인 </h2>
    <form name="formm" method="post">
      <table id="bookingList">
      <tr>
        <th>예약일자</th> <th>예약번호</th><th>숙박업체명</th> <th>객실명</th> <th>결제 금액</th> <th>예약 상세</th>   
      </tr>

      <c:forEach items="${bookingList}"  var="bookingVO">
      <tr>  
        <td align="center" width="100px"> <fmt:formatDate value="${bookingVO.bookdate}" type="date"/></td>
        <td align="center" width="100px"> ${bookingVO.bseq} </td>    

		<td align="center" width="300px"> ${bookingVO.aname} </td>
		<td align="center" width="150px"> ${bookingVO.rname} </td>

        <td align="center"  width="100px"> <fmt:formatNumber value="${bookingVO.bprice}" type="currency" currencySymbol="￦"/> </td>
        <td align="center" width="100px"> <a href="booking_detail?bseq=${bookingVO.bseq}"> 조회 </a></td>
      </tr>
      </c:forEach>    
      </table>   
      <br><br>    
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  onclick="location.href='index'"> 
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>    