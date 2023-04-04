<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu_host.jsp" %>        
<article>
  <h2 align="center">  '${sessionScope.loginHost.name}'님이 등록한 숙소 </h2>
  <form name="frm" id="acc_form" method="post">
  <table>
  	<tr>
  	<td width="642">
  		업체명
  		<input type="text" name="key" id="key">
  		<input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
  		<input class="btn" type="button" name="btn_write" value="업체 등록" onClick="go_wrt()">
  	</table>  
      <table id="accommodationList">
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
      <tr>  
        <td align="center" width="100px">
        <c:choose>
        <c:when test='${accommodationVO.category==0}'>호텔/리조트</c:when> 
        <c:when test='${accommodationVO.category==1}'>모텔</c:when>
        <c:when test='${accommodationVO.category==2}'>펜션,풀빌라</c:when>
        <c:when test='${accommodationVO.category==3}'>게스트 하우스</c:when>  
        </c:choose>
		</td> 
		<td align="center" width="300px"> ${accommodationVO.aname} </td>
		<td align="center" width="500px"> ${accommodationVO.address} </td>
		<td align="center" width="100px"> ${accommodationVO.tel} </td>
		<td align="center" width="100px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 조 회 </a></td>
		<td align="center" width="50px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 등 록 / </a></td>
		<td align="center" width="50px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 수 정 / </a></td>
		<td align="center" width="40px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 삭 제 </a></td>
      </tr>
      </c:forEach>   
      <tr><td colspan="8" style="text-align:center">${paging}</td></tr> 
      </c:otherwise>
      </c:choose>
      </table>   
    </form>  
    <%@ include file="page_area.jsp" %>  
  </article>
<%@ include file="../footer.jsp" %>   

<script type="text/javascript">

/* 상품 등록 */
function go_wrt() {
	var form = document.getElementById("acc_form");
	
	form.action = "host_accommodation_write_form";
	form.submit();
}

/* 상품 검색 */
function go_search() {
	var form = document.getElementById("acc_form");
	
	form.action = "host_mypage";
	form.submit();
}




function go_list() {
	var form = document.getElementById("detail_form");
	
	form.action = "host_mypage";
	form.submit();
}

function go_mod(pseq) {
	var form = document.getElementById("detail_form");
	form.action = "admin_product_update_form?pseq=" + pseq;
	form.submit();
}

function go_mod_save(pseq) {
	if(document.getElementById("kind").value=="") {
		alert("상품 종류를 입력하세요");
		document.getElementById("kind").focus();
		return false;
	} else if(document.getElementById("name").value=="") {
		alert("상품명을 입력하세요");
		document.getElementById("name").focus();
		return false;
	} else if(document.getElementById("price1").value=="") {
		alert("상품원가를 입력하세요");
		document.getElementById("price1").focus();
		return false;
	} else if(document.getElementById("price2").value=="") {
		alert("판매가를 입력하세요");
		document.getElementById("price2").focus();
		return false;
	} else if(document.getElementById("price3").value=="") {
		alert("판매순익을 입력하세요");
		document.getElementById("price3").focus();
		return false;
	} else if(document.getElementById("content").value=="") {
		alert("상품 설명을 입력하세요");
		document.getElementById("content").focus();
		return false;
	} else {
		var form = document.getElementById("update_form");
		
		form.enctype = "multipart/form-data";
		form.action = "admin_product_update";
		form.submit();
	}
}
</script>

 