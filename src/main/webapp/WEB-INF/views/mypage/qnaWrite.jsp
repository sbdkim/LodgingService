<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<%@ include file="sub_menu.jsp" %> 
<article>
<h2> 1:1 문의 </h2>
  <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 해드립니다.</h3>
  <form name="formm" method="post" action="qna_write">
       <table>
		<tr>
			<td align="right"> 제목 </td>
			<td colspan='2'><input type='text' name='subject' size='67' maxlength="50"></td>
		</tr>
		<tr>
			<td align="right" valign="top"><br> 내용 </td>
			<td colspan="2"><textarea rows="10" cols="65" name='content'></textarea></td>
		</tr>
		
		<tr>
			<td align="right"> </td>
			<td colspan="2">
				<input type='submit' value='글쓰기'>
				<input type='button' id='List' value='취소' onclick="location.href='qna_list'">
				<input type="button"  value="예약 계속하기"  class="submit"  onclick="location.href='index'">
			</td>
		</tr>
	</table>
      

  </form>

</article>

<%@ include file="../footer.jsp" %>