<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<%@ include file="sub_img.html"%> 
<%@ include file="sub_menu.html" %>   
  <article>
    <h2>Join Us</h2>
    <form id="join" action="join" method="post" name="formm">
      <fieldset>
        <legend>Basic Info</legend>
        <label>User EMAIL</label>
        <input type="text"      name="email"  id="email" value="${email}"  size="12"  >
        <input type="hidden"    name="reemail" id="reemail" value="${reemail}">
        <input type="button"    value="중복 체크"  class="dup" onclick="emailcheck()"><br>
        <label>Password</label> 
        <input type="password"  name="pwd" id="pwd"><br> 
        <label>Retype Password</label> 
        <input type="password"  name="pwdCheck" id="pwdCheck"><br> 
        <label>Phone</label>
        <input type="text" name="phone" id="phone"><br> 
        <label>Name</label>
        <input type="text" name="name" id="name"><br> 
      </fieldset>

      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="회원가입"   class="submit" onclick="go_save()"> 
        <input type="reset"      value="취소"     class="cancel">
      </div>
      <br>
    </form>
  </article>
<%@ include file="../footer.jsp" %>
  