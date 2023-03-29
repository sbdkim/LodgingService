<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>



<div class="tap_wrapper">
	<input id="tab_first" type="radio" name="tab_menu" value="tab_first" checked="checked">
	<input id="tab_second" type="radio" name="tab_menu" value="tab_second">
	<label for="tab_first">tab01</label>
	<label for="tab_second">tab02</label>
	<div class="tab_contents">
	<div class="tab_first_content">
		<h2>Guest</h2>
		<article>
	<form method="post" action="login">
		<fieldset>
			<legend></legend>
			<label>User EMAIL</label> <input name="email" type="text"
				value="${email}"><br> <label>Password</label> <input
				name="pwd" type="password"><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="로그인" class="submit"> <input
				type="button" value="회원가입" class="cancel"
				onclick="location='contract'"> <input type="button"
				value="아이디 비밀번호 찾기" class="submit" onclick="find_id_form()">
		</div>
	</form>
</article>
	</div>
	<div class="tab_second_content">
		<h2>Host</h2>
		<article>
	<form method="post" action="login">
		<fieldset>
			<legend></legend>
			<label>Host EMAIL</label> <input name="email" type="text"
				value="${email}"><br> <label>Password</label> <input
				name="pwd" type="password"><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="로그인" class="submit"> <input
				type="button" value="회원가입" class="cancel"
				onclick="location='contract'"> <input type="button"
				value="아이디 비밀번호 찾기" class="submit" onclick="find_id_form()">
		</div>
	</form>
</article>
	</div>
	</div>
</div>



































<%@ include file="../footer.jsp"%>
