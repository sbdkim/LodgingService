<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<meta charset="UTF-8">   
  <nav id="sub_menu_host" style="float:left; display:block; text-align: center; margin-top: 50px">
  <h1> 예약 Setting</h1>
    <ul style="display: flex; flex-direction: column;">
		<li><a href="#" onclick="location.href='host_booking_detail?status=3&aseq=${aseq}'">지난 예약 내역</a></li>  
		<li><a href="#" onclick="location.href='host_booking_detail?status=1&aseq=${aseq}'">진행 중인 예약 내역</a></li> 
    </ul>
  </nav> 