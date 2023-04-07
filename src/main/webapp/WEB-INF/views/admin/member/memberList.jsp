<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>



<article>
	<h1>사업자리스트</h1>
	<form name="frm" id="theform" method="post">
		<table style="float: right;">
			<tr>
				

				<td>사업자 이름 <input type="text" name="key" id="key"> <input
					class="btn" type="button" value="검색" onclick="go_search()">
				</td>
			</tr>
		</table>
		<br>
		<table id="orderList">
			<tr>
				<th>
					(삭제)
				</th>

				<th>이름</th>
				<th>이메일</th>
				<th>전화</th>
				<th>가입날짜</th>

			</tr>
			<c:forEach items="${memberList}" var="memberVO">
				<tr> <!-- check boxes for status and delete - should switch with the button on top -->
				

					<td>
						<input	type="checkbox" name="delete" value="${memberVO.email}">
					</td>

					<td>${memberVO.name}</td>
					<td>${memberVO.email}</td>
					<td>${memberVO.phone}</td>
					<td>${memberVO.joindate}</td>
				</tr>
			</c:forEach>
		</table>
			
		<input type="button" class="btn"
			style="width: 200px" value="GUEST 삭제" onClick="delete_member()">

	</form>
	<%@ include file="page_area.jsp"%>
</article>







<script type="text/javascript">
function go_search()
{
   document.frm.action="admin_member_list";
   document.frm.submit();
}




function delete_member() {
	  var count = 0; // Initialize a counter variable to keep track of how many checkboxes are checked
	  
	  // Loop through all checkboxes with the name "delete" and count the number that are checked
	  for (var i = 0; i < document.frm.delete.length; i++) {
	    if (document.frm.delete[i].checked == true) {
	      count++;
	    }
	  }
	  
	  // If no checkboxes are checked, show an alert message
	  if (count == 0) {
	    alert("지울 게스트를 선택해 주세요.");
	  } 
	  // If at least one checkbox is checked, submit the form
	  else {
	    document.frm.action = "delete_member";
	    document.frm.submit();
	  }
	}
  
</script>



<%@ include file="../footer.jsp"%>
</body>
</html>