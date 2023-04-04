<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu_host.jsp" %>        
  <article>
    <h2 align="center">  '${sessionScope.loginHost.name}'님이 등록한 숙소 </h2>
    <form name="formm" method="post">
      <table id="accommodationList">
      <tr>
        <th>카테고리</th><th>이 름</th> <th>주 소</th> <th>전화번호</th> <th>상 세</th> <th colspan="3">수정하기</th>
      </tr>

      <c:forEach items="${accommodationList}"  var="accommodationVO">
      <tr>  
        <td align="center" width="100px">
        <c:choose>
        <c:when test='${accommodationVO.category==0}'>호텔/리조트</c:when> 
        <c:when test='${accommodationVO.category==1}'>모텔</c:when>
        <c:when test='${accommodationVO.category==2}'>펜션,풀빌라</c:when>
        <c:when test='${accommodationVO.category==3}'>게스트 하우스</c:when>  
        </c:choose>
		</td> 
		<td align="center" width="300px"> ${accommodationVO.aname} </td>
		<td align="center" width="500px"> ${accommodationVO.address} </td>
		<td align="center" width="100px"> ${accommodationVO.tel} </td>
		<td align="center" width="100px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 조 회 </a></td>
		<td align="center" width="50px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 등 록 / </a></td>
		<td align="center" width="50px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 수 정 / </a></td>
		<td align="center" width="40px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 삭 제 </a></td>
      </tr>
      </c:forEach>    
      </table>   
    </form>  
  </article>
<%@ include file="../footer.jsp" %>    