<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 객실예약 </h2>

    <form name="formm" method="post">
      <table id="accRoom" align="center" border="1" width="600">      
      <tr>
        <td rowspan="9" width="225">
	        <c:choose>
				<c:when test="${empty accRoom.rimage}"><img src="room_images/default.jpg" /></c:when>    
				<c:otherwise><img src="room_images/${accRoom.rimage}" /></c:otherwise>
			</c:choose>
		</td>
		<td width="100"><b>숙소명</b></td>
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
        <td><b>이름</b></td><td><input type="text" value="${loginUser.name}"></td>
     </tr>
      <tr>
        <td><b>전화번호</b></td><td><input type="text" value="${loginUser.phone}"></td>
     </tr>
      <tr>
        <td><b>이메일</b></td><td><input type="text" value="${loginUser.email}"></td>
     </tr>
      <tr>
        <td colspan="3"><b>시설 및 서비스</b></td>
     </tr>
     <tr>
     	<td colspan="3" height="200">
     		
     	</td>
     </tr>
     </table>      
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input type="button"    value="다른 객실 보기" onclick="history.back(1)">
     </div>
    </form>  
  </article>

       
       
  <%
  String checkin = request.getParameter("checkin");
  String checkout = request.getParameter("checkout");
%>

<script>
  // Set the values of the date inputs

  document.getElementById("checkin").value = '<%= checkin %>';
  document.getElementById("checkout").value = '<%= checkout %>';
       
  </script>
       
       
       
       
 <%@ include file="../footer.jsp" %>    