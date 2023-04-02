<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>        
  <article>
    <h2 align="center">  '${sessionScope.loginHost.name}'님이 등록한 숙소 </h2>
    <form name="formm" method="post">
      <table id="accommodationList">
      <tr>
        <th>카테고리</th><th>이 름</th> <th>주 소</th> <th>전화번호</th> <th>상 세</th>   
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
		<td align="center" width="300px"> ${accommodationVO.name} </td>
		<td align="center" width="500px"> ${accommodationVO.address} </td>
		<td align="center" width="100px"> ${accommodationVO.tel} </td>
		<td align="center" width="100px"> <a href="accommodation_detail?aseq=${accommodationVO.aseq}"> 조 회 </a></td>
      </tr>
      </c:forEach>    
      </table>   
      <br><br>    
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  onclick="location.href='index'"> 
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>    