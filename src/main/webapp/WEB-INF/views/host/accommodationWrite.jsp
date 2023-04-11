<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>

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
  width: 200px;
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
  text-align:center;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  width: 400px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}
 
#category{
width: 80px;
	font-size: 18px;
  font-weight: 300;
	margin-left: 1px;

}

</style>   

<main>
	<div class="tap_wrapper" style="align-items: start; width: 1300px; margin: auto">
	<%@ include file="sub_menu_host.jsp" %> 
		<div class="sub_wrapper" style="text-align:center; width: 800px ; margin-left: 10px; margin-top: 50px">


<article>
<h1>숙소 등록</h1>  
<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
<form name="frm" id="acc_write_form" method="post" enctype="multipart/form-data">

<table id="list">
<tr>
  <th>카테고리</th>
  <td>
  <select name="category" id="category">
    <c:forEach items="${categoryList}" var="categoryList" varStatus="status">
      <option value="${status.count}">${categoryList}</option>
   </c:forEach>
  </select>      
<tr>
  <th>업체명</th>
  <td >
       <input type="text" name="aname" id="aname" size="80" maxlength="100">
  </td>
</tr>

<tr>
  <th>주소</th>
  <td >
       <input type="text" name="address" id="address" size="80" maxlength="100">
  </td>
</tr>
<tr>
  <th>전화번호</th>
  <td >
       <input type="text" name="tel" id="tel" size="80" maxlength="15">
  </td>
</tr>

  <tr>
    <th>상품이미지</th>
    <td>
<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
      <input type="file" name="default" id="default">
    </td>
  </tr>    
</table>

</form> 
</article>
<br><br>
<input class="btn" type="button" value="등록" onClick="go_save()">           
<input class="btn" type="button" value="취소" onClick="go_mov()">

  </div>
  </div>
  </main>

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
	} else if(document.getElementById("address").value=="") {
		alert("주소를 입력하세요");
		document.getElementById("address").focus();
		return false;
	} else if(document.getElementById("tel").value=="") {
		alert("전화번호를 입력하세요");
		document.getElementById("tel").focus();
		return false;
	} else {
		var form = document.getElementById("acc_write_form");
		form.enctype = "multipart/form-data"; //꼭 해줘야 함!!
		form.action = "host_accommodation_write";
		form.submit();
	}
}

</script>