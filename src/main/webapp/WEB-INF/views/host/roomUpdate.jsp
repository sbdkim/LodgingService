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
</style>
<main>
	<div class="tap_wrapper"
		style="align-items: start; width: 1300px; margin: auto; padding-top: 50px;">
		<%@ include file="sub_menu_host.jsp"%>
		<div class="sub_wrapper"
			style="text-align: center; width: 1000px; margin-left: 10px">
			<article>
				<h1>객실 수정</h1>
				<form name="frm" id="room_update_form" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="rseq" value="${roomVO.rseq}"> <input
						type="hidden" name="aseq" value="${roomVO.aseq}"> <input
						type="hidden" name="hemail"> <input type="hidden"
						name="nonmakeImg" value="${roomVO.rimage}">
					<!-- 기존 이미지 저장  -->
					<table id="list" border="1">
						<tr>
							<th>객실 이름</th>
							<td width="700"><input type="text" name="rname" id="rname"
								size="100" maxlength="500" value="${roomVO.rname}"></td>
						</tr>
						<tr>
							<th>1박 가격</th>
							<td><input type="text" name="price" id="price" size="47"
								maxlength="100" value="${roomVO.price}"></td>
						</tr>
						<tr>
							<th>수용 인원</th>
							<td><input type="text" name="maxcap" id="maxcap" size="47"
								maxlength="100" value="${roomVO.maxcap}"></td>
						</tr>
						<tr>
							<th>체크인 시간</th>
							<td><input type="text" name="ckintime" id="ckintime"
								size="15" value="${roomVO.ckintime}"></td>
						</tr>
						<tr>
							<th>체크아웃 시간</th>
							<td><input type="text" name="ckouttime" id="ckouttime"
								size="15" value="${roomVO.ckouttime}"></td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td><input type="text" name="rooms" id="rooms" size="47"
								maxlength="100" value="${roomVO.rooms}"></td>
						</tr>
						<tr>
							<th>화장실 개수</th>
							<td><input type="text" name="bathroom" id="bathroom"
								size="47" maxlength="100" value="${roomVO.bathroom}"></td>
						</tr>
						<tr>
							<th>침 대</th>
							<td><input type="text" name="bed" id="bed" size="47"
								maxlength="100" value="${roomVO.bed}"></td>
						</tr>
						<tr>
							<th>객실 정보</th>
							<td><input type="checkbox" name="wifi" id="input_check"
								value="1">와이파이 &nbsp; <input type="checkbox"
								name="kitchen" id="input_check" value="1">주방&nbsp; <input
								type="checkbox" name="pool" id="input_check" value="1">수영장&nbsp;

								<input type="checkbox" name="ac" id="input_check" value="1">에어컨&nbsp;

								<input type="checkbox" name="tv" id="input_check" value="1">TV&nbsp;

								<input type="checkbox" name="coffeemachine" id="input_check"
								value="1">커피머신 <input type="checkbox" name="fridge"
								id="input_check" value="1">냉장고&nbsp; <input
								type="checkbox" name="bathtub" id="input_check" value="1">욕조<br>

								<input type="checkbox" name="parking" id="input_check" value="1">주방&nbsp;

								<input type="checkbox" name="heater" id="input_check" value="1">수영장&nbsp;

								<input type="checkbox" name="microwave" id="input_check"
								value="1">에어컨&nbsp; <input type="checkbox" name="kettle"
								id="input_check" value="1">전기포트 <input type="checkbox"
								name="washer" id="input_check" value="1">세탁기&nbsp; <input
								type="checkbox" name="bbq" id="input_check" value="1">바베큐&nbsp;

								<input type="checkbox" name="hairdrier" id="input_check"
								value="1">헤어드라이어&nbsp;<br> <input type="checkbox"
								name="amenity" id="input_check" value="1">어메니티&nbsp; <input
								type="checkbox" name="towel" id="input_check" value="1">수건&nbsp;

								<input type="checkbox" name="elevator" id="input_check"
								value="1">엘리베이터&nbsp; <input type="checkbox"
								name="breakfast" id="input_check" value="1">조식&nbsp; <input
								type="checkbox" name="smoking" id="input_check" value="0">금연&nbsp;

								<input type="checkbox" name="gym" id="input_check" value="1">피트니스&nbsp;

								<input type="checkbox" name="roomservice" id="input_check"
								value="1">룸서비스&nbsp;</td>
						</tr>
						<tr>
							<th>객실 이미지</th>
							<td><img src="room_images/${roomVO.rimage}" width="200pt">
								<br> <input type="file" name="room_images" id="room_images">
								<input type="hidden" name="image" value="${roomVO.rimage}">
							</td>
						</tr>
					</table>
					<br>
					<br>
					<div id="buttons">
						<input class="btn" type="button" value="수정"
							onClick="go_mod_save('${roomVO.rseq}')"> <input
							class="btn" type="button" value="취소" onClick="go_mov()">
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
	function go_mod_save(rseq) {
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
			var form = document.getElementById("room_update_form");
			form.enctype = "multipart/form-data"; //꼭 해줘야 함!!
			form.action = "host_room_update";
			form.submit();
		}
	}
</script>