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
    <article>
    <h2> 상세 정보 </h2>
    <form name="formm" id="room_form" method="post">
      <h3> 업체 정보 </h3>   
      <input type="hidden" name="aseq" value="${accommodationDetail.aseq}"> 
      <table id="accommodationList" border="1">      
      <tr>
        <th height="87.5">번호</th><th>이메일</th><th>이 름</th>     
     </tr>     
     <tr>  
     
       <td align="center" width="100px"> ${accommodationDetail.aseq} </td> 
       <td align="center" width="100px"> ${accommodationDetail.hemail} </td> 
       <td align="center" width="300px"> ${accommodationDetail.aname} </td> 
     </tr>    
     </table>      
      
     <h3>  객실 정보 </h3> 
     <table id="roomList" border="1">
     <tr>
       <th>번호</th><th>객실명</th><th>객실 가격</th> <th colspan="3">수정하기</th>  
     </tr>
     <c:forEach items="${roomList}"  var="roomVO">
     <tr>
       <td align="center" width="50px">${roomVO.rseq}</td>
 	   <td align="center" width="250px"> ${roomVO.rname} </td>
       <td align="center" width="100px"> <fmt:formatNumber type="currency" value="${roomVO.price}"/></td>
	   <td align="center" width="50px"> <a href="host_room_update_form?rseq=${roomVO.rseq}"> 수 정  </a></td>
	   <td align="center" width="100px"> <a href="host_room_delete?rseq=${roomVO.rseq}" onClick="delcheck();"> 삭 제 </a></td>
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
  </div>
  </div>
</main>
 <%@ include file="../footer.jsp" %> 
 
 <script type="text/javascript">
 /* 업체 등록 */
 function go_rwrt() {
 	var form = document.getElementById("room_form");
 	
 	form.action = "host_room_write_form";
 	form.submit();
 }
 
 function delcheck(){
	if(confirm("삭제하시겠습니까?")){
		
		return confirm("삭제하시겠습니까?");
		
	}else{
		return false;
		location = "accommodationDetail";
	}

}
 </script>   