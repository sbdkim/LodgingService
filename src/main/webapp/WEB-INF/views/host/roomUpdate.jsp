<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu_host.jsp"%>

<article>
<h1>객실 수정</h1>  
<form name="frm" id="room_update_form" method="post" enctype="multipart/form-data">
<input type="hidden" name="rseq" value="${roomVO.rseq}">
<input type="hidden" name="aseq" value="${roomVO.aseq}">
<input type="hidden" name="hemail" >
<input type="hidden" name="nonmakeImg" value="${roomVO.rimage}"> <!-- 기존 이미지 저장  -->
<table id="list">
  <tr>
    <th>객실 이름</th>
    <td>
      <input type="text" name="rname" id="rname" size="100" maxlength="500" value="${roomVO.rname}">
    </td>
  </tr>
  <tr>
    <th>1박 가격</th>
    <td>
      <input type="text" name="price" id="price" size="47" maxlength="100" value="${roomVO.price}">
    </td> 
  </tr>
  <tr>
    <th>수용 인원</th>
    <td>
      <input type="text" name="maxcap" id="maxcap" size="47" maxlength="100" value="${roomVO.maxcap}">
    </td> 
  </tr>
  <tr>
  <th>체크인 시간</th>
  <td>
    <input type="text" name="ckintime" id="ckintime" size="15" value="${roomVO.ckintime}">
  </td>
  <th>체크아웃 시간</th>
  <td>
    <input type="text" name="ckouttime" id="ckouttime" size="15" value="${roomVO.ckouttime}">
  </td>
</tr> 
  <tr>
    <th>방 개수</th>
    <td>
      <input type="text" name="rooms" id="rooms" size="47" maxlength="100" value="${roomVO.rooms}">
    </td> 
  </tr>
  <tr>
    <th>화장실 개수</th>
    <td>
      <input type="text" name="bathroom" id="bathroom" size="47" maxlength="100" value="${roomVO.bathroom}">
    </td> 
  </tr>
  <tr>
    <th>침  대</th>
    <td>
      <input type="text" name="bed" id="bed" size="47" maxlength="100" value="${roomVO.bed}">
    </td> 
  </tr>
  <tr>
    <th>객실 정보</th>
    <td>
      <input type="checkbox" name="wifi" id="input_check" value="1">와이파이 &nbsp;
      
      <input type="checkbox" name="kitchen" id="input_check" value="1">주방&nbsp;
      
      <input type="checkbox" name="pool" id="input_check" value="1">수영장&nbsp;
      
      <input type="checkbox" name="ac" id="input_check" value="1" >에어컨&nbsp;
      
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
      
      <input type="checkbox" name="amenity" id="input_check" value="1">어메니티&nbsp;
      
      <input type="checkbox" name="towel" id="input_check" value="1">수건&nbsp;
      
      <input type="checkbox" name="elevator" id="input_check" value="1">엘리베이터&nbsp;
      
      <input type="checkbox" name="breakfast" id="input_check" value="1">조식&nbsp;
      
      <input type="checkbox" name="smoking" id="input_check" value="0">금연&nbsp;
      
      <input type="checkbox" name="gym" id="input_check" value="1">피트니스&nbsp;
      
      <input type="checkbox" name="roomservice" id="input_check" value="1">룸서비스&nbsp;
      
    </td>
  </tr>
  <tr>
    <th>객실 이미지</th>
    <td>
      <img src="room_images/${roomVO.rimage}" width="200pt">     
      <br>
      <input type="file" name="room_images" id="room_images">
      <input type="hidden" name="image" value="${roomVO.rimage}">
    </td> 
  </tr>    
</table>
<input class="btn" type="button" value="수정" onClick="go_mod_save('${roomVO.rseq}')">           
<input class="btn" type="button" value="취소" onClick="go_mov()">
</form> 
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>
<script type="text/javascript">
function go_mod_save(rseq) {
	if(document.getElementById("rname").value=="") {
		alert("이름을 입력하세요");
		document.getElementById("rname").focus();
		return false;
	} else if(document.getElementById("price").value=="") {
		alert("1박당 가격을 입력하세요");
		document.getElementById("price").focus();
		return false;
	} else if(document.getElementById("maxcap").value=="") {
		alert("수용 인원을 입력하세요");
		document.getElementById("maxcap").focus();
		return false;
	} else if(document.getElementById("ckintime").value=="") {
		alert("체크인 시간을 입력하세요");
		document.getElementById("ckintime").focus();
		return false;
	} else if(document.getElementById("ckouttime").value=="") {
		alert("체크아웃 시간을 입력하세요");
		document.getElementById("ckouttime").focus();
		return false;
	} else if(document.getElementById("rooms").value=="") {
		alert("방 개수를 입력하세요");
		document.getElementById("rooms").focus();
		return false;
	} else if(document.getElementById("bathroom").value=="") {
		alert("화장실 개수를 입력하세요");
		document.getElementById("bathroom").focus();
		return false;
	} else if(document.getElementById("bed").value=="") {
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