<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
    <article>
    <h2> 상세 정보 </h2>
    <form name="formm" method="post">
      <h3> 업체 정보 </h3>     
      <table id="accommodationList">      
      <tr>
        <th>일련번호</th><th>이메일</th><th>이 름</th>     
     </tr>     
     <tr>  
       <td> ${accommodationList.aseq} </td>    
       <td> ${accommodationList.email} </td> 
       <td> ${accommodationList.name} </td> 
     </tr>    
     </table>      
      
     <h3>  객실 정보 </h3> 
     <table>
     <tr>
       <th>객실 번호</th><th>객실명</th><th>객실 가격</th>   
     </tr>
     <c:forEach items="${accommodationDetail}"  var="roomVO">
     <tr>
       <td> ${roomVO.rseq} </td>
 	   <td> ${roomVO.name} </td>
       <td> ${roomVO.price}</td>
     </tr>
     </c:forEach>    
     </table>   
          
     <div class="clear"></div>
     <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel" onclick="location.href='index'">
     </div>
    </form>  
  </article>
    
       
 <%@ include file="../footer.jsp" %>    