<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>



<article>
	<h1>사업자리스트</h1>
	<form name="frm" id="theform" method="post">
		<table style="float: right;">
			<tr>
				<c:if test="${empty button2.visible}">
					<td id="button1" style="display: none"><input type="button"
						class="btn" style="width: 200px" value="승인 기능"
						onClick="show_approve_checkbox()"></td>
				</c:if>
				<c:if test="${empty button1.visible}">

					<td id="button2"><input type="button" class="btn"
						style="width: 200px" value="삭제 기능"
						onClick="show_delete_checkbox()"></td>
				</c:if>


				<td>사업자 이름 <input type="text" name="key" id="key" value="${key}"> <input
					class="btn" type="button" value="검색" onclick="go_search()">
				</td>
			</tr>
		</table>
		<br>
		<table id="orderList">
			<tr>
				<th>
					<div id = th1 style="display: inline">(승인여부)</div>
					<div id = th2 style="display: none">(삭제)</div>
				</th>
				
				
				
				<th>이름</th>
				<th>이메일</th>
				<th>전화</th>

			</tr>
			<c:forEach items="${hostList}" var="hostVO">
				<tr> <!-- check boxes for status and delete - should switch with the button on top -->
				
					<td name="statuscheck" style="display: inline">
						<c:choose>
							<c:when test='${hostVO.status=="0"}'>
								<input type="checkbox" name="status" value="${hostVO.hemail}">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="status2" checked="checked"
									disabled="disabled">
							</c:otherwise>
						</c:choose>
					</td>

					<td name="deletecheck" style="display: none">
						<input	type="checkbox" name="delete" value="${hostVO.hemail}">
					</td>

					<td>${hostVO.name}</td>
					<td>${hostVO.hemail}</td>
					<td>${hostVO.phone}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" id="button3" class="btn" style="width: 200px" value="HOST 승인"
			onClick="approve_host()"> 
			
		<input type="button" id="button4" class="btn"
			style="width: 200px; display:none" value="HOST 삭제" onClick="delete_host()">

	</form>
	<%@ include file="page_area.jsp"%>
</article>







<script type="text/javascript">
function go_search()
{
	document.frm.action="admin_hostList";
   document.frm.submit();
}


function approve_host() {
  var count = 0; // Initialize a counter variable to keep track of how many checkboxes are checked
	  
  for (var i = 0; i < document.frm.status.length; i++) {
	    if (document.frm.status[i].checked == true) {
	      count++;
	    }
	  }
	  
	  // If no checkboxes are checked, show an alert message
	  if (count == 0) {
	    alert("승인할 호스트를 선택해 주세요.");
	  } 
	  // If at least one checkbox is checked, submit the form
	  else {
		console.log(count)
	    var form = document.getElementById("theform");
	    form.action = "approve_host_save";
	    form.submit();
	  }
	}




function delete_host() {
	  var count = 0; // Initialize a counter variable to keep track of how many checkboxes are checked
	  
	  // Loop through all checkboxes with the name "delete" and count the number that are checked
	  for (var i = 0; i < document.frm.delete.length; i++) {
	    if (document.frm.delete[i].checked == true) {
	      count++;
	    }
	  }
	  
	  // If no checkboxes are checked, show an alert message
	  if (count == 0) {
	    alert("지울 호스트를 선택해 주세요.");
	  } 
	  // If at least one checkbox is checked, submit the form
	  else {
	    document.frm.action = "delete_host";
	    document.frm.submit();
	  }
	}

  function show_approve_checkbox() {
	  document.getElementById('button1').style.display = 'none';
	  document.getElementById('button2').style.display = 'inline';
	  document.getElementById('button3').style.display = 'inline';
	  document.getElementById('button4').style.display = 'none';

	  document.getElementById('th1').style.display = 'inline';
	  document.getElementById('th2').style.display = 'none';
	  var statusCheckboxes = document.getElementsByName("statuscheck");
	  var deleteCheckboxes = document.getElementsByName("deletecheck");

	  for (var i = 0; i < statusCheckboxes.length; i++) {
	    statusCheckboxes[i].style.display = "inline";
	    deleteCheckboxes[i].style.display = "none";
	  }
	  
	  


	}

  function show_delete_checkbox() {
	  document.getElementById('button1').style.display = 'inline';
	  document.getElementById('button2').style.display = 'none';
	  document.getElementById('button3').style.display = 'none';
	  document.getElementById('button4').style.display = 'inline';

	  document.getElementById('th1').style.display = 'none';
	  document.getElementById('th2').style.display = 'inline';

	  
	  var statusCheckboxes = document.getElementsByName("statuscheck");
	  var deleteCheckboxes = document.getElementsByName("deletecheck");

	  for (var i = 0; i < statusCheckboxes.length; i++) {
	    statusCheckboxes[i].style.display = "none";
	    deleteCheckboxes[i].style.display = "inline";
	  }
	  
	  
	  
	  
	  

	}
  
</script>



<%@ include file="../footer.jsp"%>
</body>
</html>