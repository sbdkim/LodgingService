<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 

<style>
/*table */
/*** Table Styles **/
.table-fill {
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	height: 320px;
	margin: auto;
	max-width: 600px;
	padding: 5px;
	width: 100%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

th {
	color: #D5DDE5;;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 23px;
	font-weight: 100;
	padding: 24px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

th:first-child {
	border-top-left-radius: 3px;
}

th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 16px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:first-child {
	border-top: none;
}

tr:last-child {
	border-bottom: none;
}

tr:nth-child(odd) td {
	background: #EBEBEB;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

td {
	background: #FFFFFF;
	padding: 20px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 18px;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
}

td:last-child {
	border-right: 0px;
}
</style>

<main>
	<div class="tap_wrapper" style="align-items: start">
	<%@ include file="sub_menu.jsp" %> 
		<div class="sub_wrapper" style="text-align:center; width: 1100px ; margin-left: 10px;">
<article>
<h2> 1:1 문의 </h2>
  <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 해드립니다.</h3>
  <form name="formm" method="post" action="qna_write">
       <table border="1">
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
</div>
</div>
</main>
<%@ include file="../footer.jsp"%>