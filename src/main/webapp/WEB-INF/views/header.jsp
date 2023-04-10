<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<style>
  body {
    animation: fadeInAnimation ease 3s;
    animation-iteration-count: 1;
    animation-fill-mode: forwards;
}
 
@keyframes fadeInAnimation {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
     }
  </style>
<meta charset="UTF-8">
<title>KozyNest : Korean Comfort Lodging</title>
 <link rel="stylesheet" type="text/css" href="css/styles.css">
  <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script> 
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!--구글차트  -->
  <script type="text/javascript" src="member/member.js"></script>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  
  <!-- jQuery -->										<!-- cdn(네트워크연결)방식으로 불러오는 것임 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <script>
  function requestPay() {
	  var result = false;
	  IMP.init("imp80657743"); // 예: imp00000000 
	  IMP.request_pay({
      pg: 'html5_inicis.INIpayTest',
      pay_method: 'card',
      merchant_uid: 'merchant_'+new Date().getTime(),   // 주문번호
      name: "KozyNest 결제",
      amount: 100,                         // 숫자 타입
      buyer_email: "${loginUser.email}",
      buyer_name: "${loginUser.name}",
      buyer_tel: "${loginUser.phone}",
      buyer_postcode: "123-456"
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
    	  console.log(rsp)
    	  alert("결제 성공")
    	  
    	  var theform = document.getElementById("book_form");
          theform.action = "booking_insert";
          theform.submit();
      } else {
    	  console.log(rsp)
          alert("결제 실패")// 결제 실패 시 로직
          result = false;
      }
    });

	return false;
  }
</script>
</head>


  
<body >


  <header>
	<div id="logo">
	<img class="header-image" id="header-image" alt="logo" src="css/KozyNestLogo4.jpg" style="width:200px; float: left; padding: 5px;"
        		onclick="location.href='index.html'">

  </div>
  <nav id="catergory_menu" style=" float: right">
    <ul>
    	<c:choose>
    	<c:when test="${empty sessionScope.loginUser && empty sessionScope.loginHost}">
    		<li><a href="login_form">로그인</a></li>
    		
    	</c:when>
    	<c:when test="${not empty sessionScope.loginHost}">
    		<li><a href="logout">로그아웃</a></li>
	      	<li><a href="host_mypage">
	      	 ${sessionScope.loginHost.name}님(마이페이지)</a>
	      	</li>
    	</c:when>
      	<c:otherwise>
	      	<li><a href="logout">로그아웃</a></li>
	      	<li><a href="mypage">
	      	 ${sessionScope.loginUser.name}님(마이페이지)</a>
	      	</li>
      	</c:otherwise>
      	</c:choose> 

	      	<li><a href="map">내 주변</a></li>

      
    </ul>
  </nav>
</header>