<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu_host.jsp"%>

<article>
<h1>숙소 등록</h1>  
<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
<form name="frm" id="write_form" method="post" enctype="multipart/form-data">

<table id="list">
<tr>
  <th>카테고리</th>
  <td colspan="5">
  <select name="category" id="category">
    <c:forEach items="${categoryList}" var="categoryList" varStatus="status">
      <option value="${status.count}">${categoryList}</option>
   </c:forEach>
  </select>      
<tr>
  <th>업체명</th>
  <td width="343" colspan="5">
       <input type="text" name="aname" id="aname" size="47" maxlength="100">
  </td>
</tr>

<tr>
  <th>주소</th>
  <td width="300" colspan="5">
       <input type="text" name="adderess" id="adderess" size="47" maxlength="100">
  </td>
</tr>
<tr>
  <th>전화번호</th>
  <td width="100e" colspan="5">
       <input type="text" name="tel" id="tel" size="47" maxlength="100">
  </td>
</tr>

  <tr>
    <th>상품이미지</th>
    <td width="200" colspan="5">
<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
      <input type="file" name="default" id="default">
    </td>
  </tr>    
</table>
<input class="btn" type="button" value="등록" onClick="go_save()">           
<input class="btn" type="button" value="취소" onClick="go_mov()">
</form> 
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>
<script type="text/javascript">
/* 상품 등록 요청 : 폼에 입력된 정보가 올바른지 판단 */
function go_save() {
	if(document.getElementById("category").value=="") {
		alert("카테고리를 입력하세요");
		document.getElementById("category").focus();
		return false;
	} else if(document.getElementById("aname").value=="") {
		alert("이름을 입력하세요");
		document.getElementById("aname").focus();
		return false;
	} else if(document.getElementById("adderess").value=="") {
		alert("주소를 입력하세요");
		document.getElementById("adderess").focus();
		return false;
	} else if(document.getElementById("tel").value=="") {
		alert("전화번호를 입력하세요");
		document.getElementById("tel").focus();
		return false;
	} else {
		var form = document.getElementById("write_form");
		form.enctype = "multipart/form-data"; //꼭 해줘야 함!!
		form.action = "host_accommodation_write";
		form.submit();
	}
}


</script>