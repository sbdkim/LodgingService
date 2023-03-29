<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KozyNest : Korean Comfort Lodging</title>
 <link rel="stylesheet" type="text/css" href="css/styles.css">
  <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script> 
  <script type="text/javascript" src="member/member.js"></script>
</head>

<body>
<div id="wrap">
  <header>
	<div id="logo">
	<img class="header-image" alt="logo" src="css/KozyNestLogo4.jpg" style="width:200px; float: left; padding: 5px;"
        		onclick="location.href='index.html'">

  </div>
  <nav id="catergory_menu" style=" float: right">
    <ul>
    	<c:choose>
    	<c:when test="${empty sessionScope.loginUser}">
    	<li><a href="login_form">로그인</a></li>
    	<li><a href="#">예약내역</a></li>
      	<li><a href="#">내 주변</a></li>
      	</c:when>
      	<c:otherwise>
      	<li>
      	 ${sessionScope.loginUser.name}(${sessionScope.loginUser.id })
      	</li>
      	</c:otherwise>
      	</c:choose> 
      
    </ul>
  </nav>
</header>


</body>
</html>


