<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="CSS/subpage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="member/member.js"></script>
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
label {
	display: inline-block;
    width: 150px;
}
</style>
<script type="text/javascript">
function emailok(){
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>비밀번호 찾기 결과</h1>
  <form method="post" name="formm" action="change_pwd" id="host_pwd_form" style="margin-right:0" >
    <label>User EMAIL</label><input type=text name="email" value="${email}" readonly="readonly">   
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
      	<label>Password</label> 
        <input type="password"  name="pwd" id="pwd"><br> 
        <label>Retype Password</label> 
        <input type="password"  name="pwdCheck" id="pwdcheck"><br> 
        <input type="button" value="확인" class="cancel" onclick="changeHostPassword()">
      </c:if>
      <c:if test="${message==-1}">
             잘못된 사용자 정보입니다.
         <input type="button" value="확인" class="cancel" onclick="emailok()">
      </c:if>
    </div>
    
  </form>
</div>  
</body>
</html>