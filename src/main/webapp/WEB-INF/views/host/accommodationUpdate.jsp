<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
	
	tr:nth-child(odd):hover td {
		/*background:#FFCDC3;*/
		
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
	
	#category{
	width: 80px;
	font-size: 18px;
  	font-weight: 300;
	margin-left: 1px;

}
input[type="text"] {
width: 300px;
}
	
	
	
</style>
<main>
	<div class="tap_wrapper" style="align-items: start; width: 1300px; margin: auto; padding-top: 50px">
	<%@ include file="sub_menu_host.jsp" %> 
		<div class="sub_wrapper" style="text-align:center; width: 1000px ; margin-left: 10px">
			<article>
				<h1>숙소 수정</h1>
				<form name="frm" id="acc_update_form" method="post" enctype="multipart/form-data">
					<input type="hidden" name="aseq" value="${accommodationVO.aseq}">
					<input type="hidden" name="email"> 
					<input type="hidden" name="nonmakeImg" value="${accommodationVO.aimage}">
					<input type="hidden" name="bestyn" value="${accommodationVO.bestyn}">
	
					<table id="list" border="1">
						<tr>
							<th>카테고리</th>
							<td colspan="5"><select name="category" id="category">
									<c:forEach items="${categoryList}" var="category"
										varStatus="status">
										<c:choose>
											<c:when test="${accommodationVO.category==status.count}">
												<option value="${status.count}" selected="selected">${category}</option>
											</c:when>
											<c:otherwise>
												<option value="${status.count}">${category}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>이 름</th>
							<td width="343" colspan="5">
								<input type="text" name="aname" id="aname" size="150" maxlength="500" value="${accommodationVO.aname}">
							</td>
						</tr>
						<tr>
							<th>주 소</th>
							<td width="343" colspan="5">
								<input type="text" name="address" id="address" size="150" maxlength="100" value="${accommodationVO.address}">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td width="343" colspan="5">
								<input type="text" name="tel" id="tel" size="47" maxlength="100" value="${accommodationVO.tel}">
							</td>
						</tr>
						<tr>
							<th>업체 이미지</th>
							<td colspan="5">
								<img src="accommodation_images/${accommodationVO.aimage}" width="200pt"> 
								<br>
								<input type="file" name="accommodation_images" id="accommodation_images">
								<input type="hidden" name="image" value="${accommodationVO.aimage}">
							</td>
						</tr>
					</table>
					
				</form>
			</article>
			<br><br>
				<div id="buttons">
					<input class="btn" type="button" value="수정" onClick="go_mod_save('${accommodationVO.aseq}')">
					<input class="btn" type="button" value="취소" onClick="history.back(1)">
				</div>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	function go_mod_save(aseq) {
		if (document.getElementById("category").value == "") {
			alert("카테고리를 입력하세요");
			document.getElementById("kind").focus();
			return false;
		} else if (document.getElementById("aname").value == "") {
			alert("이름을 입력하세요");
			document.getElementById("aname").focus();
			return false;
		} else if (document.getElementById("address").value == "") {
			alert("주소를 입력하세요");
			document.getElementById("address").focus();
			return false;
		} else if (document.getElementById("tel").value == "") {
			alert("전화번호를 입력하세요");
			document.getElementById("tel").focus();
			return false;
		} else {
			var form = document.getElementById("acc_update_form");

			form.enctype = "multipart/form-data";
			form.action = "host_acc_update";
			form.submit();
		}
	}
</script>