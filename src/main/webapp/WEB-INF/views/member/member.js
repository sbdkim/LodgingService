/**
 * 
 */
// 약관 동의여부 확인
function go_next() {
	if (document.formm.okon1[0].checked == true) {// 동의함이 선택된 경우
		document.formm.action = "join_form"; // 요청 URL
		document.formm.submit(); // Controller로 요청
	} else if (document.formm.okon1[1].checked == true) {
		alert("약관에 동의하셔야 합니다.");
	}
}

// 사용자 EMAIL 중복체크 화면 표시
function emailcheck() {
	if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요.");
		document.getElementById("email").focus(); // 입력 대기
		return false;
	}
	// EMAIL 중복확인 화면 요청
	// url - Controller 요청하는 URL
	// _blank_ - 새로운 윈도우를 생성하여 표시
	var url = "email_check_form?email=" + document.getElementById("email").value;
	window.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}

// 사업자 EMAIL 중복체크 화면 표시
function hostemailcheck() {
	if (document.getElementById("hemail").value == "") {
		alert("이메일을 입력해 주세요.");
		document.getElementById("hemail").focus(); // 입력 대기
		return false;
	}
	// EMAIL 중복확인 화면 요청
	// url - Controller 요청하는 URL
	// _blank_ - 새로운 윈도우를 생성하여 표시
	var url = "host_email_check_form?hemail=" + document.getElementById("hemail").value;
	window.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}


//회원 가입시 필수입력 확인
function go_save() {
	if (document.getElementById("email").value == "") {
		alert("사용자 이메일을 입력해 주세요.");
		document.getElementById("email").focus();
		return false;
	} else if (document.getElementById("reemail").value == ""){
		alert("이메일 중복체크를 해주세요.");
		document.getElementById("email").focus();
		return false;
	} else if (document.getElementById("pwd").value == ""){
		alert("비밀번호를 입력해 주세요.");
		document.getElementById("pwd").focus();
		return false;
	} else if (document.getElementById("pwd").value != document.getElementById("pwdCheck").value){
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("pwdCheck").focus();
		return false;
	} else if (document.getElementById("phone").value == ""){
		alert("전화번호를 입력해 주세요.");
		document.getElementById("phone").focus();
		return false;
	} else if (document.getElementById("name").value == ""){
		alert("이름을 입력해 주세요.");
		document.getElementById("name").focus();
		return false;
	} else {
		document.getElementById("join").action = "join";
		document.getElementById("join").submit();
	}
}

//회원 가입시 필수입력 확인
function go_save_host() {
	if (document.getElementById("hemail").value == "") {
		alert("사업자 이메일을 입력해 주세요.");
		document.getElementById("hemail").focus();
		return false;
	} else if (document.getElementById("rehemail").value == ""){
		alert("이메일 중복체크를 해주세요.");
		document.getElementById("hemail").focus();
		return false;
	} else if (document.getElementById("hostpwd").value == ""){
		alert("비밀번호를 입력해 주세요.");
		document.getElementById("hostpwd").focus();
		return false;
	} else if (document.getElementById("hostpwd").value != document.getElementById("hostpwdCheck").value){
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("hostpwdCheck").focus();
		return false;
	} else if (document.getElementById("hostphone").value == ""){
		alert("전화번호를 입력해 주세요.");
		document.getElementById("hostphone").focus();
		return false;
	} else if (document.getElementById("hostname").value == ""){
		alert("이름을 입력해 주세요.");
		document.getElementById("hostname").focus();
		return false;
	} else {
		document.getElementById("hostjoin").action = "hostjoin";
		document.getElementById("hostjoin").submit();
	}
}

// 아이디, 비밀번호 찾기 화면 요청
function find_email_form() {
	var url = "find_email_form";
	window.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=450");
}

function findMemberEmail() {
	if (document.getElementById("name").value=="") {
		alert("이름을 입력해 주세요.")
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("phone").value=="") {
		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone").focus();
		return false;
	} else {
		var form = document.getElementById("findEmail");
		form.action = "find_email";
		form.submit();
	}
}

function findPassword() {
	if (document.getElementById("email2").value==""){
		alert("아이디를 입력해 주세요.")
		document.getElementById("email2").focus();
		return false;
	} else if (document.getElementById("name2").value=="") {
		alert("이름을 입력해 주세요.")
		document.getElementById("name2").focus();
		return false;
	} else if (document.getElementById("phone2").value=="") {
		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone2").focus();
		return false;
	} else {
		var form = document.getElementById("findPW");
		form.action = "find_pwd";
		form.submit();
	}
}

function changePassword() {
	if (document.getElementById("pwd").value=="") {
		alert("비밀번호를 입력해 주세요.");
		document.getElementById("pwd").focus();
		return false;
	} else if (document.getElementById("pwd").value != document.getElementById("pwdcheck").value) {
		alert("비밀번호가 맞지 않습니다.");
		documnet.getElementById("pwd").focuse();
		return false;
	} else {
		var form = document.getElementById("pwd_form");
		form.action = "change_pwd";
		form.submit();
	}
}

// 사업자아이디, 비밀번호 찾기 화면 요청
function find_host_email_form() {
	var url = "find_host_email_form";
	window.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=450");
}

function findHostEmail() {
	if (document.getElementById("name").value=="") {
		alert("이름을 입력해 주세요.")
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("phone").value=="") {
		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone").focus();
		return false;
	} else {
		var form = document.getElementById("findHostEmail");
		form.action = "find_host_email";
		form.submit();
	}
}

function findHostPassword() {
	if (document.getElementById("email2").value==""){
		alert("아이디를 입력해 주세요.")
		document.getElementById("email2").focus();
		return false;
	} else if (document.getElementById("name2").value=="") {
		alert("이름을 입력해 주세요.")
		document.getElementById("name2").focus();
		return false;
	} else if (document.getElementById("phone2").value=="") {
		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone2").focus();
		return false;
	} else {
		var form = document.getElementById("findHostPW");
		form.action = "find_host_pwd";
		form.submit();
	}
}

function changeHostPassword() {
	if (document.getElementById("pwd").value=="") {
		alert("비밀번호를 입력해 주세요.");
		document.getElementById("pwd").focus();
		return false;
	} else if (document.getElementById("pwd").value != document.getElementById("pwdcheck").value) {
		alert("비밀번호가 맞지 않습니다.");
		documnet.getElementById("pwd").focuse();
		return false;
	} else {
		var form = document.getElementById("host_pwd_form");
		form.action = "change_host_pwd";
		form.submit();
	}
}
