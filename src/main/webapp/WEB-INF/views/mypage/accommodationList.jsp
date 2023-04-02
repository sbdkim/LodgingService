<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
     
  <article>
      <h2> Accommodation List </h2>
      <form name="formm" method="post">
        <table id="accommodationList">
       <tr>
       <th>카테고리</th> <th>이 름</th>  <th>주 소</th> <th>전화번호</th>
       </tr>
       <c:forEach items="${accommodationList}"  var="accommodationVO">
       <tr>      
       <td> ${accommodationVO.category} </td>
        <td>
            <a href="accommodation_detail?aseq=${accommodationVO.aseq}">
              <h3> ${accommodationVO.name} </h3>              
          </a>    
        </td>
        <td> ${accommodationVO.address} </td>
        <td> ${accommodationVO.tel} </td>
       
       </tr>
       </c:forEach>
       
      </table>   
          
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="계속하기"  class="cancel"  onclick="location.href='index'">     
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>