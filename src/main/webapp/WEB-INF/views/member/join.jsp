<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<main>


<div class="tap_wrapper">
<div class="sub_wrapper">
	<h1>Join Us</h1>
	<input id="tab_first" type="radio" name="tab_menu" value="tab_first"
		checked="checked"> <input id="tab_second" type="radio"
		name="tab_menu" value="tab_second"> <label for="tab_first">Guest</label>
	<label for="tab_second">Host</label>
	<div class="tab_contents" align="center">
		<div class="tab_first_content">
			<h2>Guest</h2>
			<form action="join" method="post"
				name="formm">
				<table width="500">
					<tr align="center">
						<td><b>User EMAIL</b></td>
						<td><input name="email" type="text" id="email"
							value="${email}"></td>
						<td><input type="hidden" id="reemail" value="${email}"></td>
						<td cols="2"><input type="button" value="중복체크" class="dup"
							onclick="emailcheck()"></td>
					</tr>
					<tr align="center">
						<td><b>Password</b></td>
						<td><input name="pwd" type="password" id="pwd"></td>
					</tr>
					<tr align="center">
						<td><b>Retype Password</b></td>
						<td><input type="password" name="pwdCheck" id="pwdCheck"></td>
					</tr>
					<tr align="center">
						<td><b>Phone</b></td>
						<td><input type="text" name="phone" id="phone"></td>
					</tr>
					<tr align="center">
						<td><b>Name</b></td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
				</table>
				<div id="buttons" style="display: block">
					<input type="button" value="회원가입" class="submit"
						onclick="go_save()"> <input type="reset" value="취소"
						class="cancel">
				</div>
			</form>
		</div>
		<div class="tab_second_content">
			<h2>Host</h2>
			<form style="display: flex" id="hostjoin" action="hostjoin"
				method="post" name="formm">
				<table width="500">
					<tr align="center">
						<td><b>Host EMAIL</b></td>
						<td><input name="hemail" type="text" id="hemail"
							value="${hemail}"></td>
						<td><input type="hidden" id="rehemail" value="${hemail}"></td>
						<td cols="2"><input type="button" value="중복체크" class="dup"
							onclick="hostemailcheck()"></td>
					</tr>
					<tr align="center">
						<td><b>Password</b></td>
						<td><input name="pwd" type="password" id="hostpwd"></td>
					</tr>
					<tr align="center">
						<td><b>Retype Password</b></td>
						<td><input type="password" name="pwdCheck" id="hostpwdCheck"></td>
					</tr>
					<tr align="center">
						<td><b>Phone</b></td>
						<td><input type="text" name="phone" id="hostphone"></td>
					</tr>
					<tr align="center">
						<td><b>Name</b></td>
						<td><input type="text" name="name" id="hostname"></td>
					</tr>
				</table>
				<div id="buttons" style="display: block">
					<input type="button" value="회원가입" class="submit"
						onclick="go_save_host()"> <input type="reset" value="취소"
						class="cancel">
				</div>
			</form>
		</div>
	</div>
	
	
	
	</div>
</div>

</main>


<%@ include file="../footer.jsp"%>
