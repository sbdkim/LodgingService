<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
  <style>
 /*table */
 /*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:not(#pagenation):not(#searchtr):hover td {
  background:#FFCDC3;
  color: black;
  border-top: 1px solid #22262e;
}

 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  /*background:#FFCDC3;*/
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}
  

</style>        
  <article>
      <h2> 예약 목록 </h2>
      <form name="formm" method="post">
         
      
      <h3>예약 정보</h3>
      <table id="hostBookingList" border="1">
      <tr>
       <th>예약번호</th><th>객실번호</th><th>예약날짜</th><th>예약자명</th><th>전화번호</th><th>이메일</th><th>체크인날짜</th><th>체크아웃날짜</th>
       <th>객실가격</th><th>총 가격</th><th>삭제</th>
      </tr>
      <c:forEach items="${bookingList}"  var="bookingVO">
     <tr>
       <td align="center" width="170px"> ${bookingVO.bseq} </td>
 	   <td align="center" width="170px"> ${bookingVO.rseq} </td>
 	   <td align="center" width="300px"> ${bookingVO.bookdate}</td>
 	   <td align="center" width="170px"> ${bookingVO.mname} </td>
 	   <td align="center" width="100px"> ${bookingVO.phone} </td>
 	   <td align="center" width="100px"> ${bookingVO.memail} </td>
 	   <td align="center" width="200px">${bookingVO.checkin}</td>
 	   <td align="center" width="200px">${bookingVO.checkout}</td>
 	   <td align="center" width="200px"> <fmt:formatNumber type="currency" value="${bookingVO.rprice}"/></td>
       <td align="center" width="100px"> <fmt:formatNumber type="currency" value="${bookingVO.bprice}"/></td>
       <td align="center" width="40px"> <a href="host_booking_delete?bseq=${bookingVO.bseq}" onClick="return delcheck();"> 취 소 </a></td>

     </tr>
     </c:forEach> 
      </table>
 
    </form>  
  </article>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
function delcheck(){
	return confirm("취소하시겠습니까?");
}
</script>