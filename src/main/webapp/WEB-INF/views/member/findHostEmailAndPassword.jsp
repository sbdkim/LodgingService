<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	  <link href="css/shopping.css" rel="stylesheet"> 
	  <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
	  <script type="text/javascript" src="member/member.js"></script>
  </head>
  <body>
  <div id="wrap">
  	<h1>이메일, 비밀번호 찾기</h1>
  	<br>
	<form name="findEmail" id="findHostEmail" action="find_host_email" method="post">
	<table>
	<tr>
		<td align="right"><label> 이름</label></td>
		<td><input type="text" name="name" id="name" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 전화번호</label></td>
		<td><input type="text" name="phone" id="phone" value=""></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="이메일 찾기" onclick="findHostEmail()"></td>
	</tr>
	</table>
	</form>
	<p><p><p><p><p><p><p><p><p><p><p><p>
	
	
	<form name="findPW" id="findHostPW" action="find_host_pwd" method="post">
	<table>
	<tr>
		<td align="right"><label> 이메일</label></td>
		<td><input type="text" name="hemail" id="email2" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 이름</label></td>
		<td><input type="text" name="name" id="name2" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 전화번호</label></td>
		<td><input type="text" name="phone" id="phone2" value=""></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="비밀번호 찾기" onclick="findHostPassword()"></td>
	</tr>
	</table>
	</form>
	</div>
</body>
</html>