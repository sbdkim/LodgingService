<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KozyNest Admin</title>
<link rel="stylesheet" href="admin/css/admin.css">
<!-- <link rel="stylesheet" href="admin/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글 차트 사용 -->

</head>

<body onload="go_ab()">  
	<div id="wrap">
		<header>			
			<div id="logo">
				
					<img style="width:800px" src="admin/images/bar_01.gif" onclick="location.href='index.html'">

			</div>	
			<input class="btn" type="button"  value="logout"  style="float: right;"
			   onClick="location.href='admin_logout'">			
		</header>
		<div class="clear"></div>