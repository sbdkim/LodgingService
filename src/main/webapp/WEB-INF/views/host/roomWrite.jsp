<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</style>
<main>
	<div class="tap_wrapper"
		style="align-items: start; width: 1300px; margin: auto">
		<%@ include file="sub_menu_host.jsp"%>
		<div class="sub_wrapper"
			style="text-align: center; width: 1000px; margin-left: 10px">
			<article>
				<h1>객실 등록</h1>
				<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
				<form name="frm" id="room_write_form" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="aseq" value="${aseq}">
					<table id="list" border="1">
						<tr>
							<th>객실 이름</th>
							<td width="700" colspan="5"><input type="text" name="rname"
								id="rname" size="47" maxlength="100" autofocus></td>
						</tr>
						<tr>
							<th>1박 가격</th>
							<td width="70"><input type="text" name="price" id="price"
								size="11" onKeyUp='NumFormat(this)' value="10000"></td>
						</tr>
						<tr>
							<th>수용 인원</th>
							<td><input type="text" name="maxcap" id="maxcap" size="11"
								onKeyUp='NumFormat(this)' value="1"></td>
						</tr>
						<tr>
							<th>체크인 시간</th>
							<td><input type="text" name="ckintime" id="ckintime"
								size="15" onKeyUp='NumFormat(this)' value="15:00"></td>
						</tr>
						<tr>
							<th>체크아웃 시간</th>
							<td><input type="text" name="ckouttime" id="ckouttime"
								size="15" onKeyUp='NumFormat(this)' value="11:00"></td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td><input type="text" name="rooms" id="rooms" size="15"
								onKeyUp='NumFormat(this)' value="0"></td>
						</tr>
						<tr>
							<th>화장실 개수</th>
							<td><input type="text" name="bathroom" id="bathroom"
								size="15" onKeyUp='NumFormat(this)' value="1"></td>
						</tr>
						<tr>
							<th>침대 종류</th>
							<td><input type="text" name="bed" id="bed" size="30"
								placeholder="ex) 싱글 2개, 더블 1개"></td>
						</tr>
						<tr>
							<th>객실 정보</th>
							<td colspan="4">
								<input type="checkbox" name="wifi" id="input_check" value="1" checked>와이파이 &nbsp;
								<input type="checkbox" name="kitchen" id="input_check" value="0">주방&nbsp;
								<input type="checkbox" name="pool" id="input_check" value="1">수영장&nbsp;
								<input type="checkbox" name="ac" id="input_check" value="1" checked>에어컨&nbsp;
								<input type="checkbox" name="tv" id="input_check" value="1">TV&nbsp;
								<input type="checkbox" name="coffeemachine" id="input_check" value="1">커피머신
	
								<input type="checkbox" name="fridge" id="input_check" value="1">냉장고&nbsp;
								<input type="checkbox" name="bathtub" id="input_check" value="1">욕조<br>
								<input type="checkbox" name="parking" id="input_check" value="1">주방&nbsp;
								<input type="checkbox" name="heater" id="input_check" value="1">수영장&nbsp;
								<input type="checkbox" name="microwave" id="input_check" value="1">에어컨&nbsp;
								<input type="checkbox" name="kettle" id="input_check" value="1">전기포트
								<input type="checkbox" name="washer" id="input_check" value="1">세탁기&nbsp;
								<input type="checkbox" name="bbq" id="input_check" value="1">바베큐&nbsp;
	
								<input type="checkbox" name="hairdrier" id="input_check" value="1">헤어드라이어&nbsp;<br>
								<input type="checkbox" name="amenity" id="input_check" value="1" checked>어메니티&nbsp;
								<input type="checkbox" name="towel" id="input_check" value="1" checked>수건&nbsp;
								<input type="checkbox" name="elevator" id="input_check" value="1">엘리베이터&nbsp;
								<input type="checkbox" name="breakfast" id="input_check" value="1">조식&nbsp;
								<input type="checkbox" name="smoking" id="input_check" value="0" checked>금연&nbsp;
								<input type="checkbox" name="gym" id="input_check" value="1">피트니스&nbsp;
								<input type="checkbox" name="roomservice" id="input_check" value="1">룸서비스&nbsp;
							</td>
						</tr>
						<tr>
							<th>객실 이미지</th>
							<td width="343" colspan="5">
								<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  --> 
								<input type="file" name="default" id="default">
							</td>
						</tr>
					</table>
					<br>
					<br>
					<div id="buttons">
						<input class="btn" type="button" value="등록" onClick="go_save()">
						<input class="btn" type="button" value="취소" onClick="go_mov()">
					</div>
				</form>
			</article>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp"%>
</body>
</html>

<script type="text/javascript">
	//if(document.getElementById("input_check").checked){
	//	document.getElementById("input_check_hidden").disabled = true;

	//}

	function go_save() {
		if (document.getElementById("rname").value == "") {
			alert("이름을 입력하세요");
			document.getElementById("rname").focus();
			return false;
		} else if (document.getElementById("price").value == "") {
			alert("1박당 가격을 입력하세요");
			document.getElementById("price").focus();
			return false;
		} else if (document.getElementById("maxcap").value == "") {
			alert("수용 인원을 입력하세요");
			document.getElementById("maxcap").focus();
			return false;
		} else if (document.getElementById("ckintime").value == "") {
			alert("체크인 시간을 입력하세요");
			document.getElementById("ckintime").focus();
			return false;
		} else if (document.getElementById("ckouttime").value == "") {
			alert("체크아웃 시간을 입력하세요");
			document.getElementById("ckouttime").focus();
			return false;
		} else if (document.getElementById("rooms").value == "") {
			alert("방 개수를 입력하세요");
			document.getElementById("rooms").focus();
			return false;
		} else if (document.getElementById("bathroom").value == "") {
			alert("화장실 개수를 입력하세요");
			document.getElementById("bathroom").focus();
			return false;
		} else if (document.getElementById("bed").value == "") {
			alert("침대 종류를 입력하세요");
			document.getElementById("bed").focus();
			return false;
		} else {

			var form = document.getElementById("room_write_form");
			form.enctype = "multipart/form-data"; //꼭 해줘야 함!!
			form.action = "host_room_write";
			form.submit();
		}
	}

	function go_mov() {

	}
</script>