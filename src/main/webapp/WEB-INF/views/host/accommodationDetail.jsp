<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 상세 정보 </h2>
    <form name="formm" id="room_form" method="post">
      <h3> 업체 정보 </h3>   
      <input type="hidden" name="aseq" value="${accommodationDetail.aseq}"> 
      <table id="accommodationList">      
      <tr>
        <th>번호</th><th>이메일</th><th>이 름</th>     
     </tr>     
     <tr>  
     
       <td align="center" width="100px"> ${accommodationDetail.aseq} </td> 
       <td align="center" width="100px"> ${accommodationDetail.hemail} </td> 
       <td align="center" width="300px"> ${accommodationDetail.aname} </td> 
     </tr>    
     </table>      
      
     <h3>  객실 정보 </h3> 
          <table id="roomList">
     <tr>
       <th>번호</th><th>객실명</th><th>객실 가격</th> <th colspan="3">수정하기</th>  
     </tr>
     <c:forEach items="${roomList}"  var="roomVO">
     <tr>
       <td align="center" width="50px">${roomVO.rseq}</td>
 	   <td align="center" width="250px"> ${roomVO.rname} </td>
       <td align="center" width="100px"> <fmt:formatNumber type="currency" value="${roomVO.price}"/></td>
	   <td align="center" width="50px"> <a href="host_room_update_form?rseq=${roomVO.rseq}"> 수 정 / </a></td>
	   <td align="center" width="40px"> <a href="host_room_delete?rseq=${roomVO.rseq}" onClick="delcheck();"> 삭 제 </a></td>
     </tr>
     </c:forEach>    
     </table>   
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input class="btn" type="button" name="btn_write" value="객실 등록" onClick="go_rwrt()">
       <input type="button"    value="이전단계로" onclick="history.back(1)">
     </div>
    </form>  
  </article>
    
       
 <%@ include file="../footer.jsp" %> 
 
 <script type="text/javascript">
 /* 업체 등록 */
 function go_rwrt() {
 	var form = document.getElementById("room_form");
 	
 	form.action = "host_room_write_form";
 	form.submit();
 }
 
 function delcheck(){
	 confirm()
 }
 </script>   