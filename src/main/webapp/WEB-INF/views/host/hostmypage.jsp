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
  padding:10px;
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
  background:white;
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
  padding:10px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:15px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}
  

</style>    
<main>
	<div class="tap_wrapper" style="align-items: start; padding-top:50px">
	<%@ include file="sub_menu_host.jsp" %> 
	
	
		<div class="sub_wrapper">
<article style=" text-align: center;">
  <h2 align="center">  '${sessionScope.loginHost.name}'님이 등록한 숙소 </h2>
  
  <div id="buttons" >
      <input class="btn" type="button" name="btn_write" value="업체 등록" onClick="go_wrt()" style="width:270px; margin-bottom: 30px">
      </div>
      
    <form name="frm" id="acc_form" method="post" style="display:flex">
    <table id="accommodationList" border="1" style="margin-left: 50px">
      <tr>
        <th>카테고리</th><th>이 름</th> <th>주 소</th> <th>전화번호</th> <th>상 세</th> <th colspan="3">수정하기</th>
      </tr>
	  <c:choose>
	  <c:when test="${accommodationListSize<=0}">
	  <tr>
		  <td width="100%" colspan="8" align="center" height="23">
		  	등록된 숙소가 없습니다.
		  </td>
	  </tr>
	  </c:when>
	  <c:otherwise>
      <c:forEach items="${accommodationList}"  var="accommodationVO">
      <input type="hidden" name="aseq" value="${accommodationVO.aseq}">
      <tr>  
        <td align="center" width="130px">
        <c:choose>
        <c:when test='${accommodationVO.category==0}'>호텔/리조트</c:when> 
        <c:when test='${accommodationVO.category==1}'>모텔</c:when>
        <c:when test='${accommodationVO.category==2}'>펜션,풀빌라</c:when>
        <c:when test='${accommodationVO.category==3}'>게스트 하우스</c:when>  
        </c:choose>
		</td> 
		<td align="center" width="250px"> ${accommodationVO.aname} </td>
		<td align="center" width="450px"> ${accommodationVO.address} </td>
		<td align="center" width="200px"> ${accommodationVO.tel} </td>
		<td align="center" width="120px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 조 회 </a></td>
		<td align="center" width="100px"> <a href="host_acc_update_form?aseq=${accommodationVO.aseq}"> 수 정 </a></td>
		<td align="center" width="100px"> <a href="host_acc_delete?aseq=${accommodationVO.aseq}" onClick="return delcheck();"> 삭 제 </a></td>
      </tr>
      </c:forEach>   
      </c:otherwise>
      </c:choose>
      </table>   
      
    </form>  
  </article>
  </div>
  </div>
  </main>
<%@ include file="../footer.jsp" %>   

<script type="text/javascript">

/* 업체 등록 */
function go_wrt() {
	var form = document.getElementById("acc_form");
	
	form.action = "host_accommodation_write_form";
	form.submit();
}



function go_list() {
	var form = document.getElementById("detail_form");
	
	form.action = "host_mypage";
	form.submit();
}

function delcheck(){
	if(confirm("삭제하시겠습니까?")){
		
		return confirm("삭제하시겠습니까?");
		
	}else{
		return false;
		location = "hostmypage";
	}

}

</script>

 