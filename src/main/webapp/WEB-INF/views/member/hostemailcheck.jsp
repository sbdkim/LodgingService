<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
<link href="CSS/subpage.css" rel="stylesheet">
<style type="text/css">
body{   
  background-color:tomato;
  font-family: Verdana;
}
#wrap{     
  margin: 0 20px;
}
h1 {
  font-family: "Times New Roman", Times, serif;
  font-size: 45px;
  color: #CCC;
  font-weight: normal;
}
input[type=button], input[type=submit] {
  float: right;
}
</style>
<script type="text/javascript">
function hostemailok(){
	opener.document.getElementById("hostemail").value="${email}";
	opener.document.getElementById("rehostemail").value="${email}";
 	self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>EMAIL 중복확인</h1>
  <form method="post" name="formm" id="theform" style="margin-right:0 "
  		action="email_check_form" >
    User EMAIL <input type="text" name="email" value="${email}"> 
            <input type="submit" value="검색" class="submit"><br>     
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.formm.hostemail.value="";
        </script>
        ${email}는 이미 사용중인 이메일입니다.
      </c:if>
      <c:if test="${message==0}">
        ${email}는 사용 가능한 이메일입니다.
        <input type="button" value="사용" class="cancel" onclick="hostemailok()">
      </c:if>
    </div>
  </form>
</div>  
</body>
</html>