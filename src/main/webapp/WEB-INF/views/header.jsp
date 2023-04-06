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
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!--구글차트  -->
  <script type="text/javascript" src="member/member.js"></script>
</head>

<body >
<div id="wrap">
  <header>
	<div id="logo">
	<img class="header-image" alt="logo" src="css/KozyNestLogo4.jpg" style="width:200px; float: left; padding: 5px;"
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

