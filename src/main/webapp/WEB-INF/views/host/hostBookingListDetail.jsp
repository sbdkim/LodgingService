<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
     
  <article>
      <h2> 예약 목록 </h2>
      <form name="formm" method="post">
         
      
      <h3>예약 정보</h3>
      <table id="hostBookingList">
      <tr>
       <th>예약번호</th><th>객실번호</th><th>예약날짜</th><th>예약자명</th><th>전화번호</th><th>이메일</th><th>체크인날짜</th><th>체크아웃날짜</th>
       <th>객실가격</th><th>총 가격</th>
      </tr>
      <c:forEach items="${bookingList}"  var="bookingVO">
     <tr>
       <td align="center" width="100px"> ${bookingVO.bseq} </td>
 	   <td align="center" width="100px"> ${bookingVO.rseq} </td>
 	   <td align="center"><fmt:formatDate value="${bookingVO.bookdate}"/></td>
 	   <td align="center" width="100px"> ${bookingVO.mname} </td>
 	   <td align="center" width="100px"> ${bookingVO.email} </td>
 	   <td align="center" width="100px"> ${bookingVO.mname} </td>
 	   <td align="center"><fmt:parseDate value="${bookingVO.ckindate}"/></td>
 	   <td align="center"><fmt:parseDate value="${bookingVO.ckoutdate}"/></td>
 	   <td align="center" width="100px"> <fmt:formatNumber type="currency" value="${bookingVO.rprice}"/></td>
       <td align="center" width="100px"> <fmt:formatNumber type="currency" value="${bookingVO.bprice}"/></td>
	  
     </tr>
     </c:forEach> 
      </table>
 
    </form>  
  </article>
<%@ include file="../footer.jsp" %>