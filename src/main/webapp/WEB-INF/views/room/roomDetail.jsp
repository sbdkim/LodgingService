<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 객실상세정보 </h2>
    <form name="formm" method="post" action="booking">
    	<input type="hidden" name="rseq" value="${roomDetail.rseq}">
    	<input type="hidden" name="checkin" value="${checkin}">
    	<input type="hidden" name="checkout" value="${checkout}">
      <table id="roomDetail" align="center" border="1" width="500">      
      <tr>
        <td rowspan="6" width="225" height="225">
	        <c:choose>
				<c:when test="${empty roomDetail.rimage}"><img src="room_images/default.jpg" /></c:when>    
				<c:otherwise><img src="room_images/${roomDetail.rimage}" /></c:otherwise>
			</c:choose>
		</td>
		<td><b>객실명</b></td>
		<td>${roomDetail.rname}</td>
     </tr>
      <tr>
        <td><b>가격</b></td><td>${roomDetail.price}</td>
     </tr>
      <tr>
        <td><b>수용 인원</b></td><td>${roomDetail.maxcap}</td>
     </tr>
      <tr>
        <td><b>체크인</b></td><td>${roomDetail.ckintime}</td>
     </tr>
      <tr>
        <td><b>체크아웃</b></td><td>${roomDetail.ckouttime}</td>
     </tr>
     <tr>
        <td><b>침대</b></td><td>${roomDetail.bed}</td>
     </tr>
      <tr>
        <td colspan="3"><b>시설 및 서비스</b></td>
     </tr>
     <tr>
     	<td colspan="3" height="200">
     		<c:choose>
     			<c:when test='${roomDetail.wifi=="1"}'>와이파이&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.kitchen=="1"}'>주방(가스)&nbsp;</c:when>
     			<c:when test='${roomDetail.kitchen=="2"}'>주방(인덕션)&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.pool=="1"}'>수영장&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.ac=="1"}'>에어컨&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.tv=="1"}'>TV&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.coffeemachine=="1"}'>커피머신&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.fridge=="1"}'>냉장고&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.bathtub=="1"}'>욕조&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.parking=="1"}'>주차&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.heater=="1"}'>난방&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.microwave=="1"}'>전자레인지&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.kettle=="1"}'>전기포트&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.washer=="1"}'>세탁기&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.bbq=="1"}'>바비큐&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.hairdrier=="1"}'>헤어드라이어&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.amenity=="1"}'>어메니티&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.towel=="1"}'>수건&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.elevator=="1"}'>엘리베이터&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.breakfast=="1"}'>조식&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.smoking=="1"}'>흡연&nbsp;</c:when>
     			<c:otherwise>금연&nbsp;</c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.gym=="1"}'>피트니스&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		<c:choose>
     			<c:when test='${roomDetail.roomservice=="1"}'>룸서비스&nbsp;</c:when>
     			<c:otherwise></c:otherwise>
     		</c:choose>
     		
     	</td>
     </tr>
     </table>      
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input type="submit" value="예약하기">
       <input type="button"   value="다른 객실 보기" onclick="history.back(1)">
     </div>
    </form>  
  </article>

       
       
       
       
       
       
       
       
 <%@ include file="../footer.jsp" %>    