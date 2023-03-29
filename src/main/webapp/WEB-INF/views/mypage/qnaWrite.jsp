<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<article>
<h2> 1:1 문의 </h2>
  <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 해드립니다.</h3>
  <form name="formm" method="post" action="qna_write">
       <table>
		<tr>
			<td align="right"> 제목 </td>
			<td colspan='2'><input type='text' name='title' size='67' maxlength="50"></td>
		</tr>
		<tr>
			<td align="right" valign="top"><br> 내용 </td>
			<td colspan="2"><textarea rows="10" cols="65" name='content'></textarea></td>
		</tr>
		
		<tr>
			<td align="right"> </td>
			<td colspan="2">
				<input type='submit' value='글쓰기'>
				<input type='button' id='list' value='목록'>
			</td>
		</tr>
	</table>
      <div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
			<input type="button"  value="쇼핑 계속하기"  class="submit"  onclick="location.href='index'">	
		</div>


  </form>

</article>

<%@ include file="../footer.jsp" %>