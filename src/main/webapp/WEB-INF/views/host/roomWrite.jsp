5<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu_host.jsp"%>

<article>
<h1>객실 등록</h1>  
<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
<form name="frm" id="room_write_form" method="post" enctype="multipart/form-data">

<table id="list">
<tr>
  <th>이  름</th>
  <td width="343" colspan="5">
       <input type="text" name="rname" id="rname" size="47" maxlength="100">
  </td>
</tr>
<tr>
  <th>1박가격</th>
  <td width="70">
    <input type="text" name="price" id="price" size="11" onKeyUp='NumFormat(this)' value="10000">
  </td>
</tr>
<tr>
  <th>수용인원</th>
  <td>
    <input type="text" name="maxcap" id="maxcap" size="11" onKeyUp='NumFormat(this)' value="1">
  </td>
</tr>  
<tr>
  <th>체크인시간</th>
  <td>
    <input type="text" name="ckintime" id="ckintime" size="15" >
  </td>
  <th>체크아웃시간</th>
  <td>
    <input>
  </td>
</tr> 
<tr>
  <th>방개수</th>
  <td>
    <input>
  </td>
</tr> 
<tr>
  <th>화장실개수</th>
  <td>
    <input>
  </td>
</tr> 
<tr>
  <th>침대</th>
  <td>
    <input>
  </td>
</tr>     
  <tr>
    <th>상세설명</th>
    <td colspan="5">
      <textarea name="content" id="content" rows="8" cols="70" >이뻐요</textarea>
    </td>
  </tr>
  <tr>
    <th>상품이미지</th>
    <td width="343" colspan="5">
<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
      <input type="file" name="product_image" id="product_image">
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