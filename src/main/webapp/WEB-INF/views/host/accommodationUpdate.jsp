<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu_host.jsp"%>

<article>
<h1>객실 수정</h1>  
<form name="frm" id="acc_update_form" method="post" enctype="multipart/form-data">
<input type="hidden" name="aseq" value="${accommodationVO.aseq}">
<input type="hidden" name="email" >
<input type="hidden" name="nonmakeImg" value="${accommodationVO.aimage}"> <!-- 기존 이미지 저장  -->
<input type="hidden" name="bestyn" value="${accommodationVO.bestyn}" >
<table id="list">
  <tr>
    <th>카테고리</th>
    <td colspan="5">
    <select name="category" id="category">
      <c:forEach items="${categoryList}" var="category" varStatus="status">
        <c:choose>
          <c:when test="${accommodationVO.category==status.count}">
            <option value="${status.count}" selected="selected">${category}</option>
          </c:when>
          <c:otherwise>
            <option value="${status.count}">${category}</option>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </select> 
    </td>
  </tr>
  <tr>
    <th>이  름</th>
    <td width="343" colspan="5">
      <input type="text" name="aname" id="aname" size="100" maxlength="500" value="${accommodationVO.aname}">
    </td>
  </tr>
  <tr>
    <th>주  소</th>
    <td width="343" colspan="5">
      <input type="text" name="address" id="address" size="47" maxlength="100" value="${accommodationVO.address}">
    </td> 
  </tr>
    <tr>
    <th>전화번호</th>
    <td width="343" colspan="5">
      <input type="text" name="tel" id="tel" size="47" maxlength="100" value="${accommodationVO.tel}">
    </td> 
  </tr>
  <tr>
    <th>업체 이미지</th>
    <td colspan="5">
      <img src="accommodation_images/${accommodationVO.aimage}" width="200pt">     
      <br>
      <input type="file" name="accommodation_images" id="accommodation_images">
      <input type="hidden" name="image" value="${accommodationVO.aimage}">
    </td> 
  </tr>    
</table>
<input class="btn" type="button" value="수정" onClick="go_mod_save('${accommodationVO.aseq}')">           
<input class="btn" type="button" value="취소" onClick="history.back(1)">
</form> 
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>
<script type="text/javascript">
function go_mod_save(aseq) {
	if(document.getElementById("category").value=="") {
		alert("카테고리를 입력하세요");
		document.getElementById("kind").focus();
		return false;
	} else if(document.getElementById("aname").value=="") {
		alert("이름을 입력하세요");
		document.getElementById("aname").focus();
		return false;
	} else if(document.getElementById("address").value=="") {
		alert("주소를 입력하세요");
		document.getElementById("address").focus();
		return false;
	}else if(document.getElementById("tel").value=="") {
		alert("전화번호를 입력하세요");
		document.getElementById("tel").focus();
		return false;
	} else {
		var form = document.getElementById("acc_update_form");
		
		form.enctype = "multipart/form-data";
		form.action = "host_acc_update";
		form.submit();
	}
}
</script>