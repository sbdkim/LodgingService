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
<main>
	<div class="tap_wrapper">
		<div class="sub_wrapper">
    <article style="display:block; justify-content:center; text-align:center">
    <h2> 객실예약 </h2> <br>
    <form name="formm" id="book_form" method="post" action="booking_insert" style="display:block">
    <input type="hidden" id="rseq" name="rseq" value="${accRoom.rseq}">
      <table id="accRoom" align="center" border="1" width="1000">      
      <tr>				
        <td rowspan="9" width="225">
	        <c:choose>
				<c:when test="${empty accRoom.rimage}"><img src="room_images/default.jpg" /></c:when>    
				<c:otherwise><img src="room_images/${accRoom.rimage}" /></c:otherwise>
			</c:choose>
		</td>
		<td width="300"><b>숙소명</b></td>
		<td>${accRoom.aname}</td>
     </tr>
      <tr>
        <td><b>객실명</b></td><td>${accRoom.rname}</td>
     </tr>
      <tr>
        <td><b>수용 인원</b></td><td>${accRoom.maxcap}</td>
     </tr>
     <tr>
        <td><b>1박 가격</b></td><td>${accRoom.price}</td>
     </tr>
      <tr>
        <td><b>체크인</b></td><td>${param.checkin}</td>
     </tr>
      <tr>
        <td><b>체크아웃</b></td><td>${param.checkout}</td>
     </tr>
     <tr>
        <td><b>이름</b></td><td>${loginUser.name}</td>
     </tr>
      <tr>
        <td><b>전화번호</b></td><td>${loginUser.phone}</td>
     </tr>
      <tr>
        <td><b>이메일</b></td><td>${loginUser.email}</td>
     </tr>
      <tr>
        <td colspan="1"><b>결제 금액</b></td>
        <td colspan="2"><input type="text" id="bprice" name="bprice" readonly></td>
     </tr>
     </table>      
     
     <div class="clear"></div>
     <div id="buttons" style="margin-top: 30px; text-align: center;">
       <input type="button" onclick="return requestPay();" value="결제하기"> 
       <%-- <input type="submit" value="예약하기"> --%>
       <input type="button" value="다른 객실 예약" onclick="history.go(-2)">
     </div>
    </form>  
  </article>
</div>
</div>
</main>
       
       
  <%
  String checkin = request.getParameter("checkin");
  String checkout = request.getParameter("checkout");
  %>

<script>
  // Set the values of the date inputs
  document.getElementById("checkin").value = '<%= checkin %>';
  document.getElementById("checkout").value = '<%= checkout %>';
</script>

<script language=JavaScript>
	$(document).ready(function(){
		var date1='<c:out value="${checkin}"/>';
		var date2='<c:out value="${checkout}"/>';
		var arr1 = date1.split('-');
		var arr2 = date2.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diff = dat2 - dat1;
		var currDay = 1000 * 60 * 60 * 24;
		var diffDay = parseInt(diff/currDay);
		var price = document.getElementById("price").value;
		var bprice = diffDay*price;
		document.getElementById("bprice").value = bprice;
	});
</script>
<script type="text/javascript">
function go_book() {
	var form = document.getElementById("book_form");
	form.action = "booking_insert";
	form.submit();
}
</script>

 <%@ include file="../footer.jsp" %>