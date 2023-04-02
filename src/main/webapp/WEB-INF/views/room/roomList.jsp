<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>

<h1>숙소 검색 결과</h1>
<h2><%= request.getAttribute("accommodationName") %>의 객실 목록</h2>
<article>
<form name="roomForm" id="room_form" method="post" style="display:block">

	
	<table id="roomList" border="1" width="1000">
		<tr>
			<th width="225">Image</th><th>방 이름</th><th>가격</th><th>최대 인원</th><th>침대</th><!--  <th>사업자이메일</th><th>전화번호</th>-->
		</tr>
		<c:choose>
			<c:when test="${roomListSize<=0}">
				<tr>
					<td width="100%" colspan="5" align="center" height="23">
					등록된 방이 없습니다...
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${roomList}" var="roomVO">
				<tr>
					<c:choose>
					    <c:when test="${empty roomVO.image}">
					       <td>  <img src="room_images/default.jpg" /></td>
					      
					    </c:when>    
					    <c:otherwise>
					        <td> <img src="room_images/${roomVO.image}" /></td>
					    </c:otherwise>
					</c:choose>

					<td><a href="room_detail?rseq=${roomVO.rseq}">${roomVO.name}</a></td>
					<td>${roomVO.price}</td>
					<td>${roomVO.maxcap}</td>
					<td>${roomVO.bed}</td>
				</tr>
				</c:forEach>
				<tr><td colspan="6" style="text-align:center;"> ${paging} </td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</article>



<%@ include file="../footer.jsp"%>