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
</head>

<header>
	<img class="header-image" alt="logo" src="css/KozyNestLogo4.jpg" style="width:200px; float: left; padding: 5px;"
        		onclick="location.href='${pageContext.request.contextPath}/search/main'">

  <nav style=" float: right">
    <ul>
    	<li><a href="#">로그인</a></li>
    <li><a href="#">예약내역</a></li>
      <li><a href="#">내 주변</a></li>
      
      
    </ul>
  </nav>
</header>



<body>


