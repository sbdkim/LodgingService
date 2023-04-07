<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<main>
<div class="tap_wrapper" align="center" style="display: inline-block">
	<input id="tab_first" type="radio" name="tab_menu" value="tab_first" checked="checked">
	<input id="tab_second" type="radio" name="tab_menu" value="tab_second">
	<label for="tab_first">Guest</label>
	<label for="tab_second">Host</label>
	<div class="tab_contents" align="center">
	<div class="tab_first_content">
	
	
		<h2>Guest</h2>
		<article>
	<form method="post" action="login">
		<fieldset>
			<legend></legend>
			<table>
			 <tr>
			 <td><label>User email</label> </td>
			 <td><input name="email" type="text"></td>
			 </tr> 
			 <tr>
			 <td><label>Password</label> </td>
			 <td><input name="pwd" type="password"></td>
			 </tr> 
			 </table>		
		</fieldset>
		
		<div id="buttons">
			<input type="submit" value="로그인" class="submit"> 
			<input type="button" value="회원가입" class="cancel" onclick="location='contract'">
			<input type="button" value="이메일/비밀번호 찾기" class="submit" onclick="find_email_form()">
		</div>
	</form>
</article>
	</div>
	<div class="tab_second_content">
		<h2>Host</h2>
		<article>
	<form method="post" action="hostlogin">
		<fieldset>
			<legend></legend>		
			<table>
			 <tr>
			 <td><label>Host email</label> </td>
			 <td><input name="hemail" type="text"></td>
			 </tr> 
			 <tr>
			 <td><label>Password</label> </td>
			 <td><input	name="pwd" type="password"></td>
			 </tr> 
			 </table>
		</fieldset>
		<div id="buttons">
			<input type="submit" value="로그인" class="submit">
			<input type="button" value="회원가입" class="cancel" onclick="location='contract'">
			<input type="button" value="이메일/비밀번호 찾기" class="submit" onclick="find_host_email_form()">
		</div>
	</form>
</article>
	</div>
	</div>
</div>
</main>
<%@ include file="../footer.jsp"%>